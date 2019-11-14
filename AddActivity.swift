//
//  AddActivity.swift
//  Challenge 47
//
//  Created by Levit Kanner on 13/11/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct AddActivity: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var title = ""
    @State private var description = ""
    @State private var completions = 0
    var activities: Activities
    @State private var alertShowing = false
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Activity Title")){
                    TextField("Activity", text: $title)
                }
                Section(header: Text("Description")){
                    TextField("description", text: $description)
                    Text(self.description)
                }
                Button(action: {
                    //Perform button action
                    self.addActivity()
                }){
                    Text("Add Activity")
                }
                
            }
            .alert(isPresented: $alertShowing, content: { () -> Alert in
                Alert(title: Text("Problem!").foregroundColor(.red), message: Text("Leave no field empty"), dismissButton: .default(Text("Okay")))
            })
            .navigationBarTitle(Text("Add Activity"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Text("cancel")
                })
        }
    }
    
    func addActivity(){
        
        guard
            self.title != ""  ,
            self.description != "" else {
                self.alertShowing = true
                return
        }

        //Validation
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: title.utf16.count)
        let misSpelledRange = checker.rangeOfMisspelledWord(in: title, range: range, startingAt: 0, wrap: false, language: "en")
        
        guard misSpelledRange.location == NSNotFound
            else{
                self.alertShowing = true
                return
        }
        
        let activity = Activity(title: self.title, description: self.description, completions: self.completions)
        self.activities.activities.append(activity)
        self.presentationMode.wrappedValue.dismiss()
    }

}

struct AddActivity_Previews: PreviewProvider {
    static var activities = Activities()
    static var previews: some View {
        
        AddActivity(activities: activities)
    }
}
