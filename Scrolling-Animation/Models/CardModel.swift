//
//  CardModel.swift
//  Scrolling-Animation
//
//  Created by Anselm Jade Jamig on 5/30/21.
//

import SwiftUI

struct CardModel: Identifiable {
    var id = UUID()
    var image: String
    var money: String
    var color: Color
}

let cards = [
    CardModel(image: "Blur01", money: "$999", color: Color(#colorLiteral(red: 0.4823529412, green: 0.3294117647, blue: 0.9647058824, alpha: 1))),
    CardModel(image: "Blur02", money: "$1,256", color: Color(#colorLiteral(red: 0.372150749, green: 0.3631125689, blue: 1, alpha: 1))),
    CardModel(image: "Blur05", money: "$5,234", color: Color(#colorLiteral(red: 1, green: 0.5067250133, blue: 0.8512491584, alpha: 1))),
    CardModel(image: "Blur06", money: "$3,356", color: Color(#colorLiteral(red: 0.8208463788, green: 0.5029298663, blue: 1, alpha: 1))),
    CardModel(image: "Blur07", money: "$534", color: Color(#colorLiteral(red: 0.348875463, green: 0.2365662456, blue: 0.9905931354, alpha: 1)))
]
