//
//  SpecialistCardView.swift
//  Locs shop-cohort 11
//
//  Created by Stephen Truitt on 8/10/26.
//

import SwiftUI

struct SpecialistCardView: View {
    
    let specialist: Specialist
    @State private var isExpanded: Bool = false
    @State private var isLiked: Bool = false
    
    
    var body: some View {
        HStack(spacing: 20) {
            
            Image(systemName: specialist.image)
                .foregroundStyle(Color("BackgroundColor"))
                .font(.largeTitle)
            
            VStack(alignment: .leading,spacing:3) {
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(specialist.name)
                            .font(.title3)
                            .bold()
                            .foregroundColor(Color("BackgroundColor"))
                        
                        Text(specialist.specialty)
                            .font(.subheadline)
                        
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            
                            
                            Text(String(specialist.rating))
                                .font(.caption)
                        }
                    }
                    
                    Spacer()
                    
                    Image(systemName: isLiked ? "heart.fill" :  "heart")
                        .foregroundStyle(.red)
                        .padding(.top, 20)
                        .padding(.bottom, 20 )
                        
                }

                
                Text(specialist.description)
                    .lineLimit(isExpanded ? nil : 2)
                    .foregroundStyle(Color.black.opacity(0.4))
                    
                
                Text(isExpanded ? "See Less" : "See More")
                    .background(Color.white.opacity(0.3))
                    .foregroundStyle(Color.blue)
                    .onTapGesture {
                        isExpanded.toggle()
                    }
                
                
                HStack {
                    Text("$\(specialist.minPrice, specifier: "%.2f")   $\(specialist.maxPrice, specifier: "%.2f")")
                        .font(.footnote)
                        .bold()
                    
                    Spacer()
                    
                    NavigationLink(destination: BookAppointmentView()) {
                        Text("Book")
                    }
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(Color("BgColor2"))
                    .cornerRadius(10)
                    .accessibilityHint("Booking an appointment with    \(specialist.name)")
                    
                }

            }
            
        }
        .padding(10)
        .background(.white)
        .cornerRadius(20)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Specialist \(specialist.name) card")
        .onTapGesture(count: 2) {
            isLiked.toggle()
        }
    }
}

#Preview {
    SpecialistCardView(
        specialist: Specialist(
            name: "Steph Truitt",
            specialty: "Barber",
            minPrice: 30,
            maxPrice: 60,
            rating: 4.5,
            image: "person",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sem leo, mattis ac suscipit quis, mollis at nisl. Praesent congue sapien."
        ))
}
