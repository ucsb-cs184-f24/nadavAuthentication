import SwiftUI
import FirebaseAuth

struct Home: View {
    @State private var err : String = ""

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "hand.wave.fill")
                Text(
                    "Hello " +
                    (Auth.auth().currentUser!.displayName ?? "Username not found")
                )
            }
            Button{
                Task {
                    do {
                        try await Authentication().logout()
                    } catch let e {
                        err = e.localizedDescription
                    }
                }
            }label: {
                Text("Log Out").padding(8)
            }.buttonStyle(.borderedProminent)
            
            Text(err).foregroundColor(.red).font(.caption)
        }
    }
}

#Preview {
    Home()
}
