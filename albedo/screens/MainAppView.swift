//
//  MainAppView.swift
//  sunsafe
//
//  Created by DPI Student 011 on 7/22/26.
//


import SwiftUI

enum City: String, CaseIterable, Identifiable, Equatable {
    case newYork = "new york"
    case chicago = "chicago"

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
    @State private var citySearchText: String = ""
    @FocusState private var searchIsFocused: Bool

    // Mocks scalability — only NY/Chicago have real data right now,
    // but the search bar is built to filter against a longer list.
    private var filteredCities: [City] {
        if citySearchText.isEmpty {
            return City.allCases
        }
        return City.allCases.filter {
            $0.rawValue.localizedCaseInsensitiveContains(citySearchText)
        }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // City search bar
                VStack(alignment: .leading, spacing: 8) {
                    Text("city")
                        .font(.headline)

                    HStack(spacing: 8) {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.secondary)
                        TextField("find your city", text: $citySearchText)
                            .focused($searchIsFocused)
                            .textInputAutocapitalization(.words)
                            .autocorrectionDisabled()
                        if !citySearchText.isEmpty {
                            Button {
                                citySearchText = ""
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .padding(10)
                    .background(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                    // Selected city chip, shown when not actively searching
                    if !searchIsFocused {
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(.orange)
                            Text(selectedCity.rawValue)
                                .font(.subheadline.bold())
                            Spacer()
                        }
                        .padding(.horizontal, 4)
                    }

                    // Suggestion list, shown while the search bar is focused
                    if searchIsFocused {
                        VStack(spacing: 0) {
                            if filteredCities.isEmpty {
                                Text("no matching cities")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                    .padding()
                            } else {
                                ForEach(filteredCities) { city in
                                    Button {
                                        selectedCity = city
                                        citySearchText = ""
                                        searchIsFocused = false
                                    } label: {
                                        HStack {
                                            Image(systemName: "mappin.circle.fill")
                                                .foregroundStyle(.orange)
                                            Text(city.rawValue)
                                                .foregroundStyle(.primary)
                                            Spacer()
                                        }
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 12)
                                    }
                                    if city != filteredCities.last {
                                        Divider()
                                    }
                                }
                            }
                        }
                        .background(Color(.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }

                // Day picker
                VStack(alignment: .leading, spacing: 8) {
                    Text("date")
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
                    Text("select a date to see the UV forecast.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .padding(.top, 4)
                }

                Divider()
                    .padding(.top, 4)

                // Placeholder — body silhouette goes here
                VStack(spacing: 8) {
                    Text("Mark your coverage")
                        .font(.headline)
                }
                .frame(maxWidth: .infinity, minHeight: 300)
                .background(Color(.secondarySystemBackground).opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            .padding()
        }
        .navigationTitle("albedo")
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
