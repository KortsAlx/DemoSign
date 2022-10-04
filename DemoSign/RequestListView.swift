//
//  RequestListView.swift
//  DemoSign
//
//  Created by Brandon Alexis Martinez Cortes on 28/09/22.
//

import SwiftUI
import DSCloudPIN


struct RequestListView: View{
    @EnvironmentObject var authentication: Authentication

    
    @State var showMenu = false
    
    @State var viewOtp = false
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
                 
                    if self.viewOtp{
                        DSCloudPIN()
                        
                        
                    }else{
                        MainView(showMenu: self.$showMenu, viewOtp: self.$viewOtp)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                            .disabled(self.showMenu ? true : false)
                        
                    }
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
class initRequest: ObservableObject{
    @StateObject var loginVM = LoginViewModel()

    init(loginVM: LoginViewModel = LoginViewModel()) {
        //self.loginVM = loginVM
        loginVM.getAllRequests()
    }
    

}


struct MainView: View {
    @State var expediente: String = ""
    
    @StateObject var loginVM = LoginViewModel()

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
    @Binding var viewOtp : Bool
    

    //initRequest(loginVM: loginVM)

    
    var body: some View {

 
        NavigationView{
            
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
                            .frame(height: 40)

                    }.overlay(RoundedRectangle(cornerRadius: 100).stroke(lineWidth: 1).foregroundColor(Color.black))
                        
             
                    
                }.padding(.leading, 15).padding(.trailing, 15)
                
                //List
             
          
                /*Button(action: {
                    self.viewOtp = true
                    
                    
                }){
  

                    
                    
                    
                }.foregroundColor(Color.black)*/
                
                //Spacer()
   
                VStack{
                    //Text("321321 "+loginVM.getAllRq.description)
                    
                    //Spacer()
                    List{
                        ForEach(loginVM.getAllRq, id: \.id){ index in
                           
                            let vModel = RequestListViewModel(model: index)
                            RowRequest(requestVM: vModel)
                         
                           
                            
                        }
                    }
                    
                }
                .frame(height: .infinity)
                .task {
                    
                    loginVM.getAllRequests()
                }
            }
            


            
        }
        //Spacer()
    }
}


struct RequestListView_Previews: PreviewProvider {
    static var previews: some View{
        RequestListView()
    }
    
}
