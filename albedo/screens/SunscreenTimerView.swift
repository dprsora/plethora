//
//  SunscreenTimer.swift
//  albedo
//
//  Created by DPI Student 011 on 7/23/26.
//

import SwiftUI

struct SunscreenTimer: View {
    static let increment: TimeInterval = 2 * 60 * 60 // 2 hours

    @State private var timeRemaining: TimeInterval = SunscreenTimer.increment
    @State private var isRunning = false
    @State private var timer: Timer?

    private var progress: Double {
        1 - (timeRemaining / SunscreenTimer.increment)
    }

    private var formattedTime: String {
        let hours = Int(timeRemaining) / 3600
        let minutes = (Int(timeRemaining) % 3600) / 60
        let seconds = Int(timeRemaining) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }

    var body: some View {
        VStack(spacing: 28) {
            Spacer()

            VStack(spacing: 8) {
                Text("sunscreen timer")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                Text("reapply every 2 hours for full protection.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
            }

            ZStack {
                Circle()
                    .stroke(Color.orange.opacity(0.15), lineWidth: 16)

                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(Color.orange, style: StrokeStyle(lineWidth: 16, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(.linear(duration: 1), value: progress)

                VStack(spacing: 6) {
                    Text(formattedTime)
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .monospacedDigit()
                    Text(timeRemaining == 0 ? "time to reapply!" : (isRunning ? "running" : "paused"))
                        .font(.subheadline)
                        .foregroundStyle(timeRemaining == 0 ? .red : .secondary)
                }
            }
            .frame(width: 220, height: 220)
            .padding(.vertical, 8)

            Spacer()

            VStack(spacing: 14) {
                Button {
                    isRunning ? stop() : start()
                } label: {
                    Text(isRunning ? "stop" : "start")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(isRunning ? Color.red : Color.orange)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }

                Button {
                    reset()
                } label: {
                    Text("reset to 2:00:00")
                        .font(.headline)
                        .foregroundStyle(.orange)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange.opacity(0.12))
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 40)
        }
        .navigationTitle("albedo")
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear { stop() }
    }

    private func start() {
        guard timeRemaining > 0 else { return }
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                stop()
            }
        }
    }

    private func stop() {
        isRunning = false
        timer?.invalidate()
        timer = nil
    }

    private func reset() {
        stop()
        timeRemaining = SunscreenTimer.increment
    }
}

#Preview {
    NavigationStack {
        SunscreenTimer()
    }
}
