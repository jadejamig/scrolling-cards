//
//  BottomCardView.swift
//  Scrolling-Animation
//
//  Created by Anselm Jade Jamig on 5/30/21.
//

import SwiftUI

struct BottomCardView: View {
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 100, height: 5)
                .foregroundColor(Color.white.opacity(0.3))
                .cornerRadius(16)
                .padding(.top)
                .padding(.bottom)
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(purchases) { purchase in
                        cell(purchase: purchase)
                            .background(Color(#colorLiteral(red: 0.1461126804, green: 0.1452512741, blue: 0.1467794478, alpha: 1)))
                    }
                }
            }
        }
        .frame(height: 450)
        .background(Color(#colorLiteral(red: 0.1461126804, green: 0.1452512741, blue: 0.1467794478, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }
}

struct BottomCardView_Previews: PreviewProvider {
    static var previews: some View {
        BottomCardView()
    }
}

struct cell: View {
    var purchase: PurchaseModel
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Image(systemName: self.purchase.icon)
                        .foregroundColor(.white)
                        .font(Font.subheadline.weight(.bold))
                }
                .frame(width: 40, height: 40)
                .background(Color.white.opacity(0.3))
                .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(self.purchase.title)
                        .foregroundColor(.white)
                        .bold()
                    Text(self.purchase.date)
                        .foregroundColor(.white.opacity(0.7))
                }
                
                Spacer()
                
                Text(self.purchase.money)
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
        
        
    }
}
