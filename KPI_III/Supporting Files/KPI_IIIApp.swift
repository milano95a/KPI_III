import SwiftUI

@main
struct KPI_IIIApp: App {
    
    @StateObject var manager = Manager()
    
    var body: some Scene {
        WindowGroup {
            KPMainTabView(manager: manager)
                .preferredColorScheme(.dark)
        }
    }
}
