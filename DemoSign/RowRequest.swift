//
//  RowRequest.swift
//  DemoSign
//
//  Created by Brandon Alexis Martinez Cortes on 04/10/22.
//

import SwiftUI

struct RowRequest : View {
    let requestVM : RequestListViewModel
    
    var body: some View{
        VStack{
            VStack{
                HStack{
                    Spacer()
                    Text("Folio: "+requestVM.folio)
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
        
        
        

        
    }
    
}


struct RowRequest_Previews: PreviewProvider{
    static var previews: some View{
        RowRequest(requestVM: RequestListViewModel(model: AllRequestOutput.example)).previewLayout(.device)
        
        
    }
    
}

