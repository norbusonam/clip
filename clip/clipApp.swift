//
//  clipApp.swift
//  clip
//
//  Created by Norbu Sonam on 11/4/23.
//

import SwiftUI

@main
struct clipApp: App {
    func quitApp() {
        NSApplication.shared.terminate(self)
    }

    var body: some Scene {
        MenuBarExtra("Clip", systemImage: "clipboard") {
            Text("Hello, world")
            Button(action: quitApp) {
                Text("Quit")
            }
        }
    }
}
