//
//  CategoryProfessionalPage.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 9.06.2026.
//

import Foundation
import SwiftUI

struct CategoryMeal: Identifiable {
    let id = UUID()
    let name: String
    let kcal: String
    let icon: String
}

struct CategoryProfessionalPage: View {
    let title: String
    let subtitle: String
    let imageName: String
    let color: Color
    let meals: [CategoryMeal]
    let tips: [String]

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {

                headerSection

                mealSection

                tipsSection
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }

    private var headerSection: some View {
        ZStack {
            LinearGradient(
                colors: [
                    color,
                    color.opacity(0.65)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            HStack(spacing: 18) {
                VStack(alignment: .leading, spacing: 12) {
                    Text(title)
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(.white)

                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.9))
                        .lineLimit(3)

                    HStack(spacing: 6) {
                        Image(systemName: "sparkles")
                        Text("Smart Plate Category")
                    }
                    .font(.caption.weight(.semibold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 7)
                    .background(.white.opacity(0.22))
                    .clipShape(Capsule())
                }

                Spacer()

                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 115, height: 115)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(.white.opacity(0.8), lineWidth: 3)
                    )
                    .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 5)
            }
            .padding(22)
        }
        .frame(height: 220)
        .clipShape(RoundedRectangle(cornerRadius: 32))
        .shadow(color: color.opacity(0.35), radius: 14, x: 0, y: 8)
        .padding(.top, 10)
    }

    private var mealSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Önerilen Besinler")
                .font(.title3)
                .fontWeight(.bold)

            VStack(spacing: 14) {
                ForEach(meals) { meal in
                    HStack(spacing: 14) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(color.opacity(0.14))
                                .frame(width: 56, height: 56)

                            Image(systemName: meal.icon)
                                .foregroundColor(color)
                                .font(.title3)
                        }

                        VStack(alignment: .leading, spacing: 5) {
                            Text(meal.name)
                                .font(.headline)

                            Text(meal.kcal)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }

                        Spacer()

                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray.opacity(0.6))
                    }
                    .padding(15)
                    .background(Color(.systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 22))
                    .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
                }
            }
        }
    }

    private var tipsSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Beslenme İpuçları")
                .font(.title3)
                .fontWeight(.bold)

            VStack(spacing: 12) {
                ForEach(tips, id: \.self) { tip in
                    HStack(alignment: .top, spacing: 12) {
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(color)

                        Text(tip)
                            .font(.subheadline)
                            .foregroundColor(.primary)

                        Spacer()
                    }
                    .padding(15)
                    .background(Color(.systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                    .shadow(color: .black.opacity(0.03), radius: 6, x: 0, y: 3)
                }
            }
        }
    }
}
