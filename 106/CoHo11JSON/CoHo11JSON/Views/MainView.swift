//
//  MainView.swift
//  CoHo11JSON
//
//  Created by Stephen Truitt on 9/14/26.
//

import SwiftUI

struct MainView: View {
    
    @State var username: String = ""
    @State var age: String = ""
    @State var isActive: Bool = false
    
    @State var prevUser:User?
    
    @State var statusMessage: String = ""
    
    var fileStore:FileStorage = FileStorage()
    
    var body: some View {
       
        VStack{
            
            Text("Save User Using FileStorage")
                .bold()
                .font(.largeTitle)
            
            Spacer()
            
            Text("Previous user: \(prevUser?.name ?? "")")
            
            if prevUser != nil{
                
            }
            
            Spacer()
           
            VStack{
                
                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Age", text: $age)
                    .textFieldStyle(.roundedBorder)
                
                Toggle("Activate User", isOn: $isActive)
                    .toggleStyle(.switch)
            }
            
            
            HStack{
                Button("Save"){
                    
                    
                    let user = User(name: username, age: Int(age) ?? 0, isActive: isActive)
                    
                    fileStore.save(user: user)
                    
                    statusMessage = "User Saved!"
                }
                .buttonStyle(.borderedProminent)
                .padding(.vertical)
                
                Button("Load"){
                    
                    if let user = fileStore.load() {
                        username = user.name
                        age = "\(user.age)"
                        isActive = user.isActive
                        statusMessage = "User Loaded!"
                    }else {
                        
                        statusMessage = "No saved data!"
                        
                    }
                    
                }
                .buttonStyle(.borderedProminent)
                .padding(.vertical)
            }
            
            if !statusMessage.isEmpty {
                Text(statusMessage)
                    .font(.subheadline)
                    .foregroundStyle(Color.green)
            }
            
            Spacer()
            
        }.padding()
            .onAppear{
                if let prevUser = fileStore.load() {
                    prevUser = user
                    statusMessage = "User Loaded!"
                }
                
                
            }
        
        
    }
}

#Preview {
    MainView()
}
