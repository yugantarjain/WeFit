//
//  DataViewModel.swift
//  WeFit
//
//  Created by Yugantar Jain on 12/06/22.
//

import SwiftUI
import Charts

final class DataViewModel: ObservableObject {
	let data: [CalorieData]
	let avg: Int

	init() {
		data = [
			.init(day: "Mon", calories: 200),
			.init(day: "Tue", calories: 240),
			.init(day: "Wed", calories: 220),
			.init(day: "Thu", calories: 150),
			.init(day: "Fri", calories: 50),
			.init(day: "Sat", calories: 150),
			.init(day: "Sun", calories: 250)
		]

		var sum = 0
		data.forEach {
			sum += $0.calories
		}
		avg = sum / 7
	}
}

struct CalorieData: Identifiable {
	var id = UUID()
	var day: String
	var calories: Int
}
