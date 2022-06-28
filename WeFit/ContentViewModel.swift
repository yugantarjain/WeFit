//
//  ContentViewModel.swift
//  WeFit
//
//  Created by Yugantar Jain on 12/06/22.
//

import SwiftUI

final class ContentViewModel: ObservableObject {
	let munichWeather = WeatherData(
		cityName: "Cologne",
		currentWeather: CurrentWeather(temperature: "24°", condition: "Sunny", uvIndex: "5", visibility: "16 km"),
		dailyWeather: [
			DailyWeather(day: "Mon", low: "23°", high: "27°", condition: "Sunny", uvIndex: "5"),
			DailyWeather(day: "Tue", low: "13°", high: "21°", condition: "Rainy", uvIndex: "1"),
			DailyWeather(day: "Wed", low: "17°", high: "23°", condition: "Mostly Sunny", uvIndex: "4"),
			DailyWeather(day: "Thu", low: "20°", high: "25°", condition: "Sunny", uvIndex: "5"),
			DailyWeather(day: "Fri", low: "20°", high: "24°", condition: "Cloudy", uvIndex: "3"),
			DailyWeather(day: "Sat", low: "22°", high: "26°", condition: "Sunny", uvIndex: "5"),
			DailyWeather(day: "Sun", low: "23°", high: "27°", condition: "Sunny", uvIndex: "5")
		]
	)

	let delhiWeather = WeatherData(
		cityName: "New Delhi",
		currentWeather: CurrentWeather(temperature: "43°", condition: "Sunny", uvIndex: "9", visibility: "4 km"),
		dailyWeather: [
			DailyWeather(day: "Mon", low: "32°", high: "45°", condition: "Hazy", uvIndex: "8"),
			DailyWeather(day: "Tue", low: "31°", high: "44°", condition: "Hazy", uvIndex: "8"),
			DailyWeather(day: "Wed", low: "33°", high: "44°", condition: "Hazy", uvIndex: "9"),
			DailyWeather(day: "Thu", low: "33°", high: "44°", condition: "Cloudy", uvIndex: "9"),
			DailyWeather(day: "Fri", low: "30°", high: "37°", condition: "Rainy", uvIndex: "3"),
			DailyWeather(day: "Sat", low: "28°", high: "34°", condition: "Rainy", uvIndex: "3"),
			DailyWeather(day: "Sun", low: "26°", high: "32°", condition: "Rainy", uvIndex: "3")
		]
	)

	let weather: WeatherData

	init() {
		weather = delhiWeather
	}
}

struct WeatherData {
	let cityName: String
	let currentWeather: CurrentWeather
	let dailyWeather: [DailyWeather]
}

struct CurrentWeather {
	let temperature: String
	let condition: String
	let uvIndex: String
	let visibility: String
}

struct DailyWeather: Identifiable {
	let id = UUID()
	let day: String
	let low: String
	let high: String
	let condition: String
	let uvIndex: String

	var displayDay: String {
		var icon: String {
			switch condition {
			case "Sunny": return "☀️"
			case "Rainy": return "🌧"
			case "Mostly Sunny": return "🌤"
			case "Cloudy": return "☁️"
			default: return "🌥"
			}
		}

		return day + " " + icon
	}

	var lowToHigh: String {
		return "\(low) - \(high)"
	}

	var activities: String {
		switch condition {
		case "Sunny": return "🎾 🏊‍♀️ 🚴‍♀️"
		case "Rainy": return "🏋️‍♀️ 🏓 🤍"
		case "Mostly Sunny": return "⚽️ 🚴‍♀️ 🎾"
		case "Cloudy": return "🚴‍♀️ ⚽️ 🎾"
		default: return "🏊‍♀️ ⚽️ 🏋️‍♀️"
		}
	}

	var activities2: String {
		switch condition {
		case "Sunny": return "🏋️‍♀️ 🏊‍♀️ 🤍"
		case "Rainy": return "⚽️ 🏋️‍♀️ 🏓"
		case "Mostly Sunny": return "⚽️ 🚴‍♀️ 🏊‍♀️"
		case "Cloudy": return "🚴‍♀️ ⚽️ 🎾"
		default: return "⚽️ 🏊‍♀️ 🏋️‍♀️"
		}
	}
}
