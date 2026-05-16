//
//  ConfettiView.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 16.05.2026.
//

import SwiftUI

struct ConfettiView: View {

    @State private var animate = false

    var body: some View {

        ZStack {
            ForEach(0..<20, id: \.self) { _ in
                Circle()
                    .fill(Color.green)
                    .frame(width: 8, height: 8)
                    .position(
                        x: CGFloat.random(in: 0...400),
                        y: animate ? 800 : -50
                    )
                    .animation(
                        .linear(duration: 1.2)
                        .repeatCount(1, autoreverses: false),
                        value: animate
                    )
            }
        }
        .onAppear {
            animate = true
        }
    }
}
