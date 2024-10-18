import SwiftUI
import FirebaseAuth

struct Email: View {
    @State private var err : String = ""

    var body: some View {
        VStack {
            HStack {
                Text(
                    "Your email is " +
                    (Auth.auth().currentUser!.email ?? "Email not found")
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
    Email()
}
