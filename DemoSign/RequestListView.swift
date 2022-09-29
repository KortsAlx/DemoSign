//
//  RequestListView.swift
//  DemoSign
//
//  Created by Brandon Alexis Martinez Cortes on 28/09/22.
//

import SwiftUI


struct RequestListView: View{
    @EnvironmentObject var authentication: Authentication

    
    @State var showMenu = false
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
                                .resizable()
                                .frame(width: 85, height: 25)
                                .padding(8)
                                
                            
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
        .preferredColorScheme(.light)
        
    }
    
}



struct MainView: View {
    @State var expediente: String = ""

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
    
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            HStack(alignment: .center,spacing: 5.0){
                VStack(alignment: .leading, spacing: 10){
                    Text("Bandeja: Expedientes por atender")
                        .font(Font.custom("Montserrat-Bold", size: 15))
                    
                    Text("Expedientes que tienes asignados para un proceso de revisión o firma.")
                        .font(Font.custom("Montserrat-Regular", size: 13))
                }
             
                
                Spacer()
                
            }
            .padding(20)
            VStack{
                HStack{
                    Image("searchicontext").padding(.leading, 25)
                    TextField("Ingresa el nombre o folio del expediente", text: $expediente)
                        .padding(.leading,5)
                        .foregroundColor(Color.black)
                        .font(Font.custom("Montserrat-Regular", size: 11))
                        .frame(width: .infinity, height: 40)

                }.overlay(RoundedRectangle(cornerRadius: 100).stroke(lineWidth: 1).foregroundColor(Color.black))
                    
         
                
            }.padding(.leading, 15).padding(.trailing, 15)
            
  

            Button(action: {
                
                
            }){
                VStack{
                    VStack{
                        HStack{
                            Spacer()
                            Text("Folio: 122847")
                                .frame(width: .infinity, height: 60)
                                .font(Font.custom("Montserrat-SemiBold", size: 18))
                            Spacer()
                        }
                        
                        
                        
                    }
                    .background(Color(red: 0.427, green: 0.714, blue: 0.145, opacity: 0.239))
                    .cornerRadius(10)
                    
        
                  
                    VStack(alignment: .leading){
                        VStack{
                            
                            HStack(alignment: .top){
                                //Spacer()
                                Text("Nombre del expediente ")
                                    .font(Font.custom("Montserrat-SemiBold", size: 12))
                                
                                
                          
                                HStack{
                                    Spacer()
                                    Text("Alta proveedor 19092022")
                                        .font(Font.custom("Montserrat-Regular", size: 12))
                                }
                                Spacer()
                                
                            } .frame(width: .infinity, height: 20)
                            
                            
                        }
                        
                        Divider()
                        VStack{
                            
                            HStack(alignment: .top){
                                //Spacer()
                                Text("Nombre del solicitante ")
                                    .font(Font.custom("Montserrat-SemiBold", size: 12))
                                
                                
                         
                                HStack{
                                    Spacer()
                                    Text("Johana Juárez Juárez")
                                        .font(Font.custom("Montserrat-Regular", size: 12))
                                }
                                Spacer()
                                
                            } .frame(width: .infinity, height: 20)
                            
                            
                        }
                        Divider()
                        VStack{
                            
                            HStack(alignment: .top){
                                //Spacer()
                                Text("Fecha de creación")
                                    .font(Font.custom("Montserrat-SemiBold", size: 12))
                                    
                                
                                
                              
                                HStack{
                                    Spacer()
                                    Text("2022-09-19 05:13:30 pm")
                                        .font(Font.custom("Montserrat-Regular", size: 12))
                                }
                                Spacer()
                                
                            } .frame(width: .infinity, height: 20)
                            
                            
                        }
                        Divider()
                        VStack{
                            
                            HStack(alignment: .top){
                                //Spacer()
                                Text("Fecha límite ")
                                    .font(Font.custom("Montserrat-SemiBold", size: 12))
                                
                                
                                
                                HStack{
                                    Spacer()
                                    Text("2022-09-20")
                                        .font(Font.custom("Montserrat-Regular", size: 12))
                                        .padding(.leading, 50)
                                }
                         
                                Spacer()
                                
                            } .frame(width: .infinity, height: 20)
                            
                            
                        }
                        Divider()
                        VStack{
                            
                            HStack(alignment: .top){
                                //Spacer()
                                Text("Estaus ")
                                    .font(Font.custom("Montserrat-SemiBold", size: 12))
                                
                                
                                Spacer()
                                HStack(alignment: .bottom){
                                    Spacer()
                                    Circle()
                                        .foregroundColor(Color.green)
                                        .frame(width: 10, height: 10)
                                        .padding(.top, 2)
                                    Text("Nuevo documento")
                                        .font(Font.custom("Montserrat-Regular", size: 12))
                                    
                                }
                            
                                Spacer()
                                
                            } .frame(width: .infinity, height: 20)
                            
                            
                        }
                        
                        
                    }.padding(15)
                    
                    
                        
                    
                    
                  
                }.overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).foregroundColor(Color(red: 0.851, green: 0.851, blue: 0.851))).padding(.leading, 15).padding(.trailing, 15)
                
                    
     
            }.foregroundColor(.black)
            
            
            Spacer()
            
        }

        
        
        //Spacer()
    }
}


struct RequestListView_Previews: PreviewProvider {
    static var previews: some View{
        RequestListView()
    }
    
}
