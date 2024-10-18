//
import SwiftUI
import FirebaseCore
import GoogleSignIn

@main
struct AuthenticationAndNavigation184App: App {
    init() {
        // Firebase initialization
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView().onOpenURL { url in
                //Handle Google Oauth URL
                GIDSignIn.sharedInstance.handle(url)
            }
        }
    }
}
