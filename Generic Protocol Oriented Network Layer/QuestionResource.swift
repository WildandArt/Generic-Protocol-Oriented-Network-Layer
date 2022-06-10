//
//  QuestionResource.swift
//  Generic Protocol Oriented Network Layer
//
//  Created by Artemy Ozerski on 09/06/2022.
//

import Foundation
struct QuestionResource : APIResource{
    typealias ModelType =  Question
    
    var filter: String?{
        id != nil ? "xxx" : nil
    }
    var id : Int?

    var methodPath: String{
        guard let id = id else{
            return "/questions"
        }
        return "/questions/\(id)"
    }

}
