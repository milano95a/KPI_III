import SwiftUI

struct KPMainTabView: View {
    @EnvironmentObject var manager: Manager
    
    var body: some View {
        TabView {
            KPStatView()
            
            ForEach(manager.areas.indices, id: \.self) { gkpiIndex in
                AreaView(area: manager.areas[gkpiIndex], onTap: { kpiIndex, counterIndex in
                    manager.increment(gkpiIndex, kpiIndex, counterIndex)
                }, onLongTap: { kpiIndex, counterIndex in
                    manager.decrement(gkpiIndex, kpiIndex, counterIndex)
                }, onDeleteTap: { kpiIndex in
                    manager.deleteKPI(at: kpiIndex, at: gkpiIndex)
                }, onDeleteAreaTap:  {
                    manager.deleteArea(at: gkpiIndex)
                })
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}
















































struct TabGKPIView_Previews: PreviewProvider {
    static var previews: some View {
        KPMainTabView()
    }
}
