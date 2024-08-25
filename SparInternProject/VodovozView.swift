//
//  VodovozView.swift
//  SparInternProject
//
//  Created by Вячеслав Горев on 24/8/2024.
//

import SwiftUI

struct VodovozView: View {
    
    @State var searchQuery = ""
    @State var tabNumber = 0
    
    var goodsTypes: [String] = ["first", "second", "Third"]
    var goods = ["Some one", "Some two", "Some three"]
    
    
    var body: some View {
        
        TabView(selection: $tabNumber) {
            firstTab.tabItem {
                VStack {
                    Image(systemName: "house")
                    Text("Home")
                }
            }.tag(0)
            Text("Tab Content 2").tabItem {
                VStack {
                    Image(systemName: "house")
                    Text("Home")
                }
            }.tag(1)
            Text("Tab Content 2").tabItem {
                VStack {
                    Image(systemName: "house")
                    Text("Home")
                }
            }.tag(2)
            
            Text("Tab Content 2").tabItem {
                VStack {
                    Image(systemName: "house")
                    Text("Home")
                }
            }.tag(3)
            Text("Tab Content 2").tabItem {
                VStack {
                    Image(systemName: "house")
                    Text("Home")
                }
            }.tag(4)
        }
    }
    
    var firstTab: some View {
        ScrollView {
            VStack {
                HStack {
                    Image("Product1")
                    VStack(alignment: .leading) {
                        Text("Some name")
                            .font(.title)
                        Text("Some Description")
                            .font(.subheadline)
                        Spacer()
                        Text("99,99 p")
                            .font(.title3)
                            .foregroundStyle(.red)
                    }
                    .padding(.vertical)
                    Spacer()
                }
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.horizontal)
                
                HStack {
                    Image("Product1")
                    VStack(alignment: .leading) {
                        Text("Some name")
                            .font(.title)
                        Text("Some Description")
                            .font(.subheadline)
                        Spacer()
                        Text("99,99 p")
                            .font(.title3)
                            .foregroundStyle(.red)
                    }
                    .padding(.vertical)
                    Spacer()
                }
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.horizontal)
            }
            .padding(.top)
            .padding(.bottom, 30)
            .background(Color("SearchGray"))
            .padding(.top, -50)
            
            VStack(alignment: .leading) {
                HStack {
                    ForEach(goodsTypes, id: \.self) { type in
                        Button(action: {
                            
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundStyle(.white)
                                    .shadow(radius: 3)
                                Text(type)
                                    .padding(2)
                            }
                            .padding(.horizontal,3)
                        })
                    }
                }
                .padding()
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(goods, id: \.self) { good in
                            ZStack {
                                Image("Product1")
                                VStack {
                                    HStack {
                                        Spacer()
                                        Image("heart")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 20, height: 20)
                                    }
                                    Spacer()
                                    HStack {
                                        Text("99,99 p")
                                        Spacer()
                                        Circle()
                                            .foregroundStyle(.green)
                                            .frame(width: 30, height: 30)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        .padding(.bottom)
                    }
                }
                
                HStack {
                    Text("Brands")
                        .font(.headline)
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Text("Look all")
                            .fontWeight(.bold)
                    })
                }
                .padding(.top)
                .padding(.horizontal)
                
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundStyle(.white)
                            .shadow(radius: 3)
                        Text("Brand 1")
                            .padding(.vertical,30)
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundStyle(.white)
                            .shadow(radius: 3)
                        Text("Brand 2")
                            .padding(.vertical, 30)
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundStyle(.white)
                            .shadow(radius: 3)
                        Text("Brand 3")
                            .padding(.vertical, 30)
                    }
                }
                .padding(.horizontal)
                
                HStack {
                    Text("Already looked")
                        .font(.headline)
                    Spacer()
                }
                .padding(.top)
                .padding(.horizontal)
                
                VStack {
                    HStack {
                        Image("Product1")
                        VStack(alignment: .leading) {
                            Text("Some name")
                                .font(.title)
                            Text("Some Description")
                                .font(.subheadline)
                            Spacer()
                            Text("99,99 p")
                                .font(.title3)
                                .foregroundStyle(.red)
                        }
                        .padding(.vertical)
                        Spacer()
                    }
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.horizontal)
                    
                    HStack {
                        Image("Product1")
                        VStack(alignment: .leading) {
                            Text("Some name")
                                .font(.title)
                            Text("Some Description")
                                .font(.subheadline)
                            Spacer()
                            Text("99,99 p")
                                .font(.title3)
                                .foregroundStyle(.red)
                        }
                        .padding(.vertical)
                        Spacer()
                    }
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.horizontal)
                }
                .padding(.top)
                .padding(.bottom, 30)
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                HStack {
                    Image("heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                    TextField("Search at Vodovoz", text: $searchQuery)
                    Spacer()
                    Button(action: {
                        // action
                    }, label: {
                        Image("receipt")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                    })
                    .frame(width: 20, height: 20)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Color("SearchGray"))
                .clipShape(RoundedRectangle(cornerRadius: 5))
            }
        })
    }
}

#Preview {
    NavigationStack {
        VodovozView()
    }
}
