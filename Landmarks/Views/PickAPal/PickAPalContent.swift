//
//  DynamicContentView.swift
//  Landmarks
//
//  Created by 远路蒋 on 2024/10/18.
//

import SwiftUI

struct PickAPalContent: View {
    //"Elisha", "Andre", "Jasmine", "Po-Chun"
    @State private var names: [String] = []
    @State private var nameToAdd = ""
    @State private var pickedName = ""
    @State private var shouldRemovePickedName = false
    var body: some View {
        VStack {
            
            VStack {
                Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical)
                Text("Pick-a-Pal")
            }
            .font(.title)
            .bold()
            
            Text(pickedName.isEmpty ? " " : pickedName)
                .font(.title2)
                .bold()
                .foregroundStyle(.tint)
            List {
                ForEach(names, id: \.description) { name in
                    Text(name)
                }
            }
            TextField("Add name", text: $nameToAdd)
                .autocorrectionDisabled()
                .onSubmit {
                    if !nameToAdd.isEmpty {
                        names.append(nameToAdd)
                        nameToAdd = ""
                    }
                    
                }
            
            Divider()
            Toggle("Remove when picked", isOn: $shouldRemovePickedName)
            Button("Pick Random Name") {
                // use randomElement with an array to get one of its elements at random, its a optional value
                if let randomName = names.randomElement() {
                    pickedName = randomName
                    
                    if shouldRemovePickedName {
                        names.removeAll { name in
                            return name == randomName
                        }
                    }
                } else {
                    pickedName = ""
                }
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            
            // use a custom button label
            // action closure contains imperative code, and the label closure contains declarative view code
            Button(action: {
                if let randomName = names.randomElement() {
                    pickedName = randomName
                    
                    if shouldRemovePickedName {
                        names.removeAll { name in
                            return name == randomName
                        }
                    }
                } else {
                    pickedName = ""
                }
            }, label: {
                Text("Pick Random Name")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
            })
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    PickAPalContent()
}
