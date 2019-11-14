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
                    NavigationLink(destination: DescriptionView(activity: activity)) {
                        HStack{
                          Text(activity.title)
                            .font(.headline)
                          Text("\(activity.completions)")
                            .font(.system(size: 10, weight: .semibold, design: .serif))
                        }
                        
                    }
                   
                }
                .onDelete { (IndexSet) in
                    self.removeRow(offsets: IndexSet)
                }
            }
            .navigationBarTitle("Activity Tracker", displayMode: .automatic)
            .navigationBarItems(leading: EditButton(), trailing: Button(action:{
                self.showingForm = true
            }){
              Image(systemName:"plus")
                .resizable()
                .frame(width: 20 , height: 20)
            })
                .frame(width: 50 , height: 50)
        }
        .sheet(isPresented: $showingForm) {
            AddActivity(activities: self.activities)
        }
    }
    
    func removeRow(offsets: IndexSet){
        self.activities.activities.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
