//
//  Tabs.swift
//  DemoSign
//
//  Created by Brandon Alexis Martinez Cortes on 04/10/22.
//

import SwiftUI

struct Tab {
    //var icon: Image?
    var title: String
}
struct Tabs: View {
    var fixed = true
    var tabs: [Tab]
    var geoWidth: CGFloat
    @Binding var selectedTab: Int
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { proxy in
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        ForEach(0 ..< tabs.count, id: \.self) { row in
                            Button(action: {
                                withAnimation {
                                    selectedTab = row
                                }
                            }, label: {
                                VStack(spacing: 0) {
                                    HStack {
                                        // Image
                                        /*AnyView(tabs[row].icon)
                                            .foregroundColor(.white)
                                            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))*/
                                        // Text
                                        Text(tabs[row].title)
                                            .font(Font.system(size: 10, weight: .semibold))
                                            .foregroundColor(Color.gray)
                                            .padding(EdgeInsets(top: 10, leading: 3, bottom: 10, trailing: 15))
                                    }
                                    .frame(width: fixed ? (geoWidth / CGFloat(tabs.count)) : .none, height: 42)
                                    //.overlay()
                                    .background( Rectangle().fill(selectedTab == row ? Color.red : Color.clear)
                                        .frame(height: .none))
                                    // Bar Indicators
                                   
                                }.fixedSize()
                            })
                                .accentColor(Color.white)
                                .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .onChange(of: selectedTab) { target in
                        withAnimation {
                            proxy.scrollTo(target)
                        }
                    }
                }
            }
        }
        .frame(height: 35)
        .onAppear(perform: {
            UIScrollView.appearance().backgroundColor = .white
            UIScrollView.appearance().bounces = fixed ? false : true
        })
        .onDisappear(perform: {
            UIScrollView.appearance().bounces = true
        })
    }
}
struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs(fixed: true,
             tabs: [.init(title: "Información"),
                    .init(title: "Documentos por firmar"),
                    .init(title: "Flujo expediente")],
             geoWidth: 410,
             selectedTab: .constant(0))
    }
}
