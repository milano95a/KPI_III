//
//  AreaEditorView.swift
//  KPI_III
//
//  Created by Workspace (Abdurakhmon Jamoliddinov) on 06/05/23.
//

import SwiftUI

struct AreaEditorView: View {
    @ObservedObject var manager: Manager
    @State var name = ""
    @Environment(\.dismiss) var dismiss
    @FocusState var focus: Bool?
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("name", text: $name)
                    .focused($focus, equals: true)
                    .onAppear {
                        focus = true
                    }
                    .submitLabel(.done)
                    .onSubmit {
                        let gkpi = Area(name: name, kpis: [])
                        manager.create(gkpi)
                        dismiss()
                    }

            }
            .navigationTitle("Area Form")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button("Save") {
                        let gkpi = Area(name: name, kpis: [])
                        manager.create(gkpi)
                        dismiss()
                    }
                }
            }
        }
    }
}
























//struct AreaEditorView_Previews: PreviewProvider {
//    static var previews: some View {
//        AreaEditorView()
//    }
//}
