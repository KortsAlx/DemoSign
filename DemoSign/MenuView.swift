//
//  MenuView.swift
//  DemoSign
//
//  Created by Brandon Alexis Martinez Cortes on 28/09/22.
//

import SwiftUI

struct MenuView: View {
    @Environment(\.colorScheme) private var colorScheme
    private var backgroundColor: Color {
       switch colorScheme {
       case .light:
         return .white
       case .dark:
         return .white
       @unknown default:
         return .white
       }
     }

    
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack{
                Text("BR")
                    .frame(width: 75, height: 75, alignment: .center)
                    .padding()
                    .background(.red)
                    .clipShape(Circle())
                    .foregroundColor(.white)
                    .font(Font.custom("Montserrat-SemiBold", size: 35))
                
                Text("Brandon Alexis Martínez Cortes")
                    .font(Font.custom("Montserrat-Bold", size: 15))
                
                Text("Administrador")
                
                    .font(Font.custom("Montserrat-Regular", size: 12))
                
                Divider()
           
            }.padding(.top, 100)
            
            HStack {
                Image("trayicon")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Bandeja")
                    .foregroundColor(.black)
                    .font(Font.custom("Montserrat-Regular", size: 12))
                
            }
            .padding(.top, 100)
            HStack {
                Image("newicon")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Nuevo")
                    .foregroundColor(.black)
                    .font(Font.custom("Montserrat-Regular", size: 12))
                
            }
                .padding(.top, 30)
            HStack {
                Image("searchicon")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Buscar")
                    .foregroundColor(.black)
                    .font(Font.custom("Montserrat-Regular", size: 12))
                
            }
            
            
            .padding(.top, 30)
            Spacer()
            
        }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(backgroundColor)
            .edgesIgnoringSafeArea(.all)
        //Color(red: 32/255, green: 32/255, blue: 32/255)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
