import SwiftUI

struct DopamineView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack(spacing: 24) {
                    // 🔹 Header
                    HStack(spacing: 12) {
                        Image("Dopamine")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .cornerRadius(12)
                        Text(NSLocalizedString("dopamine_title", comment: "Dopamine title"))
                            .font(.system(size: 32, weight: .bold))
                    }

                    // 🔸 Description
                    Text(NSLocalizedString("dopamine_description", comment: "Description of Dopamine jailbreak"))
                        .multilineTextAlignment(.leading)

                    Divider()
                    
                    // Info
                    VStack(alignment: .leading, spacing: 6) {
                        Text(NSLocalizedString("dopamine_supported_devices", comment: "Supported devices label"))
                            .font(.headline)
                        Text(NSLocalizedString("dopamine_device_all", comment: "All devices"))
                        Text(NSLocalizedString("dopamine_ios_version_supported", comment: "Supported iOS versions"))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Divider()

                    // 📥 Download Options
                    VStack(alignment: .leading, spacing: 14) {
                        Text(NSLocalizedString("download_options", comment: "Download options title"))
                            .font(.headline)

                        Button {
                            openURL("https://github.com/opa334/Dopamine/releases/latest/download/Dopamine.ipa")
                        } label: {
                            Label(NSLocalizedString("download_ipa", comment: "Download IPA button"), systemImage: "arrow.down.circle.fill")
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.blue)
                        .cornerRadius(10)

                        Button {
                            openURL("https://github.com/opa334/Dopamine/releases/latest/download/Dopamine.tipa")
                        } label: {
                            Label(NSLocalizedString("download_tipa", comment: "Download TIPA button"), systemImage: "tray.and.arrow.down.fill")
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.orange)
                        .cornerRadius(10)

                        #if os(iOS)
                        Button {
                            openURL("apple-magnifier://install?url=https://github.com/opa334/Dopamine/releases/download/2.4.5/Dopamine.tipa")
                        } label: {
                            Label(NSLocalizedString("install_trollstore", comment: "Install with TrollStore button"), systemImage: "t.circle.fill")
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.green)
                        .cornerRadius(10)
                        #endif
                    }
                    .padding(.bottom, 40) // spazio tooltip
                }
                .padding()
            }

            // 📝 Tooltip in basso a destra
            #if os(iOS)
            Text(NSLocalizedString("trollstore_tooltip", comment: "Tooltip about TrollStore URL scheme"))
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(10)
                .background(.ultraThinMaterial)
                .cornerRadius(12)
                .padding()
            #endif
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
    DopamineView()
}
