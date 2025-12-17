import SwiftUI

struct KPStatView: View {
    @EnvironmentObject var manager: Manager
    @State var showEditorGKPI = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
            }
            .popover(isPresented: $showEditorGKPI) {
                AreaEditorView()
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        showEditorGKPI = true
                    }, label: {
                        Label("", systemImage: "plus.circle")
                    })
                }
            }
         }
    }
}























































struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        KPStatView()
    }
}
