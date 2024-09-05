//
//  CheckoutView.swift
//  iDine
//
//  Created by Chase Hashiguchi on 9/4/24.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    @State private var paymentType = "Cash"
    @State private var addLoyaltyPoints = false
    @State private var loyaltyNumber = ""
    let tipAmounts = [10, 15, 20, 25, 0]
    @State private var tipAmount = 15
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyPoints.animation())
                if addLoyaltyPoints {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
            }
                Section("Add a tip?") {
                    Picker("Percentage", selection: $tipAmount) {
                        ForEach(tipAmounts, id: \.self) {
                            Text("\($0)%")
                        }
                    }
                    .pickerStyle(.segmented)
            }
            Section("Total: $100") {
                Button("Confirm Order") {
                    // place the order
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CheckoutView()
        .environmentObject(Order())
}
