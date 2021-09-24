//
//  ListRowView.swift
//  TodoList
//
//  Created by Nick Sarno on 3/2/21.
//

import SwiftUI

struct ListRowView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }()
    @State var dueDate = Date()
    let item: ItemModel
    
    var body: some View {
        
        HStack {
            
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle").background(Color.white).cornerRadius(10)
                .foregroundColor(item.isCompleted ? .green : .red).padding().onTapGesture {
                    withAnimation(.linear) {
                        listViewModel.updateItem(item: item)
                    }
                }
            
            HStack{ VStack(alignment: .leading) {
                
                HStack(alignment: .center) {
                    Text(item.title)
                        .font(.title2).multilineTextAlignment(.leading)
                }
                
                HStack {
                    Text(item.description)
                        .font(.subheadline).multilineTextAlignment(.leading)
                }
                HStack {
                    Text("📆 Due date:  \(item.dueDate, formatter: dateFormatter)")
                        .font(.subheadline)
                }
               
            }.padding()
                HStack{  NavigationLink(">", destination: TodoDetailedView(id:item.id, title:item.title, description: item.description,dueDate:item.dueDate, isCompleted:item.isCompleted))
                    .frame(width: 20.0)}
                    
              
                
            }
           
           
        }
        .padding(6)
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.yellow/*@END_MENU_TOKEN@*/).ignoresSafeArea()
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
