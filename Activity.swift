//
//  Activity.swift
//  Challenge 47
//
//  Created by Levit Kanner on 13/11/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import Foundation

struct Activity: Codable , Identifiable{
    let id = UUID()
    let title: String
    let description: String
    var completions: Int 
}


class Activities: ObservableObject{
    
    @Published var activities: [Activity]{
        //Sets data to userdefaults whenever there's a new data added
        didSet{
            let encoder = JSONEncoder()
            if let encodedData = try? encoder.encode(activities){
                UserDefaults.standard.set(encodedData, forKey: "activities")
            }
        }
    }
    
    init(){
        //Get data from Userdefaults if there are any
        if let data = UserDefaults.standard.data(forKey: "activities"){
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Activity].self, from: data){
            self.activities = decodedData
                return
            }
        }
        self.activities = []
    }
}
