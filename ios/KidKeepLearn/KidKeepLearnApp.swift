import SwiftUI

@main
struct KidKeepLearnApp: App {
    var body: some Scene {
        WindowGroup { WebAppView().ignoresSafeArea(.keyboard) }
    }
}
