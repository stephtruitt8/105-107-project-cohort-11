//
//  SpecialistView.swift
//  Locs shop-cohort 11
//
//  Created by Stephen Truitt on 8/10/26.
//

import SwiftUI

struct SpecialistView: View {
    
    
    var body: some View {
        NavigationStack {
            
            VStack(spacing:30) {
                
                //MARK: TITLE AND SEARCH BAR
                VStack(spacing:30) {
                    Text("Find Your\nLoctician!")
                        .font(.title.bold())
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.center)
                    
                    TextField("Barber...", text: .constant(""))
                        .padding()
                        .background(.white)
                        .clipShape(Capsule())
                        .padding(.horizontal, 40)
                    
                }//end title and search bar
                
                //Mark: Categories and Specialists
                VStack(spacing:30) {
                    
                    VStack(spacing:20) {
                        
                        HStack {
                            Text("Categories")
                                .font(.title2.bold())
                            
                            Spacer()
                            
                            NavigationLink(destination: AllCategoriesView()) {
                                Text("See All")
                                    .foregroundStyle(Color("BackgroundColor"))
                                    .bold()
                                
                            }
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing:20){
                                
                                CategoryCardView(icon: "hand.raised", category: "Nails", destination: CategoryView())
                                
                                CategoryCardView(icon: "eye", category: "Lashes",
                                    destination: CategoryView())
                                
                                CategoryCardView(icon: "wind", category: "Hair",
                                    destination: CategoryView())
                                
                                CategoryCardView(icon: "face.smiling", category: "Facial",
                                    destination: CategoryView())
                                
                                
                            }
                        }// End: Categories
                        
                        VStack(alignment: .leading,spacing:20){
                            Text("Stylists")
                                .font(.title2.bold())
                            
                            
                            ScrollView(.vertical, showsIndicators: false){
                                VStack(spacing: 20){
                                    
                                    ForEach(Specialist.mocks, id:\.name){ specialist in
                                        
                                        SpecialistCardView(specialist: specialist)
                                    }
                                    
                                }
                            }
                        }
                        
                    }
                    
                }//End: Categories and Special
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .init(horizontal: .center, vertical: .center))
                .padding(20)
                .background(Color("SurfaceColor"))
                
                
            }// END: VSTACK - MAIN
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BgColor2"))
            
        }// END:  NavigationStack
    }// END: Body
}// END: SpecialistView

#Preview {
    SpecialistView()
}

//Ctrl I  to reorganize code
