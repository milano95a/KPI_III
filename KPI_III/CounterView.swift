import SwiftUI

struct CounterView: View {
    
    let count: Int
    let onTap: () -> Void
    let onLongTap: () -> Void
    
    var body: some View {
        Text("\(count)")
            .frame(width: 50, height: 50)
            .background(backgroundColor(count))
            .foregroundColor(foregroundColor(count))
            .onTapGesture {
                onTap()
            }
            .onLongPressGesture {
                onLongTap()
            }
    }
    
    func backgroundColor(_ score: Int) -> Color {
        switch score {
        case 1:
            return Color.bronze
        case 2:
            return Color.silver
        case let x where x > 2:
            return Color.gold
        case let x where x < 0:
            return Color.red1
        default:
            return Color.zero
        }
    }
    
    func foregroundColor(_ score: Int) -> Color {
        switch score {
        case 1:
            return Color.bronzeDark
        case 2:
            return Color.silverDark
        case let x where x > 2:
            return Color.goldDark
        case let x where x < 0:
            return Color.redDark
        default:
            return Color.zeroDark
        }
    }
}

struct Counter: Codable {
    var count: Int = 0
}


















































struct View1_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(count: -1, onTap: { }, onLongTap: { })
    }
}
