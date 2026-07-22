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
            title: "Use Enough Product",
            description: "Most people apply less than half of what's needed. Aim for about one ounce (a shot glass full) to cover your whole body."
        ),
        SunscreenTip(
            icon: "clock.fill",
            title: "Apply 15–30 Minutes Early",
            description: "Sunscreen needs time to bind to skin before UV exposure starts working against it. Apply before you head outside, not after."
        ),
        SunscreenTip(
            icon: "arrow.triangle.2.circlepath",
            title: "Reapply Every 2 Hours",
            description: "Reapply at least every two hours, and immediately after swimming, sweating heavily, or toweling off — even 'water resistant' formulas wear down."
        ),
        SunscreenTip(
            icon: "face.smiling",
            title: "Don't Forget Commonly Missed Zones",
            description: "Ears, back of the neck, hairline, tops of feet, and hands are the most frequently skipped spots."
        ),
        SunscreenTip(
            icon: "sun.max.fill",
            title: "Check the SPF",
            description: "SPF 30 blocks about 97% of UVB rays; SPF 50 blocks about 98%. Going higher than 50 has diminishing returns — consistent reapplication matters more than the number."
        ),
        SunscreenTip(
            icon: "tshirt.fill",
            title: "Clothing Counts Too",
            description: "Tightly woven, darker fabrics block more UV than sunscreen alone. Combining both gives the strongest protection in high-UV zones like shoulders and back."
        )
    ]
}

struct SunscreenInfoView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("sunscreen 101")
                        .font(.largeTitle.bold())
                    Text("from boared-certified dermatologists")
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
