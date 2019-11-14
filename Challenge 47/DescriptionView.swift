//
//  DescriptionView.swift
//  Challenge 47
//
//  Created by Levit Kanner on 14/11/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct DescriptionView: View {
    @State var activity: Activity
    
    var body: some View {
        GeometryReader{ geometry in
            ScrollView {
                VStack{
                    Text(self.activity.description)
                        .frame(width: geometry.size.width)
                        .padding()
                    Section{
                        Button(action: {
                            self.activity.completed()
                        }){
                            Text("completed: \(self.activity.completions)")
                        }
                    .padding()
                    }
                }
            }
          }
        .navigationBarTitle("\(self.activity.title)" , displayMode: .inline)
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var activity = Activities()
    
    static var previews: some View {
        DescriptionView(activity: activity.activities[0])
    }
}
/*
 Add functionality to button to modify completions property of an activity. 
 */
