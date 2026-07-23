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
            description: "At a minimum, most adults need about 1 ounce of sunscreen — roughly the amount to fill a shot glass — to fully cover skin not covered by clothing. Depending on your body size, you may need more sunscreen to protect your exposed skin from the sun’s harmful rays. When applying sunscreen to your face, use at least 1 teaspoon (about the amount needed to cover the length of your index and middle fingers). Rub the sunscreen thoroughly into your skin."
        ),
        SunscreenTip(
            icon: "clock.fill",
            title: "apply before going out",
            description: "It takes approximately 15 minutes for your skin to absorb the sunscreen and protect you. If you wait until you are in the sun to apply sunscreen, your skin is unprotected and can burn"
        ),
        SunscreenTip(
            icon: "arrow.triangle.2.circlepath",
            title: "reapply every two hours",
            description: "People who get sunburned usually didn't reapply, used too little sunscreen, or used an expired sunscreen. Your skin is exposed to the sun's harmful UV rays every time you go outside, even on cloudy days and in the winter. So whether you are on vacation or taking a brisk walk in your neighborhood, remember to use sunscreen."
        ),
        SunscreenTip(
            icon: "face.smiling",
            title: "apply in all places not covered by clothing",
            description: "Remember your neck, face, ears, tops of your feet, and legs. For hard‐to‐reach areas like your back, ask someone to help you or use a spray sunscreen. If you have thinning hair, either apply sunscreen to your scalp or wear a wide‐brimmed hat. To protect your lips, apply a lip balm with an SPF of at least 30."
        ),
        SunscreenTip(
            icon: "sun.max.fill",
            title: "check the SPF",
            description: "Choose a sunscreen that has an SPF of 30 or higher, is water resistant, and provides broad-spectrum (UVA and UVB rays) coverage. When this sunscreen is also a tinted sunscreen with iron oxide, you better protect your skin from developing dark spots. Iron oxide protects your skin from the sun’s visible light."
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
        .navigationTitle("sunscreen tips")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        SunscreenInfoView()
    }
}
