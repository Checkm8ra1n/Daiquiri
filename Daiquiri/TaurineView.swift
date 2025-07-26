//
//  TaurineView.swift
//  Daiquiri
//
//  Created by Checkm8Croft on 25/07/25.
//

import SwiftUI

struct TaurineView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack(spacing: 24) {
                    // 🔹 Header
                    HStack(spacing: 12) {
                        Image("Taurine")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .cornerRadius(12)
                        Text("Taurine")
                            .font(.system(size: 32, weight: .bold))
                    }

                    // 🔸 Description
                    Text("""
                    Taurine is a rootless jailbreak for all iOS devices \
                    on iOS 14.X 
                    """)
                    .multilineTextAlignment(.leading)

                    Divider()
                    
                    // Info
                    VStack(alignment: .leading, spacing: 6) {
                        Text("📱 Supported Devices:")
                            .font(.headline)
                        Text("• iOS 14.X")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Divider()

                    // 📥 Download Options
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Download Options")
                            .font(.headline)

                        Button {
                            openURL("https://github.com/Odyssey-Team/Taurine/releases/download/1.1.7-3/Taurine.1.1.7-3.ipa")
                        } label: {
                            Label("Download iPA", systemImage: "arrow.down.circle.fill")
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.blue)
                        .cornerRadius(10)

                        #if os(iOS)
                        Button {
                            openURL("altstore://install?url=https://github.com/Odyssey-Team/Taurine/releases/download/1.1.7-3/Taurine.1.1.7-3.ipa")
                        } label: {
                            Label("Install with AltStore", systemImage: "t.circle.fill")
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.green)
                        .cornerRadius(10)
                        #endif
                    }
                    .padding(.bottom, 40) // lascia spazio al tooltip
                }
                .padding()
            }
        }
    }

    func openURL(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        #if os(iOS)
        UIApplication.shared.open(url)
        #elseif os(macOS)
        NSWorkspace.shared.open(url)
        #endif
    }
}

#Preview {
    TaurineView()
}
