//
//  RequestListView.swift
//  DemoSign
//
//  Created by Brandon Alexis Martinez Cortes on 28/09/22.
//

import SwiftUI


struct RequestListView: View{
    
    
    @State var showMenu = false
    
    var body: some View {
        
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -200 {
                    withAnimation {
                        self.showMenu = false
                    }
                }
            }
        
        return NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    MainView(showMenu: self.$showMenu)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                        .disabled(self.showMenu ? true : false)
                    if self.showMenu {
                        MenuView()
                            .frame(width: geometry.size.width/1.3)
                            .transition(.move(edge: .leading))
                            
                    }
                }
                    .gesture(drag)
            }
                .navigationBarTitle("", displayMode: .inline)
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing){
                        
                        Button(action: {
                              
                        }) {
                             Image("LogoSign")
                                //.fixedSize()
                                .imageScale(.medium)
                                .padding()
                         }
                    }
                    
                })
                .navigationBarItems(leading: (
                    Button(action: {
                        withAnimation {
                            self.showMenu.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                            .foregroundColor(.black)
                    }
                    
                    
                ))
        }
    }
    
}



struct MainView: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        Text("Bandeja: Expedientes por atender")
            .font(Font.custom("Montserrat-Bold", size: 15))
    }
}


struct RequestListView_Previews: PreviewProvider {
    static var previews: some View{
        RequestListView()
    }
    
}
