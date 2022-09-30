//
//  LoginView.swift
//  DemoSign
//
//  Created by Brandon Alexis Martinez Cortes on 28/09/22.
//

import SwiftUI

struct LoginView: View{
    //@State var username: String = ""
    //@State var password: String = ""

    @EnvironmentObject var authentication: Authentication
    
    @StateObject private var loginVM = LoginViewModel()

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
    var body: some View{
        VStack{
            
 
            LogoView()
            Text("Login").font(Font.custom("Montserrat-Bold", size: 20)).padding()
            VStack(alignment: .leading){
                Text("Usuario").foregroundColor(.black)
                    .font(Font.custom("Montserrat-Regular", size: 15))
                TextField("Usuario", text: $loginVM.username)
                     .padding()
                     .foregroundColor(.black)
                     .font(Font.custom("Montserrat-Regular", size: 16))
                     .background(Color(.gray).opacity(0.2))
                     .cornerRadius(5.0)
                     .padding(.bottom, 20)
            }
   
            VStack(alignment: .leading){
                Text("Contraseña").foregroundColor(.black).font(Font.custom("Montserrat-Regular", size: 15))
                SecureField("Contraseña", text: $loginVM.password)
                    .padding()
                    .font(Font.custom("Montserrat-Regular", size: 18))
                    .foregroundColor(.black)
                    .background(Color(.gray).opacity(0.2))
                    .cornerRadius(5.0)
                    .padding(.bottom, 15)
            }
 
            
            VStack{
                Button(action: {
                    //authentication.updateValidation(success: true)
                    loginVM.login()
                    if loginVM.isAuthenticated {
                        authentication.updateValidation(success: true)
                        
                    }
                    
                }){
                    Text("Iniciar sesión")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(Font.custom("Montserrat-Bold", size: 16))
                        .padding()
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 100)
                            .stroke(Color.white, lineWidth: 2)
                            
                        
                        )
                    
                    
                }
                .background(Color(red: 0.761, green: 0.055, blue: 0.188)) //#c20e30
                .cornerRadius(100)
                .padding(.top, 150)
            }
            

                 
                
            Spacer()
            
        }.padding(40)
        .background(backgroundColor)
        
        
    }
    
    
}


struct LogoView: View{
    var body: some View{
        return Image("LogoSign")
            .resizable()
            .frame(width: 160, height: 58)
            .padding(.top, 70)
            .padding(.bottom, 45)
    }
}


struct LoginView_Previews: PreviewProvider{
    static var previews: some View{
        LoginView()
    }
    
}
