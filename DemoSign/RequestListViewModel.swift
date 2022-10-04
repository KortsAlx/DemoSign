//
//  RequestListViewModel.swift
//  DemoSign
//
//  Created by Brandon Alexis Martinez Cortes on 28/09/22.
//

import Foundation

struct RequestListViewModel{
    
    var model : FileCustomDataResponse
   
    var folio : String{
        model.folio ?? ""
    }
    
}
