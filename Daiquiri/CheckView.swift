import SwiftUI

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}

struct CheckView: View {
    @State private var checkStatus: Bool = true
    @State private var iosVersion: String = ""
    @State private var matchingTools: [String] = []
    @State private var showTools: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Text("check_title".localized)
                .font(.title)
                .multilineTextAlignment(.center)

            Toggle(isOn: $checkStatus) {
                Text("toggle_check".localized)
            }
            .toggleStyle(.switch)
            .tint(.green)

            if checkStatus {
                HStack {
                    Text("ios_version".localized)
                    TextField("placeholder_version".localized, text: $iosVersion)
#if os(iOS)
                        .keyboardType(.decimalPad)
#endif
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button("see_tools".localized) {
                        matchingTools = getTools(for: iosVersion)
                        showTools = true
                    }
                }
            }

            if showTools {
                ForEach(matchingTools, id: \.self) { tool in
                    NavigationLink(destination: toolView(for: tool)) {
                        HStack(spacing: 16) {
                            Image(tool)
                                .resizable()
                                .frame(width: 64, height: 64)
                                .cornerRadius(10)

                            Text(tool)
                                .font(.title3)
                                .bold()
                                .foregroundColor(.primary)

                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .cornerRadius(10)
                        .shadow(radius: 2)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }

            Spacer()
        }
        .padding()
    }

    func getTools(for version: String) -> [String] {
        var tools: [String] = []
        let ver = version.trimmingCharacters(in: .whitespaces)

        if ver.hasPrefix("17") {
            tools.append("Palera1n")
            if ver == "17.0" {
                tools.append("Dopamine")
            }
        } else if ver == "16.7" || ver == "16.6" {
            tools.append("Palera1n")
        } else if ver.hasPrefix("16.") || ver.hasPrefix("15.") {
            tools.append(contentsOf: ["Palera1n", "Dopamine"])
        } else if ver.hasPrefix("14.") {
            tools.append("Taurine")
            tools.append("Checkra1n")
            if ver != "14.8.1" {
                tools.append("Unc0ver")
            }
        } else if ver.hasPrefix("13.") {
            tools.append(contentsOf: ["Odyssey", "Checkra1n", "Unc0ver"])
        } else if ver.hasPrefix("12") {
            tools.append(contentsOf: ["Chimera", "Checkra1n", "Unc0ver"])
        } else if ver.hasPrefix("11") {
            tools.append(contentsOf: ["Electra", "Checkra1n", "Unc0ver"])
        }

        return tools
    }

    func toolView(for tool: String) -> some View {
        switch tool {
        case "Palera1n":
            return AnyView(Palera1nView())
        case "Dopamine":
            return AnyView(DopamineView())
        case "Taurine":
            return AnyView(TaurineView())
        case "Odyssey":
            return AnyView(OdysseyView())
        case "Chimera":
            return AnyView(ChimeraView())
        case "Electra":
            return AnyView(ElectraView())
        case "Checkra1n":
            return AnyView(Checkra1nView())
        case "Unc0ver":
            return AnyView(Unc0verView())
        default:
            return AnyView(Text("tool_not_found".localized))
        }
    }
}

#Preview {
    CheckView()
}
