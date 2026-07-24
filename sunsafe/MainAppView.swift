//
//  MainAppView.swift
//  sunsafe
//
//  Created by DPI Student 011 on 7/22/26.
//

import SwiftUI

enum City: String, CaseIterable, Identifiable {
    case newYork = "New York"
    case chicago = "Chicago"

    var id: String { self.rawValue }
}

// Common shape used by this view so NYDailyWeather and ChiDailyWeather
// (currently separate structs) can be handled the same way.
struct DaySummary: Identifiable {
    let id = UUID()
    let label: String
    let date: String
    let uvIndex: Double
    let condition: String
}

extension City {
    var days: [DaySummary] {
        switch self {
        case .newYork:
            return NewYorkWeather.lastWeek.map {
                DaySummary(label: $0.label, date: $0.date, uvIndex: $0.uvIndex, condition: $0.condition)
            }
        case .chicago:
            return ChicagoWeather.lastWeek.map {
                DaySummary(label: $0.label, date: $0.date, uvIndex: $0.uvIndex, condition: $0.condition)
            }
        }
    }
}

func uvRiskLabel(_ uv: Double) -> (text: String, color: Color) {
    switch uv {
    case ..<3:
        return ("Low", .green)
    case 3..<6:
        return ("Moderate", .yellow)
    case 6..<8:
        return ("High", .orange)
    case 8..<11:
        return ("Very High", .red)
    default:
        return ("Extreme", .purple)
    }
}

struct MainAppView: View {
    @State private var selectedCity: City = .newYork
    @State private var selectedDay: DaySummary?

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // City picker
                VStack(alignment: .leading, spacing: 8) {
                    Text("City")
                        .font(.headline)

                    Picker("City", selection: $selectedCity) {
                        ForEach(City.allCases) { city in
                            Text(city.rawValue).tag(city)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                // Day picker
                VStack(alignment: .leading, spacing: 8) {
                    Text("Date")
                        .font(.headline)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(selectedCity.days) { day in
                                let isSelected = day.id == selectedDay?.id
                                VStack(spacing: 4) {
                                    Text(day.label)
                                        .font(.caption.bold())
                                    Text(day.date)
                                        .font(.caption2)
                                        .foregroundStyle(.secondary)
                                }
                                .padding(.vertical, 10)
                                .padding(.horizontal, 14)
                                .background(isSelected ? Color.orange : Color.orange.opacity(0.1))
                                .foregroundStyle(isSelected ? .white : .primary)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .onTapGesture { selectedDay = day }
                            }
                        }
                    }
                }

                // Selected day summary
                if let day = selectedDay {
                    let risk = uvRiskLabel(day.uvIndex)
                    VStack(spacing: 10) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("\(selectedCity.rawValue) · \(day.date)")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                Text(day.condition)
                                    .font(.headline)
                            }
                            Spacer()
                            VStack(alignment: .trailing, spacing: 4) {
                                Text("UV Index")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                Text(String(format: "%.1f", day.uvIndex))
                                    .font(.title.bold())
                            }
                        }

                        HStack {
                            Text(risk.text)
                                .font(.subheadline.bold())
                                .foregroundStyle(.white)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(risk.color)
                                .clipShape(Capsule())
                            Spacer()
                        }
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                } else {
                    Text("Select a date to see the UV forecast.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .padding(.top, 4)
                }

                Divider()
                    .padding(.top, 4)

                // Placeholder — body silhouette goes here
                VStack(spacing: 10) {
                    Text("Mark your coverage")
                        .font(.headline)
                    Image("silhouette")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 280)
                }
                .frame(maxWidth: .infinity, minHeight: 300)
                .background(Color(.secondarySystemBackground).opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            .padding()
        }
        .navigationTitle("SunSafe")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            if selectedDay == nil {
                selectedDay = selectedCity.days.first
            }
        }
        .onChange(of: selectedCity) { _, newCity in
            selectedDay = newCity.days.first
        }
    }
}

#Preview {
    NavigationStack {
        MainAppView()
    }
}
