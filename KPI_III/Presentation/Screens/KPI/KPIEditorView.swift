//
//  KPIEditorView.swift
//  KPI_III
//
//  Created by Workspace (Abdurakhmon Jamoliddinov) on 06/05/23.
//

import SwiftUI

struct KPIEditorView: View {
    @EnvironmentObject var manager: Manager
    @State var kpiName = ""
    let gkpi: Area
    @FocusState var focus: Bool?
    @Environment(\.dismiss) var dismiss
    @State private var repetition: Repetition = .daily
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    TextField("kpi name", text: $kpiName)
                        .focused($focus, equals: true)
                        .onAppear {
                            focus = true
                        }
                        .submitLabel(.done)
                        .onSubmit {
                            manager.createKPI(kpiName, repetition, in: gkpi)
                            dismiss()
                        }
                        .textInputAutocapitalization(.never)
                    
                    Picker("Repetition", selection: $repetition) {
                        ForEach(Repetition.allCases) { repetition in
                            Text(repetition.rawValue.capitalized)
                        }
                    }
                }
            }
            .navigationTitle("KPI Editor")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        manager.createKPI(kpiName, repetition, in: gkpi)
                        dismiss()
                    }, label: {
                        Text("Save")
                    })
                }
            }
        }
    }
}














//struct KPIEditorView_Previews: PreviewProvider {
//    static var previews: some View {
//        KPIEditorView()
//    }
//}
