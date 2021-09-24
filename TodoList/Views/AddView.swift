//
//  AddView.swift
//  TodoList
//
//  Created by Nick Sarno on 3/2/21.
//

import SwiftUI

struct AddView: View {
    
    // MARK: PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldTitle: String = ""
    @State var textFieldDescription: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    @State var dueDate = Date()
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Add a title here...", text: $textFieldTitle)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                TextField("Add a description here..", text: $textFieldDescription)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                DatePicker("Due date:",
                           selection: $dueDate, displayedComponents: [.date])
                
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(10)
        }
        .navigationTitle("Add an Item 🖊")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldTitle, description: textFieldDescription, dueDate: Date())
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldTitle.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long!!! "
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

    // MARK: PREVIEW

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                AddView()
            }
            .preferredColorScheme(.light)
            .environmentObject(ListViewModel())
            NavigationView {
                AddView()
            }
            .preferredColorScheme(.dark)
            .environmentObject(ListViewModel())

        }
    }
}
