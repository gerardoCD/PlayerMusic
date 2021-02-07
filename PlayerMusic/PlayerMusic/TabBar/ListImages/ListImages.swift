//
//  ListImages.swift
//  PlayerMusic
//
//  Created by Gerardo Castillo Durán on 05/02/21.
//

import SwiftUI
import  SwiftUIPager

struct ListImages: View {
    
    @State var page = 0
    var height = 0.0
    var width = 0.0

    var items = ["paisaje","paisaje2","batman","batman2"]
    
    var body: some View {
        Pager(page: $page,
              data: items,
              id: \.self,
              content: { index in
            Image(index).resizable().scaledToFit()
                .frame(width: CGFloat(width) - 40, height: CGFloat(height) - 150 )
        })

            .vertical()
            .padding(30)
    }
}

struct ListImages_Previews: PreviewProvider {
    static var previews: some View {
        ListImages()
    }
}
