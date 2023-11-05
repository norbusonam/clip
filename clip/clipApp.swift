//
//  clipApp.swift
//  clip
//
//  Created by Norbu Sonam on 11/4/23.
//

import SwiftUI

@main
struct clipApp: App {
    @State private var clipboardItems = ["AAA", "BBB", "CCC"]
    
    func quitApp() {
        NSApplication.shared.terminate(self)
    }
    
    func copyToClipboard(_ item: String) {
        let pasteboard = NSPasteboard.general
        pasteboard.declareTypes([.string], owner: nil)
        pasteboard.setString(item, forType: .string)
    }
    
    func clearHistory() {
        clipboardItems.removeAll()
    }
    
    var body: some Scene {
        MenuBarExtra("Clip", systemImage: "clipboard") {
            VStack {
                ForEach(clipboardItems, id: \.self) { clipboardItem in
                    Button(action: { copyToClipboard(clipboardItem) }) {
                        Text(clipboardItem)
                    }
                }
                if clipboardItems.isEmpty {
                    Text("No History")
                }
                Divider()
                Button(action: clearHistory) {
                    Text("Clear History")
                }.disabled(clipboardItems.isEmpty)
                Button(action: quitApp) {
                    Text("Quit")
                }
            }
        }
    }
}
