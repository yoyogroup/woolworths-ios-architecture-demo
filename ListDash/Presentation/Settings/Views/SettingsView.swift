import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
} 
