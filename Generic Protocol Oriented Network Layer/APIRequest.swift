//
//  APIRequest.swift
//  Generic Protocol Oriented Network Layer
//
//  Created by Artemy Ozerski on 10/06/2022.
//

import Foundation
class APIRequest<Resource: APIResource>{
    let resource: Resource

    init(resource : Resource) {
        self.resource = resource
    }
}
extension APIRequest : NetworkRequest{
    func execute(withCompletion completion: @escaping (Array<Resource.ModelType>?) -> Void) {
        load(resource.url, withCompletion: completion)
    }

    func decode(_ data: Data) -> [Resource.ModelType]? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let wrapper = try? decoder.decode(Wrapper<Resource.ModelType>.self, from: data)
        return wrapper?.items
    }
}
