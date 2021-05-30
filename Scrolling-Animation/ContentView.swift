//
//  ContentView.swift
//  Scrolling-Animation
//
//  Created by Anselm Jade Jamig on 5/30/21.
//

import SwiftUI

struct ContentView: View {
    @State var isNotRotated = false
    
    @State var isDragging = false
    @State var dragValue = CGFloat.zero
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            TabView(selection: $isNotRotated) {
                ForEach(cards) { card in
                    VStack(alignment: .center) {
                        Text("Current Balance")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.white.opacity(0.5))
                            .offset(y: self.isNotRotated ? -50 : 0)
                        Text("$11,502")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                            .offset(y: self.isNotRotated ? -50 : 0)
                        HStack {
                            GeometryReader { geometry in
                                CardView(isNotRotated: self.$isNotRotated, card: card)
                                    .shadow(color: card.color1.opacity(0.5), radius: 50, x: 10, y: 20)
                                    .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 20) / 30),
                                                      axis: (x: 10, y: -20, z: 0))
                                    .padding(.top, isNotRotated ? -50 : CGFloat(50))
                            }
                        }
                    }
                    .padding(.top, 50)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            VStack {
                Spacer()
                BottomCardView()
                    .offset(y: self.isNotRotated ? 0 : UIScreen.main.bounds.height)
                    .animation(.spring())
            }
            .edgesIgnoringSafeArea(.all)
            .offset(y: isDragging ? dragValue : 0)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        self.isDragging = true
                        self.dragValue = value.translation.height
                    })
                    .onEnded({ value in
                        if value.translation.height > 250 {
                            self.isNotRotated.toggle()
                        }
                        self.isDragging = false
                        self.dragValue = .zero
                    })
            )
        }
        .animation(.spring())
        .onTapGesture {
            self.isNotRotated.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


