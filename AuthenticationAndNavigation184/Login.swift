import SwiftUI

struct Login: View {
    @State private var err : String = ""

    var body: some View {
        Text("Login")
        Button{
            Task {
                do {
                    try await Authentication().googleOauth()
                } catch AuthenticationError.runtimeError(let errorMessage) {
                    err = errorMessage
                }
            }
        }label: {
            HStack {
                Image(systemName: "person.badge.key.fill")
                Text("Sign in with Google")
            }.padding(8)
        }.buttonStyle(.borderedProminent)

        Text(err).foregroundColor(.red).font(.caption)
    }
}

#Preview {
    Login()
}
