//
//  FileStorage.swift
//  CoHo11JSON
//
//  Created by Stephen Truitt on 9/14/26.
//

import Foundation

struct FileStorage{
    
    
    //MARK: 1. - The place where we are going to save/load our data (url or path)
    
    func getFilePath() -> URL {
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            
            return documents.appendingPathComponent("user.json")
    
    }
    
    //2. - A Method or way of saving the data
    
    func save ( user:User ) throws{
        
        do{
            let data = try JSONEncoder().encode(user)
            try data.write(to: getFilePath() ,options: .atomic)
        }catch{
            print("Error: \(error.localizedDescription)")
        }
        
    }
    
    
    
    //3. - A method ro load that data
    
    func load() -> User?{
        do{
            let data = try Data(contentsOf: getFilePath())
            return try JSONDecoder().decode(User.self, from: data)
            
        }catch{
            print("Error: \(error.localizedDescription)")
            return nil
        }
    }
    
    
}
