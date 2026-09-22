//
//  PostService.swift
//  PostCoHo11
//
//  Created by Stephen Truitt on 9/21/26.
//

import Foundation

//My Service calls the endpoint and gets the data collection
class PostService {
    
    //Create our own error menu
    enum PostNetworkerror: Error{
        case invalidUrl
        case invalidResponse
        case invalidStatusCode
        case decodeFailed
    }
    //async waits for the response of the server
    //this is a function
    // async -> Takes a while to complete the task
    // throws -> if something fails, do something not just crash our app
    // returns the array of posts
    func fetchAPI() async throws -> [Post] {
        
        // Our Base URL
        guard let baseURL:URL = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            
            throw PostNetworkerror.invalidUrl
            
        }
        
        //URLSession -> The tool that performs a network call
        //it returns two things
        // the data -> JSON
        // the response -> Code, Header, etc
        
        //Tuple,Set,Array,Object
        // THIS IS USED TO PERFORM A GET REQUEST TO A URL
        let (data, response) = try await URLSession.shared.data(from: baseURL)
        
        // We make sure that we have a valid HTTP response
        guard let httpResponse = response as? HTTPURLResponse else {
            throw PostNetworkerror.invalidResponse
        }
        
        // Only the status code 200 will be acceptable
        
        //another option?
        //        if httpResponse.statusCode == 200 {
        //            print("Status: OK")
        //        } else {
        //            throw PostNetworkerror.invalidStatusCode
        //        }
        
        guard httpResponse.statusCode == 200 else {
            throw PostNetworkerror.invalidStatusCode
        }
        
        do{
            return try JSONDecoder().decode([Post].self, from: data)
            
        }catch{
            throw PostNetworkerror.decodeFailed
        }
    }
    
}
