//
//  SettingsView.swift
//  JournalCoHo11
//
//  Created by Stephen Truitt on 9/21/26.
//

import SwiftUI
import SwiftData

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    
    @AppStorage("darkMode")
    private var darkMode: Bool = false
    
    var body: some View {
        Form {
            Section("Appearance"){
                Toggle("Dark Mode", isOn: $darkMode)
            }
            
            Section("Journal") {
                NavigationLink("Journal Preferences") {
                    Text("Journal preferences go here")
                }
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                    dismiss()
                }
            }
        }
    }
}
