//
//  HPapiRequestWrapper.swift
//  Weatherity
//
//  Created by Harsh on 29/01/2022.
//

import UIKit
import Alamofire


public class NetworkManager {
  
  static var somethingWentWrong = "Something went wrong please try again later"
  static var sharedInstance: NetworkManager = { return NetworkManager() }()

  enum statusCode: Int{
     case success = 200
     case fail = 201
     case noInternet = 500
     case somethingWentWrong = 501
   }
}

class HPapiRequestWrapper: NSObject {

    class func requestGETURL(_ strURL: String, dictHeader: HTTPHeaders?,  success: @escaping (Data?) -> Void, failure:@escaping (Error) -> Void) {
        AF.request(strURL, method: .get, encoding: JSONEncoding.default, headers: dictHeader).responseData { responseData in
            switch responseData.result {
            case .success:
                success(responseData.data)
            case .failure(let error):
                failure(error)
            }
        }
    }


    //Post type methods
    class func requestPOSTURL(_ strURL: String, _ method: HTTPMethod, _ dictParams: [String: String], _ dictHeaders: HTTPHeaders?, success: @escaping (Data?) -> Void, failure: @escaping (Error) -> Void) {

//        debugPrint(strURL)
        
        AF.request(strURL, method: method, parameters: dictParams, encoder: JSONParameterEncoder.default, headers: dictHeaders).responseData { responseData in
            switch responseData.result {
            case .success:
                success(responseData.data)
                break
                
            case .failure(let error):
                failure(error)
            }
        }
    }
}

