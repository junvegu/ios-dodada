//
//  File.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 26/02/25.
//

import SwiftUI

public struct DDDRating: View {
    
    var imageUser: DDDIcon.Images
    var userName: String
    var date: String
    var description: String
    var rating: Int
    
    public var body: some View {
        VStack(alignment: .leading){
            HStack{
                DDDIcon(imageUser)
                
                VStack{
                    Text(userName)
                        .apply(token: .footNote,
                               weight: .bold)
                    DDDRatingView(rating: .constant(Int(rating)))
                }
                Spacer()
                
                HStack{
                    Text(date)
                        .apply(token: .caption2,
                               weight: .bold)
                        .padding(.bottom)
                }
            }
            
            Text(description)
                .apply(token: .footNote)
            
        }.padding(.horizontal)
    }
}

#Preview {
    DDDRating(imageUser: .user ,userName:  "Steve Jobs", date: "10/10/2025", description: "En este evento les presentamos oficialmente al nuevo integrante de la familia, el iPhone 16e.", rating: 5)
}
