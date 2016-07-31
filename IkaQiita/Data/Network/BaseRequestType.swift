//
//  DefaultRequestType.swift
//  IkaQiita
//
//  Created by MaedaRyoto on 2016/07/30.
//  Copyright © 2016年 ryoto.maeda. All rights reserved.
//

import Foundation
import APIKit
import Himotoki

protocol BaseRequestType: RequestType {
    var requestTypePath: String { get }
    var baseURLString: String { get }
    var apiVersion: String { get }
}

extension BaseRequestType {
    var baseURLString: String {
        return "https://qiita.com/api"
    }
    var apiVersion: String {
        return "v1"
    }
    var baseURL: NSURL {
        let urlString = "\(self.baseURLString)/\(self.apiVersion)/\(self.requestTypePath)"
        return NSURL(string: urlString)!
    }
}

extension BaseRequestType where Response: Decodable {
    func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) throws -> Response {
        return try decodeValue(object)
    }
}

protocol GETRequestType {}

extension GETRequestType where Self:RequestType {
    var method: HTTPMethod {
        return .GET
    }
}

protocol POSTRequestType {}

extension POSTRequestType where Self:RequestType {
    var method: HTTPMethod {
        return .POST
    }
}

protocol DELETERequestType {}

extension DELETERequestType where Self:RequestType {
    var method: HTTPMethod {
        return .DELETE
    }
}

protocol PUTRequestType {}

extension PUTRequestType where Self:RequestType {
    var method: HTTPMethod {
        return .PUT
    }
}
