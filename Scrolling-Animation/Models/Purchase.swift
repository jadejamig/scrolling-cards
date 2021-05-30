//
//  Purchase.swift
//  Scrolling-Animation
//
//  Created by Anselm Jade Jamig on 5/30/21.
//

import SwiftUI

struct PurchaseModel: Identifiable {
    var id = UUID()
    var icon: String
    var title: String
    var date: String
    var money: String
}

let purchases = [
    PurchaseModel(icon: "star", title: "HBO", date: "Today", money: "-$6.27"),
    PurchaseModel(icon: "music.note", title: "Spotify", date: "Yesterday", money: "-$9.99"),
    PurchaseModel(icon: "cart", title: "H&M", date: "Yesterday", money: "-$36.89"),
    PurchaseModel(icon: "cross", title: "Dentist Clinic", date: "May 17th", money: "-$104.00"),
    PurchaseModel(icon: "wallet.pass", title: "Patreon", date: "May 16th", money: "-$3.99")
]
