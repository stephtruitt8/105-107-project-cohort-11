//
//  StepsGoalView.swift
//  104-project-cohort 11
//
//  Created by Stephen Truitt on 8/5/26.
//

import SwiftUI

struct StepsGoalView: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
        //mark: -main stack-
            VStack(spacing: 60){
            
                //Title option + command + >|< arrows
                VStack {
                    Text("Goal Achieved!")
                        .font(.largeTitle)
                        .foregroundStyle(Color("MainColor"))
                        .brightness(0.05)
                        .bold(true)
                    
                    Text("Share with Friends!")
                        .font(.headline)
                        .opacity(0.5)
                    
                }
                
                //Progress Card
                
                VStack(spacing: 16) {
                    
                    //UserName
                    HStack{
                        Image("picture")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                        
                        Text("Rachel Wiess")
                            .font(.headline)
                        
                        Spacer()
                        
                        Image(systemName: "flame")
                        
                    }
                    .padding(10)
                    
                    //Ring
                    ZStack{
                        Circle()
                            .stroke(lineWidth: 12)
                            .foregroundStyle(Color("MainColor"))
                        
                        VStack {
                            Image(systemName: "figure.walk")
                                .font(.largeTitle)
                                .foregroundStyle(.gray)

                            Text("10,000")
                                .font(.title)
                                .bold()
                            
                            Text("Steps Today")
                        }
                        
                    }
                    .frame(width: 160, height: 160)
                    
                    //Summary
                    HStack{
                        VStack{
                            Text("1000 Cal")
                                .font(.callout.weight(.semibold))
                            
                            Text("Calories Burned")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        
                        Spacer()
                        
                        VStack{
                            Text("10,000")
                                .font(.callout.weight(.semibold))
                            
                            Text("Daily Goal")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                    }
                    .padding(10)
                    
                    
                }
                .background(.white)
                .cornerRadius(12)
                .shadow(color: .gray.opacity(0.1), radius: 6)
                .padding(.horizontal, 32)
                
                //Actions
                VStack{
                    Text("Share your achivement with the #walkforlife")
                        .font(.callout.weight(.semibold))
                    
                    Button("Share with Friends"){
                        
                    }
                    .padding(10)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
                    
                    
                    Button("Not Now"){
                        
                    }
                }
            
                
            }// end vstack
            
            
        }// end zstack
    }// end body
}//end stepsview

#Preview {
    StepsGoalView()
}
