//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by 远路蒋 on 2024/10/15.
//

import SwiftUI

struct FavoriteButton: View {
    /**
     绑定属性包装器可以让你在存储数据的属性和显示和更改数据的视图之间进行读写
     由于使用绑定，因此在此视图内所做的更改会传播回数据源
     */
    @Binding var isSet: Bool
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .orange : .gray)
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
