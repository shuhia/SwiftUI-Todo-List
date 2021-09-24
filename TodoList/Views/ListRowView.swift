//
//  ListRowView.swift
//  TodoList
//
//  Created by Nick Sarno on 3/2/21.
//

import SwiftUI

struct ListRowView: View {
    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }()
    @State var dueDate = Date()
    let item: ItemModel
    
    var body: some View {
        
        HStack {
            VStack {
                HStack {
                    Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                        .foregroundColor(item.isCompleted ? .green : .red)
                    Text(item.title)
                        .font(.title2)
                }
                HStack {
                    Text(item.description)
                        .font(.subheadline)
                }
                HStack {
                    Text("Due date is: \(item.dueDate, formatter: dateFormatter)")
                        .font(.subheadline)
                }
                
            }
            NavigationLink("", destination: TodoDetailedView()) //tap anywhere on task to navigate to the detailed view
        }
        .padding(6)
    }
    
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "First item!", description: "describe first task", dueDate: Date(), isCompleted: false)
    static var item2 = ItemModel(title: "Second Item.", description: "describe second task", dueDate: Date(), isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
        
    }
}
