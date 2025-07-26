import SwiftUI

@main
struct DaiquiriApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 800, minHeight: 400) // 👈 imposta le dimensioni minime
        }
#if os(macOS)

        .windowStyle(DefaultWindowStyle())
        #endif
    }
}
