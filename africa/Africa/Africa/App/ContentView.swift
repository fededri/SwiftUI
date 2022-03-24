//
//  ContentView.swift
//  Africa
//
//  Created by Federico Torres on 24/06/2021.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)

    @State private var isGridViewActive: Bool = false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"

    func gridSwitch(){
        let numberOfColumns = gridLayout.count % 3 + 1
        gridLayout = Array(repeating: .init(.flexible()), count: numberOfColumns)
        switch numberOfColumns {
        case 1: toolbarIcon = "square.grid.2x2"
        case 2: toolbarIcon = "square.grid.3x2"
        case 3: toolbarIcon = "rectangle.grid.1x2"
        default: toolbarIcon = "square.grid.2x2"
        }
    }

    // MARK: - BODY
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }
                        }
                        Text("Demo app written by Federico Torres")
                            .font(.caption)
                            .modifier(CenterModifier())
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        LazyVGrid(columns: gridLayout, alignment: .center , content: {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)){
                                    AnimalGridItemView(animal: animal)
                                }
                            }

                        })
                        .padding(10)
                        .animation(.easeIn)
                    })
                } //: LIST
            } //: GROUP
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack(spacing: 16) {
                            Button(action: {
                                print("List view is activated")
                                isGridViewActive = false
                                haptics.impactOccurred()
                            }) {
                                Image(systemName: "square.fill.text.grid.1x2")
                                    .font(.title2)
                                    .foregroundColor(isGridViewActive ? .primary : .accentColor)
                            }

                            Button(action: {
                                print("Grid view is activated")
                                isGridViewActive = true
                                gridSwitch()
                                haptics.impactOccurred()
                            }) {
                                Image(systemName: toolbarIcon)
                                    .font(.title2)
                                    .foregroundColor(isGridViewActive ? .accentColor : .primary)
                            }
                        }
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
