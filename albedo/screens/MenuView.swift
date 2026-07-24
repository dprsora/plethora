//
//  Menu.swift
//  albedo
//
//  Created by DPI Student 011 on 7/23/26.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack(spacing: 14) {
            NavigationLink {
                MainApp()
            } label: {
                Text("check my risk")
                    .font(.headline)
                    .foregroundStyle(.orange)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 14))
            }

            NavigationLink {
                SunscreenInfo()
            } label: {
                Text("sunscreen 101")
                    .font(.headline)
                    .foregroundStyle(.orange)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 14))
            }
            
            NavigationLink {
                SunscreenTimer()
            } label: {
                Text("sunscreen timer")
                    .font(.headline)
                    .foregroundStyle(.orange)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 14))
            }
            
            NavigationLink {
                SunscreenTimer()
            } label: {
                Text("application checker")
                    .font(.headline)
                    .foregroundStyle(.orange)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 14))
            }

            Spacer()
        }
        .padding()
        .navigationTitle("albedo")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        Menu()
    }
}
