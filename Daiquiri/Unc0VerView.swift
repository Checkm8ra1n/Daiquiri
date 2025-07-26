//
//  Unc0VerView.swift
//  Daiquiri
//
//  Created by Checkm8Croft on 25/07/25.
//

import SwiftUI

struct Unc0verView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack(spacing: 24) {
                    // 🔹 Header
                    HStack(spacing: 12) {
                        Image("Unc0ver")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .cornerRadius(12)
                        Text("Unc0ver")
                            .font(.system(size: 32, weight: .bold))
                    }

                    // 🔸 Description
                    Text("""
                    Unc0ver is a rootless jailbreak for all iOS devices \
                    on iOS 14.X 
                    """)
                    .multilineTextAlignment(.leading)

                    Divider()
                    
                    // Info
                    VStack(alignment: .leading, spacing: 6) {
                        Text("📱 Supported Devices:")
                            .font(.headline)
                        Text("• from iOS 11.X to 14.X (except iOS 14.8.1)")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Divider()

                    // 📥 Download Options
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Download Options")
                            .font(.headline)

                        Button {
                            openURL("https://unc0ver.dev/downloads/8.0.2/9e44edfbfd1905cadf23c3b9ad1d5bed683ce061/unc0ver_Release_8.0.2.ipa")
                        } label: {
                            Label("Download iPA", systemImage: "arrow.down.circle.fill")
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.blue)
                        .cornerRadius(10)
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
    Unc0verView()
}
