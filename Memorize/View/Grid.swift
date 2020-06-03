//
//  Grid.swift
//  Memorize
//
//  Created by Satveer Singh on 5/26/20.
//  Copyright © 2020 Satveer Singh. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    private(set) var items: [Item]
    private(set) var itemView: (Item) -> ItemView
    
    init(_ items: [Item], _ itemView: @escaping (Item)-> ItemView) {
        self.items = items
        self.itemView = itemView
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
        }
    }
    
    func body(for layout:GridLayout) -> some View {
        ForEach(items) { item in
            self.body(for: item, layout: layout)
        }
    }
    
    func body(for item:Item, layout: GridLayout) -> some View {
        let index = items.firstIndex(matching: item)!
        return itemView(item)
           .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }
}


//struct Grid_Previews: PreviewProvider {
//    static var previews: some View {
//        Grid()
//    }
//}
