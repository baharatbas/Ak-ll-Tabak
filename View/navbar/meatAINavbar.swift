//
//  meatAI.swift
//  AkıllıTabak
//
//  Created by Bahar Atbaş on 15.10.2025.
//

import SwiftUI
import PhotosUI

struct meatAI: View {
    @StateObject private var viewModel = FoodClassifierViewModel()
    @State private var selectedPhotoItem: PhotosPickerItem?

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Yemek Analizi")
                        .font(.largeTitle)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)

                    imagePreview

                    PhotosPicker(selection: $selectedPhotoItem, matching: .images) {
                        Label("Galeriden Görsel Seç", systemImage: "photo.on.rectangle")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(.systemGray6))
                            .foregroundStyle(.primary)
                            .cornerRadius(14)
                    }
                    .onChange(of: selectedPhotoItem) { _, newItem in
                        Task {
                            if let data = try? await newItem?.loadTransferable(type: Data.self),
                               let image = UIImage(data: data) {
                                viewModel.selectedImage = image
                                viewModel.predictionText = "Görsel seçildi. Analiz için butona basın."
                                viewModel.confidenceText = ""
                                viewModel.errorMessage = nil
                            }
                        }
                    }

                    Button(action: viewModel.analyzeSelectedImage) {
                        HStack {
                            if viewModel.isAnalyzing {
                                ProgressView()
                                    .tint(.white)
                            }
                            Text(viewModel.isAnalyzing ? "Analiz Ediliyor..." : "Analize Gönder")
                                .bold()
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(viewModel.isAnalyzing ? Color.gray : Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(14)
                    }
                    .disabled(viewModel.isAnalyzing)

                    resultCard
                }
                .padding()
            }
            .navigationTitle("Akıllı Tabak")
        }
    }

    private var imagePreview: some View {
        Group {
            if let selectedImage = viewModel.selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, minHeight: 220, maxHeight: 280)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            } else {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemGray6))
                    .frame(height: 240)
                    .overlay {
                        VStack(spacing: 8) {
                            Image(systemName: "photo")
                                .font(.system(size: 36))
                                .foregroundStyle(.gray)
                            Text("Analiz için bir yemek görseli seçin")
                                .foregroundStyle(.gray)
                        }
                    }
            }
        }
    }

    private var resultCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Sonuç")
                .font(.headline)

            Text(viewModel.predictionText)
                .font(.body)

            if !viewModel.confidenceText.isEmpty {
                Text(viewModel.confidenceText)
                    .foregroundStyle(.secondary)
            }

            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundStyle(.red)
                    .font(.footnote)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(16)
    }
}
#Preview {
    meatAI()
}
