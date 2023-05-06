import SwiftUI

@main
struct KPI_IIIApp: App {
    
    let manager = Manager()
    
    var body: some Scene {
        WindowGroup {
            AreasTabView(manager: manager)
                .preferredColorScheme(.dark)
        }
    }
}
