//
//  SunscreenInfoView.swift
//  sunsafe
//
//  Created by DPI Student 011 on 7/22/26.
//

import SwiftUI

struct SunscreenTip: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let description: String
}

enum SunscreenTips {
    static let all: [SunscreenTip] = [
        SunscreenTip(
            icon: "drop.fill",
            title: "use enough product",
            description: "Use a full shot glass for your body and two finger-lengths for your face. Rub it in thoroughly and reapply often, as sunburns usually happen when people use too little or forget to put on more."
        ),
        SunscreenTip(
            icon: "clock.fill",
            title: "apply before going out",
            description: "It takes approximately 15 minutes for your skin to absorb the sunscreen and protect you. If you wait until you are in the sun to apply sunscreen, your skin is unprotected and can burn."
        ),
        SunscreenTip(
            icon: "arrow.triangle.2.circlepath",
            title: "reapply every two hours",
            description: "People who get sunburned usually didn't reapply, used too little sunscreen, or used an expired sunscreen. Your skin is exposed to the sun's harmful UV rays every time you go outside, even on cloudy days and in the winter."
        ),
        SunscreenTip(
            icon: "face.smiling",
            title: "apply in all places not covered by clothing",
            description: "Don't forget easy-to-miss areas like your neck, ears, legs, feet, and scalp—or wear a wide-brimmed hat. Use an SPF 30+ balm for your lips, and use a spray or ask for help with your back."
        ),
        SunscreenTip(
            icon: "sun.max.fill",
            title: "check the SPF",
            description: "Choose a sunscreen that has an SPF of 30 or higher, is water resistant, and provides broad-spectrum (UVA and UVB rays) coverage. Choosing a tinted version with iron oxide provides extra protection against dark spots and visible light."
        ),
    ]
}

struct SunscreenInfoView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("sunscreen 101")
                        .font(.largeTitle.bold())
                    Text("from board-certified dermatologists at \nthe American Academy of Dermatology")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(.top, 8)

                ForEach(SunscreenTips.all) { tip in
                    HStack(alignment: .top, spacing: 14) {
                        Image(systemName: tip.icon)
                            .font(.title2)
                            .foregroundStyle(.orange)
                            .frame(width: 32)

                        VStack(alignment: .leading, spacing: 4) {
                            Text(tip.title)
                                .font(.headline)
                            Text(tip.description)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .padding()
                    .background(Color.orange.opacity(0.07))
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 24)
        }
        .navigationTitle("albedo")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        SunscreenInfoView()
    }
}
