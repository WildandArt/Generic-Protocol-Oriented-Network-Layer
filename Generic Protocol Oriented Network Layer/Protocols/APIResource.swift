//
//  APIResourceProtocol.swift
//  Generic Protocol Oriented Network Layer
//
//  Created by Artemy Ozerski on 09/06/2022.
//

import Foundation
protocol APIResource {
    associatedtype ModelType : Decodable
    var methodPath : String { get }
    var filter: String? { get }
}
extension APIResource{
    var url : URL{
        var components = URLComponents(string: "website address")!
        components.path = methodPath
        components.queryItems = [
            URLQueryItem(name: "site", value: "stackoerflow"),
            URLQueryItem(name: "order", value: "desc")
        ]
        return (components.url)!
    }
}
