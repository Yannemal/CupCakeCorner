//
//  Order.swift
//  CupCakeCorner Project 10 Day49
//  @TwoStraws - Paul Hudson's 100DaysOfSwiftUI
//  Created by yannemal on 29/09/2023.
//  Order -> Model in 'M'  V  VM

import SwiftUI

class Order: ObservableObject, Codable {
    
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
    }
    
    static let types = ["vanilla", "StrawMerry", "Chocolatte", "Rasinbow"]
    
    // all the @Published will be the @State values of @StateObject when class is instanced and referenced.
    
    @Published var type = 0
    @Published var quantity = 1
    
    @Published var specialRequestEnabled = false {
        didSet {
            // this prevents values ⬇️ remaining true if user goes back and sets ⬆️ to false
            if !specialRequestEnabled {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    // for AddressView
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
//    var hasValidAddress: Bool {
//        if name.isEmpty etc
//    }
    
    // computed prop for cost in checkout
    var cost: Double {
        // price per cake
        var cost = Double(quantity) * 200
        // complicated cake cost more
           //         cost += Double(type) / 2
                    
        if extraFrosting {
            cost += Double(quantity) * 10
            // 10 pesos
        }
        
        if addSprinkles {
            cost += Double(quantity) * 20
        // 20 pesos
        }
        return cost
    }
    
    /* ************************************************************* */
    /*                                                               */
    /*                      MARK: - METHODS                          */
    /*                                                               */
    /* ************************************************************* */

    //  case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
    
    init() { }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        // connect the dots by hand
        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)
        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(addSprinkles, forKey: .addSprinkles)
        try container.encode(name, forKey: .name)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)
        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
        
        name = try container.decode(String.self, forKey: .name)
        streetAddress = try container.decode(String.self, forKey: .streetAddress)
        city = try container.decode(String.self, forKey: .city)
        zip =  try container.decode(String.self, forKey: .zip)
        
    }
}
