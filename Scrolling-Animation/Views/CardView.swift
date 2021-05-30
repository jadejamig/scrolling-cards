//
//  CardView.swift
//  Scrolling-Animation
//
//  Created by Anselm Jade Jamig on 5/30/21.
//

import SwiftUI

struct CardView: View {
    @Binding var isNotRotated: Bool
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
        .frame(width: 370, height: 250)
        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
        .rotationEffect(.degrees(self.isNotRotated ? 0 : 90))
        .animation(.spring())
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(isNotRotated: .constant(false), card: cards[0])
    }
}
