//
//  ContentView.swift
//  Scrolling-Animation
//
//  Created by Anselm Jade Jamig on 5/30/21.
//

import SwiftUI

struct ContentView: View {
    @State var rotate: Bool = true
    @State var clickedCard: CardModel = cards[0] // default value
    @State var isDragging = false
    @State var dragValue = CGFloat.zero
    @State var isDragging2 = false
    @State var dragValue2 = CGSize.zero
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.1333333333, green: 0.1333333333, blue: 0.1333333333, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 4) {
                Text("Current Balance")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.white.opacity(0.5))
                Text("$11,502")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
            }
            .offset(y: self.rotate ? -270 : -320)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: self.rotate ? 0 : CGFloat(50)) {
                    ForEach(cards) { card in
                        GeometryReader { geometry in
                            Card(card: card)
                                .rotationEffect(.degrees( self.rotate ? 90 : 0))
                                .shadow(color: card.color1.opacity(0.3), radius: 10, x: 5, y: 20)
                                .opacity(self.rotate ? 1 : 0)
                                .frame(width: self.rotate ? 200 : CGFloat(325), height: self.rotate ? 325 : CGFloat(200))
                                .rotation3DEffect(
                                    Angle(degrees: Double(geometry.frame(in: .global).minX - 20) / 30),
                                    axis: (x: 10.0, y: -20.0, z: 0)
                                )
                                .onTapGesture {
                                    self.clickedCard = card
                                    self.rotate.toggle()
                                }
                        }
                        .frame(width: self.rotate ? 200 : CGFloat(330), height: self.rotate ? 325 : CGFloat(200))
                    }
                    .frame(width: 325)
                }
                .frame(height: 500)
                .padding(.horizontal, 25 )
            }
            .frame(alignment: .center)
            .offset(y: self.rotate ? 0 : -160)
            
            
            VStack {
                Spacer()
                BottomCardView()
                    .offset(y: self.rotate ? UIScreen.main.bounds.height : 20)
                    .animation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0))
            }
            .offset(y: isDragging ? dragValue : 0)
            .edgesIgnoringSafeArea(.all)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        self.isDragging = true
                        self.dragValue = value.translation.height
                    })
                    .onEnded({ value in
                        if value.translation.height > 250 {
                            self.rotate = true
                        }
                        self.isDragging = false
                        self.dragValue = .zero
                    })
            )
            
            Card(card: self.clickedCard)
                .offset(y: -160)
                .opacity(self.rotate ? 0 : 1)
                .shadow(color: clickedCard.color1.opacity(0.3), radius: 10, x: 5, y: 20)
                .scaleEffect(isDragging2 ? 0.95 : 1)
                .rotation3DEffect(Angle(degrees: isDragging2 ? 5 : 0), axis: (x: dragValue2.width, y: dragValue2.height, z: 0))
                .onTapGesture {
                    self.rotate.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            isDragging2 = true
                            self.dragValue2 = value.translation
                        }
                        .onEnded { value in
                            isDragging2 = false
                            self.dragValue = .zero
                        }
                )
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Card: View {
    var card: CardModel
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [self.card.color1, self.card.color2]), startPoint: .bottomLeading, endPoint: .topTrailing)
            VStack {
                HStack {
                    ForEach(0 ..< 3) { item in
                        HStack(spacing: 5) {
                            ForEach(0 ..< 4) { item in
                                Circle()
                                    .frame(width: 8, height: 8)
                                    .foregroundColor(Color.white.opacity(0.7))
                            }
                        }
                    }
                    Text("1234")
                        .bold()
                        .foregroundColor(.white.opacity(0.7))
                    
                    Spacer()
                }
                .padding([.horizontal, .top], 25)
                
                Spacer()
                
                HStack {
                    Text(self.card.money)
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                        .foregroundColor(Color.white)
                    
                    Spacer()
                    
                    ZStack {
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.white.opacity(0.7))
                            .offset(x: -15)
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.white.opacity(0.7))
                    }
                }
                .padding(.horizontal, 25)
            }
            .padding(.bottom, 25)
        }
        .frame(width: 325, height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
        
    }
}
