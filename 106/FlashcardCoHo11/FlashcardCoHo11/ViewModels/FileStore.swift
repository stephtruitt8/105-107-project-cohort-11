//
//  FileStore.swift
//  FlashcardCoHo11
//
//  Created by Stephen Truitt on 9/19/26.
//

import Foundation

struct User: Codable {
    let name: String
    var decks: [Deck]
}

struct FileStore {
    
    private let fileName: String
    
    init(fileName: String = ".decks.json") {
        self.fileName = fileName
    }
    
    private func getFilePath() throws -> URL {
        let documentsDirectory = try FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true
        )
        return documentsDirectory.appendingPathComponent(fileName)
    }
    
    func save(user: User) throws {

        let data = try JSONEncoder().encode(user)
        
        try data.write(to: getFilePath(),
                       options: .atomic)
    }
//    func save ( user:User ) throws{
//        
//            let data = try JSONEncoder().encode(user)
//        try data.write(to: getFilePath() ,options:)

    func load() -> User?{
        do{
            let filePath = try getFilePath()
            let data = try Data(contentsOf: filePath)
            
            return try JSONDecoder().decode(User.self, from: data)
            
        }catch{
            print("Error: \(error.localizedDescription)")
            return nil
        }
        
        
    }
        
}





