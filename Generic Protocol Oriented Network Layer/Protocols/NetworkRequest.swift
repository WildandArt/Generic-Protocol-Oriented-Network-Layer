//
//  NetworkRequestProtocol.swift
//  Generic Protocol Oriented Network Layer
//
//  Created by Artemy Ozerski on 09/06/2022.
//

import UIKit
//Objectives:
//1. method to decode into a model type
//2. method to start asynchronous data transfer from the url
//3. closure to pass the decoded data back to the caller
protocol NetworkRequest : AnyObject{
associatedtype ModelType
    func decode(_ data : Data) -> ModelType?
    func execute(withCompletion completion: @escaping (ModelType?) -> Void)
}
extension NetworkRequest{
     func load(_ url: URL, withCompletion completion: @escaping (ModelType?) -> Void){
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, _, _) -> Void in
            guard let data = data,
                  let value = self?.decode(data) else{
                      DispatchQueue.main.async {
                          completion(nil)
                      }
                      return
                  }
            DispatchQueue.main.async {
                completion(value)
            }
        }
        task.resume()
    }
}
