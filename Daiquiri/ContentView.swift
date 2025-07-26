import SwiftUI

struct ContentView: View {
    @State private var selectedTool: String? = nil
    @State private var isPressed = false

    var body: some View {
        VStack(spacing: 24) {
            if selectedTool == nil {
                VStack(spacing: 20) {
                    HStack(spacing: 16) {
                        Image("Daiquiri")
                            .resizable()
                            .frame(width: 96, height: 96)
                            .cornerRadius(20)

                        Text(NSLocalizedString("daiquiri_title", comment: "Daiquiri app title"))
                            .font(.title)
                            .bold()
                            .multilineTextAlignment(.center)
                    }

                    HStack(spacing: 8) {
                        Text(NSLocalizedString("dont_know_tool", comment: "Don't know which tool text"))
                        Button {
                            withAnimation {
                                selectedTool = "check"
                            }
                        } label: {
                            Label(NSLocalizedString("see_here", comment: "See here button"), systemImage: "magnifyingglass")
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.blue)
                        .cornerRadius(10)
                    }

                    Divider()

                    VStack(alignment: .leading, spacing: 12) {
                        Text(NSLocalizedString("tools_title", comment: "Tools section title"))
                            .font(.headline)

                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                            toolRow(name: NSLocalizedString("palera1n_title", comment: "Palera1n"), key: "palera1n", color: .purple, symbol: "drop.fill")
                            toolRow(name: NSLocalizedString("dopamine_title", comment: "Dopamine"), key: "dopamine", color: .orange, symbol: "circle.circle")
                            toolRow(name: NSLocalizedString("checkra1n_title", comment: "Checkra1n"), key: "checkra1n", color: .gray, symbol: "squareshape.split.3x3")
                            toolRow(name: NSLocalizedString("unc0ver_title", comment: "Unc0ver"), key: "unc0ver", color: .blue, symbol: "u.square.fill")
                            toolRow(name: NSLocalizedString("odyssey_title", comment: "Odyssey"), key: "odyssey", color: .pink, symbol: "o.square.fill")
                            toolRow(name: NSLocalizedString("taurine_title", comment: "Taurine"), key: "taurine", color: .green, symbol: "t.square.fill")
                            toolRow(name: NSLocalizedString("chimera_title", comment: "Chimera"), key: "chimera", color: .mint, symbol: "flame")
                            toolRow(name: NSLocalizedString("electra_title", comment: "Electra"), key: "electra", color: .indigo, symbol: "bolt.fill")
                        }
                    }

                }
                .padding()
            } else {
                VStack {
                    switch selectedTool {
                    case "check": CheckView()
                    case "palera1n": Palera1nView()
                    case "dopamine": DopamineView()
                    case "checkra1n": Checkra1nView()
                    case "unc0ver": Unc0verView()
                    case "odyssey": OdysseyView()
                    case "taurine": TaurineView()
                    case "chimera": ChimeraView()
                    case "electra": ElectraView()
                    default: Text(NSLocalizedString("tool_not_found", comment: "Tool not found"))
                    }
                    Button {
                        withAnimation {
                            selectedTool = nil
                        }
                    } label: {
                        Label(NSLocalizedString("back_to_home", comment: "Back to home button"), systemImage: "house.fill")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.gray)
                    .padding()
                }
            }
        }
    }

    @ViewBuilder
    func toolRow(name: String, key: String, color: Color, symbol: String) -> some View {
        Button {
            withAnimation {
                selectedTool = key
            }
        } label: {
            HStack {
                Image(systemName: symbol)
                    .foregroundColor(.white)
                    .font(.title3)
                Text(name)
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(color)
            .cornerRadius(10)
        }
    }
}

#Preview{
    ContentView()
}
