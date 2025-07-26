import SwiftUI

struct Checkra1nView: View {
    @State private var isInstalled: Bool = false
    @State private var isChecking: Bool = true
    @State private var isRunning = false
    @State private var output: String = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header
                HStack(spacing: 12) {
                    Image("Checkra1n")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .cornerRadius(12)
                    Text("Checkra1n")
                        .font(.system(size: 32, weight: .bold))
                }

                Text("""
                Checkra1n is a semi-tethered jailbreak based on the checkm8 exploit, \
                compatible with iOS 12 to 14.8.1 on devices up to A11.
                """)
                .multilineTextAlignment(.leading)

                Divider()

                #if os(macOS)
                if isChecking {
                    ProgressView("Checking Checkra1n status...")
                } else {
                    if isInstalled {
                        Label("Checkra1n is installed!", systemImage: "checkmark.circle.fill")
                            .foregroundColor(.green)

                        Button {
                            runCheckra1n()
                        } label: {
                            Label("Run Checkra1n", systemImage: "terminal")
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.gray)
                        .disabled(isRunning)

                    } else {
                        Label("Checkra1n is not installed", systemImage: "xmark.octagon.fill")
                            .foregroundColor(.red)
                        Button {
                            installCheckra1n()
                        } label: {
                            Label("Install Checkra1n", systemImage: "arrow.down.circle.fill")
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.blue)
                    }
                }

                if !output.isEmpty {
                    ScrollView {
                        Text(output)
                            .font(.system(.body, design: .monospaced))
                            .padding()
                            .cornerRadius(12)
                    }
                    .frame(maxHeight: 200)
                }
                #else
                Text("Checkra1n features are only available on macOS.")
                    .foregroundColor(.secondary)
                    .italic()
                #endif
            }
            .padding()
        }
        .onAppear {
            #if os(macOS)
            checkCheckra1n()
            #endif
        }
    }

    #if os(macOS)
    func checkCheckra1n() {
        isChecking = true
        let fileManager = FileManager.default
        let path = "/Applications/Checkra1n.app"

        DispatchQueue.global().async {
            isInstalled = fileManager.fileExists(atPath: path)
            DispatchQueue.main.async {
                isChecking = false
            }
        }
    }

    func installCheckra1n() {
        isRunning = true
        output = ""

        let task = Process()
        task.executableURL = URL(fileURLWithPath: "/usr/bin/python3")
        task.arguments = ["checkra1n.py"]

        let pipe = Pipe()
        task.standardOutput = pipe
        task.standardError = pipe

        task.terminationHandler = { _ in
            DispatchQueue.main.async {
                isRunning = false
            }
        }

        do {
            try task.run()
            pipe.fileHandleForReading.readabilityHandler = { handle in
                let data = handle.availableData
                if let line = String(data: data, encoding: .utf8) {
                    DispatchQueue.main.async {
                        output += line
                    }
                }
            }
        } catch {
            output = "Failed to run checkra1n.py: \(error.localizedDescription)"
            isRunning = false
        }
    }

    func runCheckra1n() {
        let task = Process()
        task.launchPath = "/usr/bin/open"
        task.arguments = ["/Applications/Checkra1n.app"]
        do {
            try task.run()
        } catch {
            output = "Failed to launch Checkra1n app: \(error.localizedDescription)"
        }
    }
    #endif
}

#Preview {
    Checkra1nView()
}
