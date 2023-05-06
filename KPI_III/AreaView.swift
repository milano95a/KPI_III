import SwiftUI

struct AreaView: View {
    
    @ObservedObject var manager: Manager
    @State var showEditor = false
    
    let area: Area
    let onTap: (Int, Int) -> Void
    let onLongTap: (Int, Int) -> Void
    let onDeleteTap: (Int) -> Void
    let onDeleteAreaTap: () -> Void
    
    var body: some View {
        NavigationStack {
            kpiList
                .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
                .navigationTitle("\(area.name)")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar { toolbar }
                .popover(isPresented: $showEditor) {
                    KPIEditorView(manager: manager, gkpi: area)
                }
        }
    }
    
    var kpiList: some View {
        ScrollView(.vertical) {
            VStack {
                ForEach(area.kpis.indices, id: \.self) { kpiIndex in
                    KPIItemView(kpi: area.kpis[kpiIndex], onTap: { counterIndex in
                        onTap(kpiIndex, counterIndex)
                    }, onLongTap: { counterIndex in
                        onLongTap(kpiIndex, counterIndex)
                    }, onDeleteTap:  {
                        onDeleteTap(kpiIndex)
                    })
                }
            }
            .frame(height: CGFloat(area.kpis.count * 100))
        }
    }
    
    @ToolbarContentBuilder
    var toolbar: some ToolbarContent {
        ToolbarItem {
            Button(action: {
                showEditor = true
            }, label: {
                Label("", systemImage: "plus")
            })
        }
        ToolbarItem(placement: .navigationBarLeading) {
            Button(action: {
                onDeleteAreaTap()
            }, label: {
                Label("", systemImage: "trash").foregroundColor(.red1)
            })
        }
    }
}

struct Area: Codable {
    var name: String
    var kpis: [KPI]
}



























struct View3_Previews: PreviewProvider {
    
    static var kpis = [
        KPI(name: "review", counters: [
            Counter(count: 1),
            Counter(count: 2),
            Counter(count: 3),
            Counter(count: 4),
            Counter(count: 5),
            Counter(count: 6),
            Counter(count: 7),
            Counter(count: 8),
            Counter(count: 9),
            
        ], repetition: .daily,
            lastUpdate: Date()),
        KPI(name: "breakfast", counters: [
            Counter(count: 1),
            Counter(count: 1)
        ], repetition: .daily,
            lastUpdate: Date()),
        KPI(name: "dinner", counters: [
            Counter(count: 1),
            Counter(count: 1)
        ], repetition: .weekly,
            lastUpdate: Date()),
    ]
    
    static var previews: some View {
        AreaView(manager: Manager(), area: Area(name: "Self-Care", kpis: []), onTap: {_,_ in
            
        }, onLongTap: {_,_ in
            
        }, onDeleteTap: {_ in
            
        }, onDeleteAreaTap: {
            
        })
    }
}
