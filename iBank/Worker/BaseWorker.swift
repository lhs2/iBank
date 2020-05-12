//
//  BaseWorker.swift
//  iBank
//
//  Created by Henrique on 11/05/20.
//  Copyright © 2020 Henrique. All rights reserved.
//

import Alamofire

class BaseWorker {
    @discardableResult
    func createRequest<T:Decodable>(route: API, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (AFResult<T>)->Void) -> DataRequest {
        return AF.request(route)
             .responseDecodable (decoder: decoder){ (response: AFDataResponse<T>) in
                 completion(response.result)
         }
    }
    
}
