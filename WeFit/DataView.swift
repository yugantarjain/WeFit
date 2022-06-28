//
//  DataView.swift
//  WeFit
//
//  Created by Yugantar Jain on 12/06/22.
//

import Charts
import SwiftUI

struct DataView: View {
	@StateObject var viewModel = DataViewModel()
	@State var selection: Int = 1

    var body: some View {
		NavigationStack {
			VStack {
				Picker("", selection: $selection) {
					Text("D").tag(0)
					Text("W").tag(1)
					Text("M").tag(2)
					Text("Y").tag(3)
				}
				.pickerStyle(.segmented)

				Chart(viewModel.data) { element in
					BarMark(
						x: .value("Date", element.day),
						y: .value("Calories", element.calories)
					)
					.foregroundStyle(
						Gradient(colors: [.red, .orange])
					)
				}

				Text("You burned an average \(viewModel.avg) calories per day 🔥")
					.font(.subheadline)
					.fontWeight(.bold)
			}
			.padding()
			.navigationTitle("Calories Burned")
		}
    }
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}
