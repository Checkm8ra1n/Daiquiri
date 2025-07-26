import SwiftUI
#if os(macOS)
import AppKit
#endif

struct Palera1nView: View {
    @State private var palera1nPath: String = "/usr/local/bin/palera1n"
    @State private var palera1nFound: Bool = false
    @State private var installOutput: String = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Title
                HStack(spacing: 8) {
                    Image("Palera1n")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .cornerRadius(10)
                    Text(NSLocalizedString("palera1n_title", comment: "Palera1n title"))
                        .font(.system(size: 32, weight: .bold))
                }

                // Info
                VStack(alignment: .leading, spacing: 6) {
                    Text(NSLocalizedString("palera1n_supported_devices", comment: "Supported devices label"))
                        .font(.headline)
                    Text(NSLocalizedString("palera1n_device_a11older", comment: "A11 and older"))
                    Text(NSLocalizedString("palera1n_ios_16x", comment: "iOS 16.X"))
                    Text(NSLocalizedString("palera1n_ipados_17x_18", comment: "iPadOS 17.X and 18.0 (iPad 6th & 7th gen)"))
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                #if os(macOS)
                VStack(spacing: 16) {
                    Divider()
                    Text(NSLocalizedString("installation_status", comment: "Installation status title"))
                        .font(.title2)
                        .bold()

                    HStack {
                        Image(systemName: palera1nFound ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .foregroundColor(palera1nFound ? .green : .red)
                            .imageScale(.large)
                        Text(palera1nFound ? NSLocalizedString("palera1n_installed", comment: "Palera1n installed") : NSLocalizedString("palera1n_not_found", comment: "Palera1n not found"))
                            .foregroundColor(.primary)
                            .font(.headline)
                    }

                    Text(String(format: NSLocalizedString("path_label", comment: "Path label"), palera1nPath))
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.top, -6)

                    HStack(spacing: 16) {
                        Button {
                            checkPalera1n()
                        } label: {
                            Label(NSLocalizedString("check_again", comment: "Check again button"), systemImage: "arrow.clockwise")
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.blue)
                        .cornerRadius(10)

                        Button(NSLocalizedString("install_palera1n", comment: "Install Palera1n button")) {
                            let script = """
                            do shell script "python3 /percorso/Palera1n.py" with administrator privileges
                            """
                            
                            var error: NSDictionary?
                            if let appleScript = NSAppleScript(source: script) {
                                appleScript.executeAndReturnError(&error)
                                if let error = error {
                                    print("AppleScript Error: \(error)")
                                } else {
                                    print("Palera1n launched successfully")
                                }
                            }
                        }
                    }

                    if !installOutput.isEmpty {
                        Text(String(format: NSLocalizedString("output_label", comment: "Output label"), installOutput))
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.top)
                    }
                }
                #else
                VStack(spacing: 8) {
                    Divider()
                    Text(NSLocalizedString("palera1n_mac_only", comment: "Palera1n install macOS only message"))
                        .font(.callout)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }
                #endif
            }
            .padding()
            .onAppear {
                checkPalera1n()
            }
        }
    }

    private func checkPalera1n() {
        palera1nFound = FileManager.default.fileExists(atPath: palera1nPath)
    }
}

#Preview {
    Palera1nView()
}
