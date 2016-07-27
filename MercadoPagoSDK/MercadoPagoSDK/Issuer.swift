//
//  Issuer.swift
//  MercadoPagoSDK
//
//  Created by Matias Gualino on 31/12/14.
//  Copyright (c) 2014 com.mercadopago. All rights reserved.
//

import Foundation

public class Issuer : NSObject {
    public var _id : NSNumber?
    public var name : String?
    
    public class func fromJSON(json : NSDictionary) -> Issuer {
        let issuer : Issuer = Issuer()
        if json["id"] != nil && !(json["id"]! is NSNull) {
			if let issuerIdStr = json["id"]! as? NSString {
				issuer._id = NSNumber(longLong: issuerIdStr.longLongValue)
			} else {
				issuer._id = NSNumber(longLong: (json["id"] as? NSNumber)!.longLongValue)
			}
        }
        issuer.name = JSON(json["name"]!).asString
        return issuer
    }
    
    public func toJSONString() -> String {
        let obj:[String:AnyObject] = [
            "id": self._id != nil ? JSON.null : self._id!,
            "name" : self.name == nil ? JSON.null : self.name!,
            ]
        return JSON(obj).toString()
    }
}

public func ==(obj1: Issuer, obj2: Issuer) -> Bool {
    
    let areEqual =
        obj1._id == obj2._id &&
        obj1.name == obj2.name
    
    return areEqual
}