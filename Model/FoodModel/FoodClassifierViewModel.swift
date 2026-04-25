//
//  FoodClassifierViewModel.swift
//  AkıllıTabak
//
//  Created by Codex on 19.04.2026.
//

import Foundation
import UIKit
import Vision
import CoreML
import CoreImage

@MainActor
final class FoodClassifierViewModel: ObservableObject {
    @Published var selectedImage: UIImage?
    @Published var predictionText: String = "Henüz analiz yapılmadı."
    @Published var confidenceText: String = ""
    @Published var isAnalyzing: Bool = false
    @Published var errorMessage: String?

    enum FoodClassifierError: LocalizedError {
        case invalidImageData
        case modelOutputEmpty
        case modelLoadFailed(String)

        var errorDescription: String? {
            switch self {
            case .invalidImageData:
                return "Gorsel CGImage formatina donusturulemedi."
            case .modelOutputEmpty:
                return "Modelden siniflandirma sonucu donmedi."
            case .modelLoadFailed(let reason):
                return "Model yükleme hatası: \(reason)"
            }
        }
    }

    func analyzeSelectedImage() {
        guard let selectedImage else {
            errorMessage = "Lütfen önce bir görsel seçin."
            return
        }

        isAnalyzing = true
        errorMessage = nil
        predictionText = "Analiz başlıyor..."

        Task {
            do {
                let result = try await basitAnaliz(image: selectedImage)
                predictionText = "Tahmin: \(formattedIdentifier(result.yemekAdi))"
                confidenceText = "Doğruluk: %\(Int(result.confidence * 100))"
                isAnalyzing = false
            } catch let error as FoodClassifierError {
                isAnalyzing = false
                errorMessage = error.errorDescription ?? error.localizedDescription
                predictionText = "❌ Hata"
            } catch {
                isAnalyzing = false
                errorMessage = "Bilinmeyen hata: \(error.localizedDescription)"
                predictionText = "❌ Hata"
            }
        }
    }

    /// basitAnaliz() yerine gecen Vision + CoreML siniflandirma fonksiyonu.
    /// - Parameter image: Kullanici tarafindan secilen UIImage.
    /// - Returns: (yemekAdi, confidence) formatinda en iyi tahmin sonucu.
    nonisolated func basitAnaliz(image: UIImage) async throws -> (yemekAdi: String, confidence: Double) {
        let cgImage: CGImage
        if let imageCG = image.cgImage {
            cgImage = imageCG
        } else if let ciImage = image.ciImage {
            let context = CIContext(options: nil)
            guard let convertedCGImage = context.createCGImage(ciImage, from: ciImage.extent) else {
                throw FoodClassifierError.invalidImageData
            }
            cgImage = convertedCGImage
        } else {
            throw FoodClassifierError.invalidImageData
        }

        print("🔍 [DEBUG] CGImage boyutu: \(cgImage.width)x\(cgImage.height)")

        // ================================
        // STEP 1: Model dosyasını yükle
        // ================================
        let modelURL: URL
        do {
            // Tüm Bundle Resources'ları debug output'ı
            print("🔎 [DEBUG] Bundle.main'da arama başlıyor...")
            
            // Önce .mlmodel arama
            if let bundleURL = Bundle.main.url(forResource: "FoodClassifier", withExtension: "mlmodel") {
                modelURL = bundleURL
                print("✅ [DEBUG] FoodClassifier.mlmodel Bundle'da bulundu: \(bundleURL.path)")
            } 
            // Sonra .mlpackage arama
            else if let bundleURL = Bundle.main.url(forResource: "FoodClassifier", withExtension: "mlpackage") {
                modelURL = bundleURL
                print("✅ [DEBUG] FoodClassifier.mlpackage Bundle'da bulundu: \(bundleURL.path)")
            } 
            // Xcode Auto-Generated sınıfını kullan
            else {
                print("⚠️ [WARNING] Model dosyası Bundle'da bulunamadı.")
                print("   Xcode'da şunları kontrol ediniz:")
                print("   1. FoodClassifier.mlmodel dosyası proje klasöründe mı?")
                print("   2. Xcode Project > Build Phases > Copy Bundle Resources ekli mi?")
                print("   3. Target Membership ayarı doğru mu?")
                print("   Şimdi FoodClassifier Auto-Generated sınıfını kullanmayı deniyorum...")
                
                let coreMLModel = try FoodClassifier(configuration: MLModelConfiguration()).model
                let visionModel = try VNCoreMLModel(for: coreMLModel)
                return try await performClassification(with: visionModel, cgImage: cgImage, image: image)
            }
        }

        // ================================
        // STEP 2: Model dosyasından MLModel oluştur
        // ================================
        let compiledModelURL: URL
        do {
            compiledModelURL = try MLModel.compileModel(at: modelURL)
            print("✅ [DEBUG] Model derlenmiş: \(compiledModelURL.path)")
        } catch {
            print("❌ [ERROR] Model derle hatası: \(error)")
            throw FoodClassifierError.modelLoadFailed("Model derleme hatası: \(error.localizedDescription)")
        }

        let coreMLModel: MLModel
        do {
            coreMLModel = try MLModel.load(contentsOf: compiledModelURL, configuration: MLModelConfiguration())
            print("✅ [DEBUG] CoreML modeli yüklendi")
        } catch {
            print("❌ [ERROR] CoreML model yükleme hatası: \(error)")
            throw FoodClassifierError.modelLoadFailed(error.localizedDescription)
        }

        // ================================
        // STEP 3: Vision Framework ile sınıflandırma
        // ================================
        let visionModel: VNCoreMLModel
        do {
            visionModel = try VNCoreMLModel(for: coreMLModel)
            print("✅ [DEBUG] VNCoreMLModel oluşturuldu")
        } catch {
            print("❌ [ERROR] VNCoreMLModel oluşturma hatası: \(error)")
            throw FoodClassifierError.modelLoadFailed(error.localizedDescription)
        }

        return try await performClassification(with: visionModel, cgImage: cgImage, image: image)
    }

    /// Vision + CoreML classification işlemi
    nonisolated private func performClassification(
        with visionModel: VNCoreMLModel,
        cgImage: CGImage,
        image: UIImage
    ) async throws -> (yemekAdi: String, confidence: Double) {
        return try await withCheckedThrowingContinuation { continuation in
            let request = VNCoreMLRequest(model: visionModel) { request, error in
                if let error {
                    print("❌ [ERROR] VNCoreMLRequest hatası: \(error)")
                    continuation.resume(throwing: error)
                    return
                }

                guard let observations = request.results as? [VNClassificationObservation], !observations.isEmpty else {
                    print("❌ [ERROR] Modelden sonuç alınamadı")
                    continuation.resume(throwing: FoodClassifierError.modelOutputEmpty)
                    return
                }

                print("🎯 [DEBUG] Toplam tahmin: \(observations.count)")
                observations.sorted(by: { $0.confidence > $1.confidence }).prefix(3).forEach { obs in
                    print("  → \(obs.identifier): %\(Int(obs.confidence * 100))")
                }

                let best = observations.max(by: { $0.confidence < $1.confidence })!
                print("✅ [FINAL] En yüksek: '\(best.identifier)' = \(String(format: "%.2f", best.confidence))")

                continuation.resume(returning: (yemekAdi: best.identifier, confidence: Double(best.confidence)))
            }

            request.imageCropAndScaleOption = .centerCrop

            DispatchQueue.global(qos: .userInitiated).async {
                do {
                    let handler = VNImageRequestHandler(cgImage: cgImage, orientation: image.cgImageOrientation, options: [:])
                    print("📸 [DEBUG] VNImageRequestHandler.perform() başlıyor...")
                    try handler.perform([request])
                } catch {
                    print("❌ [ERROR] Handler.perform() hatası: \(error)")
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func formattedIdentifier(_ identifier: String) -> String {
        identifier
            .replacingOccurrences(of: "_", with: " ")
            .capitalized
    }
}

private extension UIImage {
    var cgImageOrientation: CGImagePropertyOrientation {
        switch imageOrientation {
        case .up: return .up
        case .down: return .down
        case .left: return .left
        case .right: return .right
        case .upMirrored: return .upMirrored
        case .downMirrored: return .downMirrored
        case .leftMirrored: return .leftMirrored
        case .rightMirrored: return .rightMirrored
        @unknown default: return .up
        }
    }
}
