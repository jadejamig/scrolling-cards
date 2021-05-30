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

// Static Values

let purchases1 = [
    PurchaseModel(icon: "star", title: "HBO Subscription", date: "Apr 14th", money: "-$66.27"),
    PurchaseModel(icon: "music.note", title: "Spotify Premium", date: "Apr 23rd", money: "-$9.99"),
    PurchaseModel(icon: "cart", title: "H&M Clothing", date: "May 1st", money: "-$36.89"),
    PurchaseModel(icon: "cross", title: "Dentist Clinic", date: "May 17th", money: "-$104.00"),
    PurchaseModel(icon: "wallet.pass", title: "Patreon", date: "Aug 16th", money: "-$3.99")
]

let purchases2 = [
    PurchaseModel(icon: "cart", title: "Groceries", date: "Aug 7th", money: "-$104.27"),
    PurchaseModel(icon: "wrench.and.screwdriver", title: "Appliances", date: "Aug 27th", money: "-$34.99"),
    PurchaseModel(icon: "bolt", title: "Electricity bill", date: "Sep 3rd", money: "-$456.89"),
    PurchaseModel(icon: "cross", title: "Vet Clinic", date: "Sep 17th", money: "-$384.00"),
    PurchaseModel(icon: "heart", title: "Dog Food", date: "Oct 16th", money: "-$399.99")
]

let purchases3 = [
    PurchaseModel(icon: "iphone", title: "iPhone Xs", date: "Oct 4th", money: "-$899.00"),
    PurchaseModel(icon: "applewatch", title: "Apple watch", date: "Oct 19th", money: "-$199.99"),
    PurchaseModel(icon: "car", title: "Grab Taxi", date: "Nov 2nd", money: "-$1000.00"),
    PurchaseModel(icon: "drop", title: "Water bill", date: "Nov 17th", money: "-$200.00"),
    PurchaseModel(icon: "wifi", title: "Wifi bill", date: "Dec 16th", money: "-$30.99")
]

let purchases4 = [
    PurchaseModel(icon: "house", title: "House rent", date: "Jan 4th", money: "-$1500.00"),
    PurchaseModel(icon: "gamecontroller", title: "Game purchase", date: "Feb 6th", money: "-$50.99"),
    PurchaseModel(icon: "tv", title: "Smart TV", date: "Mar 19th", money: "-$250.89"),
    PurchaseModel(icon: "creditcard", title: "Monthly credit", date: "Jun 22nd", money: "-$860.00"),
    PurchaseModel(icon: "banknote", title: "Tuition fee", date: "Jul 4th", money: "-$3000.99")
]

let purchases5 = [
    PurchaseModel(icon: "car", title: "Grab Taxi", date: "Jan 3rd", money: "-$9.27"),
    PurchaseModel(icon: "bolt", title: "Electricity bill", date: "Feb 7th", money: "-$256.99"),
    PurchaseModel(icon: "drop", title: "Water bill", date: "Mar 14th", money: "-$16.89"),
    PurchaseModel(icon: "house", title: "House rent", date: "May 17th", money: "-$1400.00"),
    PurchaseModel(icon: "heart", title: "Dog Food", date: "May 16th", money: "-$18.99")
]

let purchasesCollection = [purchases1, purchases2, purchases3, purchases4, purchases5]
