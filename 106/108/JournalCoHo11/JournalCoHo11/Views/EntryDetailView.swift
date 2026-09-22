//
//  EntryDetailView.swift
//  JournalCoHo11
//
//  Created by Stephen Truitt on 9/21/26.
//
import SwiftUI
import SwiftData

struct EntryDetailView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    let entry:JournalEntry
    
    @State private var showEdit:Bool = false
    var body: some View {
        
        ScrollView {
            VStack{
                Text(entry.title)
                    .font(Font.largeTitle.bold())
                
                Text(entry.body)
                    .font(Font.body.monospacedDigit())
                
                Text(entry.date.formatted(date: .abbreviated, time: .shortened))
                    .font(.subheadline)
                    .opacity(0.4)
                
                Button{
                    entry.isFavorite.toggle()
                }label: {
                    Image(systemName: entry.isFavorite ? "star.fill":"star")
                        .foregroundStyle(Color.yellow)
                }
                
            }
        }
        .navigationTitle("Entry").navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Edit") {showEdit = true}
            }
            ToolbarItem(placement: .bottomBar) {
                
                Button {
                            entry.isArchived.toggle()
                            dismiss()
                        } label: {
                            Label(
                                entry.isArchived ? "Unarchive" : "Archive",
                                systemImage: entry.isArchived
                                    ? "archivebox.fill"
                                    : "archivebox"
                            )
                }
                .tint(.orange)

                
                Button("Delete") {
                    context.delete(entry)
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
            }
            
            
            
        }.sheet(isPresented: $showEdit) {
            NavigationStack{
                EntryFormView(entry: entry)
            }
        }
    }
}

#Preview {
    NavigationStack{
        EntryDetailView(entry: JournalEntry(title: "Testing", body: "The Body looks pretty okay"))
    }
}
