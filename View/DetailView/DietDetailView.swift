import SwiftUI

struct DietDetailView: View {
    let diet: Dıyet

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                Image(diet.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 220)

                Text(diet.name)
                    .font(.title)
                    .bold()
                    .foregroundColor(diet.color)

                Text(diet.describe)
                    .font(.body)
                    .multilineTextAlignment(.leading)

                Spacer()
            }
            .padding()
        }
        .navigationTitle(diet.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
