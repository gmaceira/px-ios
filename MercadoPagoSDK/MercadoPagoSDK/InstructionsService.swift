//
//  InstructionsService.swift
//  MercadoPagoSDK
//
//  Created by Maria cristina rodriguez on 16/2/16.
//  Copyright © 2016 MercadoPago. All rights reserved.
//

import UIKit

public class InstructionsService: MercadoPagoService {

    public let MP_INSTRUCTIONS_URI = "/beta/checkout/payments/${payment_id}/results"
    
    public init(){
        super.init(baseURL: "http://c4560ed8.ngrok.io/")
    }
    
    public func getInstructions(paymentId : Int, paymentTypeId: String? = "", success : (instructionsInfo : InstructionsInfo) -> Void, failure: ((error: NSError) -> Void)?){
        var params =  "public_key=" + MercadoPagoContext.publicKey()
        if paymentTypeId != nil && paymentTypeId?.characters.count > 0 {
            params = params + "&payment_type=" + paymentTypeId!
        }
        self.request(MP_INSTRUCTIONS_URI.stringByReplacingOccurrencesOfString("${payment_id}", withString: String(paymentId)), params: params, body: nil, method: "GET", cache: false, success: { (jsonResult) -> Void in
            let error = jsonResult?["error"]
            if error != nil {
                let e : NSError = NSError(domain: "com.mercadopago.sdk.getInstructions", code: MercadoPago.ERROR_INSTRUCTIONS, userInfo: [NSLocalizedDescriptionKey : "No se ha podrido obtener las intrucciones correspondientes al pago".localized, NSLocalizedFailureReasonErrorKey : jsonResult!["error"] as! String])
                failure!(error: e)
            } else {
                success(instructionsInfo : InstructionsInfo.fromJSON(jsonResult as! NSDictionary))
            }
        }, failure: failure)
    }
}
