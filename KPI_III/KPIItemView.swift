import SwiftUI

struct KPIItemView: View {
    
    let kpi: KPI
    let onTap: (Int) -> Void
    let onLongTap: (Int) -> Void
    let onDeleteTap: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack () {
                    Button(action: {
                        onDeleteTap()
                    }, label: {
                        Label("", systemImage: "xmark")
                            .foregroundColor(.red1)
                    })
                    Text("\(kpi.name)")
                }
                .frame(width: geometry.size.width, alignment: .leading)
                HStack {
                    ForEach(kpi.counters.indices, id: \.self) { index in
                        CounterView(count: kpi.counters[index].count, onTap: {
                            onTap(index)
                        }, onLongTap: {
                            onLongTap(index)
                        })
                    }
                }
                .frame(width: geometry.size.width, alignment: .trailing)
            }
        }.padding(EdgeInsets(top: 4, leading: 4, bottom: 0, trailing: 4))
    }
}

enum Repetition: String, Codable, CaseIterable, Identifiable {
    case daily, weekly, monthly
    var id: Self { self }
}

struct KPI: Identifiable, Codable {
    var id: String { name }
    let name: String
    var counters: [Counter]
    var repetition: Repetition
    var lastUpdate: Date
    
    mutating func addCounter() {
        counters.append(Counter())
        lastUpdate = Date()
    }
    
    func shouldAddCounter() -> Bool {
        if counters.isEmpty {
            return true
        }else if repetition == .monthly {
            return !self.lastUpdate.isSameMonth(Date())
        } else if repetition == .weekly {
            return !self.lastUpdate.isSameWeek(Date())
        } else {
            return !self.lastUpdate.isSameDay(Date())
        }
    }
}




































struct View2_Previews: PreviewProvider {
    static var previews: some View {
        KPIItemView(
            kpi: KPI(name: "exercise", counters: [
                Counter(count: 0),
                Counter(count: 1),
                Counter(count: 2),
                Counter(count: 3),
                Counter(count: 4),
                Counter(count: 5),
                Counter(count: 6),
                Counter(count: 7),
            ], repetition: .daily,
                     lastUpdate: Date()),
            onTap: { counterIndex in },
            onLongTap: { counterIndex in },
            onDeleteTap: { }
        )
    }
}
