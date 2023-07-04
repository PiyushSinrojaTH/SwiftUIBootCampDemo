//
//  ImproveListBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 05/04/23.
//

import SwiftUI

struct ImproveListBootcamp: View {
    
    @State var items = Array(1...10000)
    
    var body: some View {
        VStack {
            Button("Shuffle") {
                self.items.shuffle()
            }
            
            List(items, id: \.self) {
                Text("Item \($0)")
            }
            .id(UUID())
        }
    }
}

struct ImproveListBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ImproveListBootcamp()
    }
}
