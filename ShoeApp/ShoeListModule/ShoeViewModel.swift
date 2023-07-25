//
//  ShoeViewModel.swift
//  ShoeApp
//
//  Created by TejaDanasvi on 24/7/2023.
//

import SwiftUI

class ShoeViewModel: ObservableObject {
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
