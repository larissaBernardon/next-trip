//
//  ProfileView.swift
//  NextTrip
//
//  Created by larissa.bernardon on 15/05/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 30) {
            Button(action: {
                let defaults = UserDefaults.standard
                let oldValue = defaults.dictionaryRepresentation()
                print("Valor antes de limpar as viagens locais: \(oldValue)")

                DataManager.clearUserDefaults()

                let newValue = defaults.dictionaryRepresentation()
                print("Valor depois de limpar as viagens locais: \(newValue)")
            }) {
                Text("Limpar viagens locais")
            }

            Text("Sair")
        }
    }
}
