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
            Spacer()
            ForEach(purchases) { purchase in
                cell(purchase: purchase)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 400)
        .background(Color(#colorLiteral(red: 0.168627451, green: 0.168627451, blue: 0.168627451, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
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
        .padding(.vertical, 8)
        
        
    }
}
