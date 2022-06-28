//
//  WeFitApp.swift
//  WeFit
//
//  Created by Yugantar Jain on 12/06/22.
//

import SwiftUI

@main
struct WeFitApp: App {
    var body: some Scene {
        WindowGroup {
			TabView {
				ContentView()
					.tabItem {
						Label("Fitness", systemImage: "bolt.heart.fill")
					}

				DataView()
					.tabItem {
						Label("Progress", systemImage: "chart.line.uptrend.xyaxis.circle.fill")
					}
			}
        }
    }
}
