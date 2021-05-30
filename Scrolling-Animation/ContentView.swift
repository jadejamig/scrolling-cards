//
//  ContentView.swift
//  Scrolling-Animation
//
//  Created by Anselm Jade Jamig on 5/30/21.
//

import SwiftUI

struct ContentView: View {
    @State var selectedIndex: Int = 0
    @State var isNotRotated = false
    
    @State var isDragging = false
    @State var dragValue = CGFloat.zero
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            TabView(selection: $selectedIndex) {
                ForEach(0..<5) { i in
                    VStack(alignment: .center) {
                        Text("Current Balance")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.white.opacity(0.5))
                            .offset(y: self.isNotRotated ? -50 : 0)
                        Text(cards[i].money)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                            .offset(y: self.isNotRotated ? -50 : 0)
                        HStack {
                            GeometryReader { geometry in
                                CardView(isNotRotated: self.$isNotRotated, card: cards[i])
                                    .shadow(color: cards[i].color.opacity(0.5), radius: 20, x: 10, y: 10)
                                    .scaleEffect(geometry.frame(in: .global).minX == 0 ? 1 : 0.9)
                                    .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 20) / 30),
                                                      axis: (x: 10, y: -20, z: 0))
                                    .padding(.top, isNotRotated ? -50 : CGFloat(50))
                            }
                        }
                    }
                    .padding(.top, 50)
                    .tag(i)
                }
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            VStack {
                Spacer()
                BottomCardView(purchases: purchasesCollection[self.selectedIndex])
                    .offset(y: self.isNotRotated ? 0 : UIScreen.main.bounds.height)
                    .animation(.spring())
            }
            .edgesIgnoringSafeArea(.all)
            .offset(y: isDragging ? dragValue : 0)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        self.isDragging = true
                        if value.translation.height < -5 {
                            self.dragValue = -5
                        } else {
                            self.dragValue = value.translation.height
                        }
                        
                    })
                    .onEnded({ value in
                        if value.translation.height > 200 {
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
            print(self.selectedIndex)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


