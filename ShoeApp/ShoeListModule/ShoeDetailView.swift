//
//  ShoeDetailView.swift
//  ShoeApp
//
//  Created by TejaDanasvi on 25/7/2023.
//

import SwiftUI

struct ShoeDetailView: View {
    @Binding  var selectedItem: Products?

    var body: some View {
        VStack(spacing: 10) {
            Image((selectedItem?.image_name)!)
                .resizable()
                .scaledToFit()
            Text(selectedItem?.name ?? "")
                .fontWeight(.bold)
            Text(selectedItem?.description ?? "")
                .multilineTextAlignment(.leading)
            
        }
    }
}

struct ShoeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ShoeDetailView(selectedItem: .constant(.none))
    }
}
