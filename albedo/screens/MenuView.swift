//
//  Menu.swift
//  albedo
//
//  Created by DPI Student 011 on 7/23/26.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
                VStack(spacing: 14) {
                    NavigationLink {
                        MainAppView()
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
                        MenuView()
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

#Preview {
    MenuView()
}
