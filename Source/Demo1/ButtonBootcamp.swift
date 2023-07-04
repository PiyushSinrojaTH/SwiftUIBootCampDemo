//
//  ButtonBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 07/04/23.
//

import SwiftUI

struct ButtonBootcamp: View {
    
    @State var title: String = ""
   
    @State var isOn: Bool = false {
        didSet {
            if isOn {
                self.title = "ON"
            } else {
                self.title = "OFF"
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
            
            Button("Press me!") {
                self.isOn.toggle()
            }
            
            Button {
                self.isOn.toggle()
            } label: {
                Text("Change".uppercased())
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        Color.blue
                            .cornerRadius(10)
                            .shadow(color: .black.opacity(0.3), radius: 10)
                    )
            }

            
            Button {
                self.isOn.toggle()
            } label: {
                Circle()
                    .fill(Color.white)
                    .frame(width: 75, height: 75)
                    .shadow(radius: 10)
                    .overlay(
                        Image(systemName: "heart.fill")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                    )
            }

            
            Button {
                self.isOn.toggle()
            } label: {
                Text("Finish".uppercased())
                    .font(.caption)
                    .bold()
                    .foregroundColor(.gray)
                    .padding()
                    .padding(.horizontal, 10)
                    .background(
                        Capsule()
                            .stroke(Color.gray, lineWidth: 2.0)
                    )
                
                
            }

            
        }
    }
}

struct ButtonBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonBootcamp()
    }
}
