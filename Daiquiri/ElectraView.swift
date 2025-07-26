//
//  ElectraView.swift
//  Daiquiri
//
//  Created by Checkm8Croft on 25/07/25.
//

import SwiftUI

struct ElectraView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack(spacing: 24) {
                    // 🔹 Header
                    HStack(spacing: 12) {
                        Image("Electra")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .cornerRadius(12)
                        Text("Electra")
                            .font(.system(size: 32, weight: .bold))
                    }

                    // 🔸 Description
                    Text("""
                    Electra is a rootless jailbreak for all iOS devices \
                    on iOS 11.X 
                    """)
                    .multilineTextAlignment(.leading)

                    Divider()
                    
                    // Info
                    VStack(alignment: .leading, spacing: 6) {
                        Text("📱 Supported Devices:")
                            .font(.headline)
                        Text("• iOS 11.X")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Divider()

                    // 📥 Download Options
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Download Options")
                            .font(.headline)

                        Button {
                            openURL("https://github.com/coolstar/electra-ipas/raw/master/Electra1141-2.0.ipa")
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
    ElectraView()
}
