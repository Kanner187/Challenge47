//
//  DescriptionView.swift
//  Challenge 47
//
//  Created by Levit Kanner on 14/11/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct DescriptionView: View {
    var activity: Activity
    
    var body: some View {
        Text(activity.description)
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var activity = Activities()
    
    static var previews: some View {
        DescriptionView(activity: activity.activities[0])
    }
}
