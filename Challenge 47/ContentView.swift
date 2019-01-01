//
//  ContentView.swift
//  Challenge 47
//
//  Created by Levit Kanner on 13/11/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var activities = Activities()
    @State private var showingForm = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(activities.activities) {activity in
                    NavigationLink(destination: AddActivity(activities: self.activities)) {
                        HStack{
                          Text(activity.title)
                            .font(.title)
                          Text("\(activity.completions)")
                        }
                        
                    }
                   
                }
            }
            .navigationBarTitle("Activity Tracker", displayMode: .automatic)
            .navigationBarItems(leading: EditButton(), trailing: Button(action:{
                self.showingForm = true
            }){
              Image(systemName:"plus")
            })
        }
        .sheet(isPresented: $showingForm) {
            AddActivity(activities: self.activities)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
