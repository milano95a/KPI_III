import Foundation

class Manager: ObservableObject {
    
    // MARK: Public API(s)
    
    @Published var areas: [Area] = [] {
        didSet {
            if let json = try? JSONEncoder().encode(areas) {
                UserDefaults.standard.set(json, forKey: kJsonData)
            }
        }
    }
    
    // MARK: Intent(s)

    func increment(_ gkpiIndex: Int, _ kpiIndex: Int, _ counterIndex: Int) {
        areas[gkpiIndex].kpis[kpiIndex].counters[counterIndex].count += 1
    }
    
    func decrement(_ gkpiIndex: Int, _ kpiIndex: Int, _ counterIndex: Int) {
        areas[gkpiIndex].kpis[kpiIndex].counters[counterIndex].count -= 1
    }
    
    func deleteKPI(at kpiIndex: Int, at gkpiIndex: Int) {
        areas[gkpiIndex].kpis.remove(at: kpiIndex)
    }
    
    func deleteArea(at areaIndex: Int) {
        areas.remove(at: areaIndex)
    }
    
    func create(_ area: Area) {
        areas.append(area)
    }

    func createKPI(_ kpiName: String, _ repetition: Repetition, in area: Area) {
        for (index, item) in areas.enumerated() {
            if item.name == area.name {
                let kpi = KPI(name: kpiName, counters: [Counter(count: 0)], repetition: repetition, lastUpdate: Date())
                areas[index].kpis.append(kpi)
            }
        }
    }
    
    // MARK: Others
    
    private let kJsonData = "jsonData"
    
    init() {
        if let json = UserDefaults.standard.data(forKey: kJsonData) {
            if let retreivedArea = try? JSONDecoder().decode([Area].self, from: json) {
                areas = retreivedArea
                for (i, area) in areas.enumerated() {
                    for (j, kpi) in area.kpis.enumerated() {
                        if kpi.shouldAddCounter() {
                            areas[i].kpis[j].addCounter()
                        }
                    }
                }
            }
        }
    }
}
