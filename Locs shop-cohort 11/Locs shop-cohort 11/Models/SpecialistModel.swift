//
//  Specialist.swift
//  Locs shop-cohort 11
//
//  Created by Stephen Truitt on 8/12/26.
//

class Specialist {
    var name: String
    var specialty: String
    var minPrice: Double
    var maxPrice: Double
    var rating: Double
    var image: String
    var description: String
    
    init(name: String, specialty: String, minPrice: Double, maxPrice: Double, rating: Double, image: String, description: String) {
        self.name = name
        self.specialty = specialty
        self.minPrice = minPrice
        self.maxPrice = maxPrice
        self.rating = rating
        self.image = image
        self.description = description
    }
}


//extension
extension Specialist {
    
    // Mock Data - Testing data
    
    static let mocks: [Specialist] = [
    
        Specialist(name: "Stephen Truitt", specialty: "Locs/Barber", minPrice: 79.99, maxPrice: 159.99, rating: 4.95, image: "person", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sem leo, mattis ac suscipit quis, mollis at nisl. Praesent congue sapien."),
        
        Specialist(name: "Fernanda Murillo", specialty: "Hair/Locs", minPrice: 79.99, maxPrice: 159.99, rating: 4.85, image: "person", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sem leo, mattis ac suscipit quis, mollis at nisl. Praesent congue sapien."),
        
        Specialist(name: "Bobby Brown", specialty: "Hair/Locs", minPrice: 50.99, maxPrice: 159.99, rating: 4.95, image: "person", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sem leo, mattis ac suscipit quis, mollis at nisl. Praesent congue sapien."),
        
        Specialist(name: "Destini Kane", specialty: "Locs", minPrice: 50.99, maxPrice: 159.99, rating: 4.95, image: "person", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sem leo, mattis ac suscipit quis, mollis at nisl. Praesent congue sapien."),
        
        Specialist(name: "Johnny Wick", specialty: "Barber", minPrice: 50.99, maxPrice: 159.99, rating: 4.95, image: "person", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sem leo, mattis ac suscipit quis, mollis at nisl. Praesent congue sapien."),
        
        Specialist(name: "Ashley Davoe", specialty: "Locs", minPrice: 50.99, maxPrice: 159.99, rating: 4.95, image: "person", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sem leo, mattis ac suscipit quis, mollis at nisl. Praesent congue sapien.")
        
        
    ]
}

