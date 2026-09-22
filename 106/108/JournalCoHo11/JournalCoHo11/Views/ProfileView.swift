//
//  ProfileView.swift
//  JournalCoHo11
//
//  Created by Stephen Truitt on 9/21/26.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var name = "Steph Truitt"
    @State private var bio = "Artist, Software Engineer and Journal Creator"
    
    
    var body: some View {
        Form{
            Section{
                HStack{
                    Spacer()
                    
                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 90))
                        .foregroundStyle(.blue)
                    
                    Spacer()
                }
            }
            
            Section("Profile Infomation") {
                TextField("Name", text: $name)
                
                TextField(
                    "Bio",
                    text: $bio,
                    axis: .vertical
                )
                .lineLimit(3...6)
            }
        }
        .navigationTitle("Profile")
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

#Preview {
    NavigationStack {
        ProfileView()
    }
}
