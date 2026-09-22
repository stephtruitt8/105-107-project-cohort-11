//
//  EntryListView.swift
//  JournalCoHo11
//
//  Created by Stephen Truitt on 9/21/26.
//

import SwiftUI
import SwiftData

struct EntryListView: View {
    @Environment(\.modelContext) private var context

    @Query(sort: \JournalEntry.date)
    private var entries: [JournalEntry]

    @State private var searchText = ""
    @State private var selectedFilter: EntryFilter = .all
    @State private var selectedCategory: CategoryFilter = .all
    @State private var showProfile = false
    @State private var showSettings = false

    enum EntryFilter: String, CaseIterable, Identifiable {
        case all = "All Entries"
        case favorites = "Favorites"
        case archived = "Archived"

        var id: Self { self }
    }

    enum CategoryFilter: String, CaseIterable, Identifiable {
        case all = "All Categories"
        case personal = "Personal"
        case school = "School"
        case work = "Work"
        case ideas = "Ideas"

        var id: Self { self }
    }

    var filteredEntries: [JournalEntry] {
        entries.filter { entry in
            let matchesSearch =
                searchText.isEmpty ||
                entry.title.localizedCaseInsensitiveContains(searchText)

            let matchesFilter: Bool

            switch selectedFilter {
            case .all:
                matchesFilter = !entry.isArchived

            case .favorites:
                matchesFilter =
                    entry.isFavorite && !entry.isArchived

            case .archived:
                matchesFilter = entry.isArchived
            }

            let matchesCategory =
                selectedCategory == .all ||
                entry.category == selectedCategory.rawValue

            return matchesSearch &&
                   matchesFilter &&
                   matchesCategory
        }
    }

    var body: some View {
        List {
            if filteredEntries.isEmpty {
                ContentUnavailableView(
                    "No Entries",
                    systemImage: "book.closed"
                )
            } else {
                ForEach(filteredEntries) { entry in
                    NavigationLink {
                        EntryDetailView(entry: entry)
                    } label: {
                        EntryRow(entry: entry)
                    }
                }
                .onDelete(perform: deleteRow)
            }
        }
        .navigationTitle("Journal")
        .searchable(
            text: $searchText,
            prompt: "Search entries"
        )
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                filterMenu
            }

            ToolbarItemGroup(placement: .topBarTrailing) {
                NavigationLink {
                    EntryFormView(entry: nil)
                } label: {
                    Image(systemName: "plus")
                }

                profileMenu
            }
        }
        .sheet(isPresented: $showProfile) {
            NavigationStack {
                ProfileView()
            }
        }
        .sheet(isPresented: $showSettings) {
            NavigationStack {
                SettingsView()
            }
        }
    }

    // This is inside EntryListView but outside body.
    private var filterMenu: some View {
        Menu {
            Section("Entries") {
                Picker(
                    "Entry Filter",
                    selection: $selectedFilter
                ) {
                    ForEach(EntryFilter.allCases) { filter in
                        Text(filter.rawValue)
                            .tag(filter)
                    }
                }
            }

            Section("Categories") {
                Picker(
                    "Category",
                    selection: $selectedCategory
                ) {
                    ForEach(CategoryFilter.allCases) { category in
                        Text(category.rawValue)
                            .tag(category)
                    }
                }
            }
        } label: {
            Label(
                "Filter",
                systemImage: "line.3.horizontal.decrease.circle"
            )
        }
    }

    private var profileMenu: some View {
        Menu {
            Button {
                showProfile = true
            } label: {
                Label("My Profile", systemImage: "person")
            }

            Button {
                showSettings = true
            } label: {
                Label("Settings", systemImage: "gear")
            }

            Divider()

            Button {
                selectedFilter = .archived
            } label: {
                Label(
                    "Archived Entries",
                    systemImage: "archivebox"
                )
            }
        } label: {
            Image(systemName: "person.crop.circle")
                .font(.title3)
        }
    }

    // This is now in the correct scope.
    private func deleteRow(at offsets: IndexSet) {
        for index in offsets {
            let entry = filteredEntries[index]
            context.delete(entry)
        }
    }
}

// Component
struct EntryRow:View {
    var entry: JournalEntry
            
            var body: some View {
                HStack {
                    VStack (alignment: .leading, spacing: 6){
                        HStack {
                            Text(entry.title)
                                .lineLimit(1)
                                .font(.headline)
                            
                            Label(entry.category, systemImage: "tag")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            
                            Text(entry.date.formatted())
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            
                            
                        }
                        
                        if entry.isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                            
                        }
                    }
                    .padding(.vertical, 4)
                    
                }
            }
        }
        
#Preview {
            EntryRow(entry: JournalEntry(title: "My title", body: "Content", isFavorite: true))
            
            EntryRow(entry: JournalEntry(title: "my title", body: "Content", isFavorite: true))
}
    

