//
//  BookAppointmentView.swift
//  Locs shop-cohort 11
//
//  Created by Stephen Truitt on 8/10/26.
//

import SwiftUI

struct BookAppointmentView: View {
    var body: some View {
        
        ZStack {
            Color("BgColor2")
                .ignoresSafeArea()
            
            VStack(spacing:10){
                
                Image(systemName:"progress.indicator")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundStyle(Color.white)
                
                Text("Book Appointment")
                    .font(.largeTitle)
                    .foregroundStyle(Color.white)
                    .bold()
                
                
                Text("Under Construction...")
                    .font(.caption)
                    .foregroundStyle(Color.white)
            }
            VStack {
                
            }
            
        }
    }
}


#Preview {
    BookAppointmentView()
}
