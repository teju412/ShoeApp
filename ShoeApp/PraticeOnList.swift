//
//  PraticeOnList.swift
//  PraticeOnGettingTextfieldData
//
//  Created by TejaDanasvi on 20/7/2023.
//

import SwiftUI
class ShoeViewModel: ObservableObject {
    //@Published var usersProducts: Response?
    @Published var usersProducts = [Products]()
    
            
    init(){
        print(usersProducts.count)
        if let localData = self.readLocalFile(forName: "EcommerceJson") {
            do {
                let decodedData = try JSONDecoder().decode(ProductModel.self,
                                                           from: localData)
                self.usersProducts = decodedData.response?.products ?? []
            } catch let error {
                print(error)
            }
        }
    }
        
        
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
         
    }


struct PraticeOnList: View {
    @StateObject var shoeViewModel = ShoeViewModel()
    @State private var selectedItem: [Products]?
    @State private var presentView = false
        var body: some View {
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
                        
                    }
                    .onTapGesture {
                        selectedItem = shoeViewModel.usersProducts
                        presentView.toggle()
                        
                    }
                    .sheet(isPresented: $presentView) {
                        Text("")
                    }
                }
                
                
            }.listStyle(.plain)
                
        }
    }
}
struct PraticeOnList_Previews: PreviewProvider {
    static var previews: some View {
        PraticeOnList()
    }
}
