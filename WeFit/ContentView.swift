//
//  ContentView.swift
//  WeFit
//
//  Created by Yugantar Jain on 12/06/22.
//

import SwiftUI

struct ContentView: View {
	@StateObject private var viewModel = ContentViewModel()

	var information: some View {
		HStack(spacing: 30) {
			VStack {
				Image(systemName: "sun.max.fill")
				Text(viewModel.weather.currentWeather.condition)
			}

			VStack {
				Text(viewModel.weather.currentWeather.uvIndex)
				Text("UV Index")
			}

			VStack {
				Text(viewModel.weather.currentWeather.visibility)
				Text("Visibility")
			}
		}
		.frame(width: 340)
		.font(.title2).bold()
		.padding(15)
		.background(.ultraThinMaterial)
		.cornerRadius(12)
	}

	var progress: some View {
		VStack {
			ProgressView(value: 20, total: 250)
				.tint(.red)
				.scaleEffect(x: 1, y: 2, anchor: .center)
				.padding(5)
			Text("Today's Goal 🎯")
		}
		.frame(width: 340)
		.font(.title2).bold()
		.padding(15)
		.background(.ultraThinMaterial)
		.cornerRadius(12)
	}

	var suggestions: some View {
		HStack {
			VStack(alignment: .leading, spacing: 10) {
				Text("Suggested Activites")
					.font(.title).bold()
					.padding(.vertical, 5)

				HStack {
					Text("Gym 🏋️‍♀️")
					Spacer()
					Text("30 mins | 250 cal")
				}

				HStack {
					Text("Swimming 🏊‍♀️")
					Spacer()
					Text("30 mins | 250 cal")
				}

				HStack {
					Text("Recovery 🤍")
					Spacer()
					Text("Sleep and recover")
				}
			}

			Spacer()
		}
		.frame(width: 340)
		.font(.title2)
		.fontWeight(.medium)
		.padding(15)
		.background(.ultraThinMaterial)
		.cornerRadius(12)
	}

	var weekPlan: some View {
		HStack {
			VStack(alignment: .leading, spacing: 10) {
				Text("Plan your week")
					.font(.title).bold()
					.padding(.vertical, 5)

				ForEach(viewModel.weather.dailyWeather) { weather in
					HStack {
						Text(weather.displayDay)
						Spacer()
						Text(weather.lowToHigh).foregroundStyle(.secondary)
						Spacer()
						Text(weather.activities2)
					}
				}
			}

			Spacer()
		}
		.frame(width: 340)
		.font(.title2)
		.fontWeight(.medium)
		.padding(15)
		.background(.ultraThinMaterial)
		.cornerRadius(12)
	}

    var body: some View {
		ZStack {
			Image("sunny")
				.resizable()
				.scaledToFill()
				.ignoresSafeArea()

			ScrollView {
				Text(viewModel.weather.cityName)
					.font(.largeTitle)
					.bold()

				Text(viewModel.weather.currentWeather.temperature)
					.font(.system(size: 64))
					.bold()

				information
					.foregroundStyle(.secondary)

				progress

				suggestions

				weekPlan
			}
			.padding(.top, 20)
			.foregroundColor(.white)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
