//
//  TodoDetailedView.swift
//  TodoList
//
//  Created by Alex On on 2021-09-23.
//

import SwiftUI


struct TodoDetailedView: View {
    
    // MARK: PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var title: String = ""
    // Get values from viewModel
    @State var description: String = ""
    @State var date = Date()
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    // MARK: BODY
    
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Title...", text: $title)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                TextEditor(text: $description).multilineTextAlignment(.leading)
                    .padding(5)
                    .frame(height:232, alignment: .topLeading)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                DatePicker("Due date:", selection: $date, displayedComponents:[.date]
                )
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
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
            .padding(14)
        }
        .navigationTitle("Detailed View 🖊")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    // MARK: FUNCTIONS
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: title)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if title.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long!!! 😨😰😱"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

struct TodoDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                TodoDetailedView()
            }
            .preferredColorScheme(.light)
            .environmentObject(ListViewModel())
            NavigationView {
                TodoDetailedView()
            }
            .preferredColorScheme(.dark)
            .environmentObject(ListViewModel())

        }
    }
}
