//
//  personBarHome.swift
//  AkıllıTabak
//
//  Created by Bahar Atbaş on 21.10.2025.
//

import SwiftUI

struct personBarhome: View{
    var body: some View {
        NavigationStack{
            ZStack(alignment: .bottom) {
                Image("akıllıTabak")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                HStack(spacing: 20) {
                    NavigationLink(destination: personNavbar())  {
                        Text("Kayıt Ol")
                            .frame(width: 140, height: 45)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .fontWeight(.semibold)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.green, lineWidth: 2)
                            )
                    }
                    
                    NavigationLink(destination: personSıngIn()) {
                        Text("Giriş Yap")
                            .frame(width: 140, height: 45)
                            .background(Color.white)
                            .foregroundColor(.green)
                            .cornerRadius(12)
                            .fontWeight(.semibold)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.green, lineWidth: 2)
                            )
                    }
                }
                .padding(.bottom, 50)
            }
        }}
}
#Preview {
    personBarhome()
}
