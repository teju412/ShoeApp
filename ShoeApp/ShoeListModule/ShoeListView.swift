//
//  PraticeOnList.swift
//  PraticeOnGettingTextfieldData
//
//  Created by TejaDanasvi on 20/7/2023.
//

import SwiftUI

struct ShoeListView: View {
    @StateObject var shoeViewModel = ShoeViewModel()
    @State private var selectedItem: Products?
    @State private var presentView = false
        var body: some View {
            NavigationStack() {
                VStack {
                    List {
                        ForEach(shoeViewModel.usersProducts) { result in
                            HStack(spacing: 20) {
                                Image(result.image_name!)
                                    .resizable()
                                    .frame(width: 200, height: 200)
                                
                                    .cornerRadius(10)
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    Text(result.name!)
                                        .font(.system(size: 30, weight: .bold, design: .rounded))
                                    Text(result.price!)
                                    
                                    Text(result.description!)
                                        .fontWeight(.ultraLight)
                                        .lineLimit(3)
                                    
                                }
                                
                            }.onTapGesture {
                                selectedItem = result
                                presentView.toggle()
                                
                            }
                            
                        }
                        
                        
                    }.listStyle(.plain)
                        .navigationTitle(selectedItem?.name ?? "")
                        .navigationDestination(isPresented: $presentView) {
                            ShoeDetailView(selectedItem: $selectedItem)
                        }
                    
                }
            }
    }
}
struct ShoeListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoeListView()
    }
}
