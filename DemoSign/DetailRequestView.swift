//
//  DetailRequestView.swift
//  DemoSign
//
//  Created by Brandon Alexis Martinez Cortes on 28/09/22.
//

import Foundation
import SwiftUI


struct DetailRequestView : View{
    var body: some View{
        NavigationView{
            VStack(alignment: .leading, spacing: 20){
                HStack(alignment: .center,spacing: 5.0){
                    VStack(alignment: .leading, spacing: 10){
                        Text("Folio: 00000122517 - Prueba 000")
                            .font(Font.custom("Montserrat-Bold", size: 15))
                        
                        Text("Estatus: Firma de documentos")
                            .font(Font.custom("Montserrat-Regular", size: 13))
                    }
                    
                    
                    Spacer()
                    
                }
                .padding(20)
                
                
                
            }
            
        }
        
    }
}


struct DetailRequestView_Preview: PreviewProvider{
    static var previews: some View{
        DetailRequestView()
    }
    
}
