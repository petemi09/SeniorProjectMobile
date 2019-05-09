//
//  networking.swift
//  tester2
//
//  Created by Mitchell Petellin on 3/9/19.
//  Copyright © 2019 Mitchell Petellin. All rights reserved.
//

import Foundation
import Alamofire

class networking {
    
    typealias WebServiceResponse = ([[String: Any]]?, Error?) -> Void
    func execute1(_ url: URL, completion: @escaping WebServiceResponse) {
        
        Alamofire.request(url).validate().responseJSON {response in
            if let error = response.error {
                completion(nil, error)
            } else if let jsonArray = response.result.value as? [[String: Any]] {
                completion(jsonArray, nil)
            } else if let jsonDict = response.result.value as? [String: Any] {
                completion([jsonDict], nil)
            }
        }
    }
}
