//
//  MultipleSelectionView.swift
//  NextTrip
//
//  Created by larissa.bernardon on 12/07/23.
//

import SwiftUI

struct MultipleSelectionView: View {
    @State private var selectedPreferences: Set<String> = []

    let options = ["Cultura", "Natureza", "Economica", "Luxo", "Experiências gastronomicas", "Esportes"]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(options, id: \.self) { option in
                    Button(action: {
                        toggleOption(option)
                    }) {
                        Text(option)
                            .font(.system(size: 14))
                            .foregroundColor(selectedPreferences.contains(option) ? .white : .black)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(selectedPreferences.contains(option) ? Color.black : Color.gray.opacity(0.3))
                            .cornerRadius(10)
                    }
                }
            }
        }
    }

    func toggleOption(_ option: String) {
        if selectedPreferences.contains(option) {
            selectedPreferences.remove(option)
        } else {
            selectedPreferences.insert(option)
        }
    }
}

struct MultipleSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSelectionView()
    }
}
