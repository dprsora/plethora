//
//  ContentView.swift
//  sunsafe
//
//  Created by DPI Student 011 on 7/22/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack() {
                Spacer()

                Image(systemName: "sun.max.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 90)
                    .foregroundStyle(.orange)

                VStack(spacing: 8) {
                    Text("albedo")
                        .font(.system(size: 40, weight: .bold, design: .rounded))

                    Text("sun safety made simple")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                }

                Spacer()

                VStack(spacing: 14) {
                    NavigationLink {
                        MainApp()
                    } label: {
                        Text("check my risk")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.orange)
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                    }

                    NavigationLink {
                        Menu()
                    } label: {
                        Text("menu")
                            .font(.headline)
                            .foregroundStyle(.orange)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.orange.opacity(0.12))
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                    }
                }
                .padding()
                .padding()
            }
        }
    }
}

#Preview {
    HomeView()
}

