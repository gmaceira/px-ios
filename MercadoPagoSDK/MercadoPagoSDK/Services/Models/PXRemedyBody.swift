//
//  PXRemedyBody.swift
//  MercadoPagoSDK
//
//  Created by Eric Ertl on 16/03/2020.
//

import Foundation

struct PXRemedyBody: Codable {
    let payerPaymentMethodRejected: PXPayerPaymentMethodRejected?
    let alternativePayerPaymentMethods: [PXRemedyPaymentMethod]?
}

struct PXPayerPaymentMethodRejected: Codable {
    let customOptionId: String?
    let paymentMethodId: String?
    let paymentTypeId: String?
    let issuerName: String?
    let lastFourDigit: String?
    let securityCodeLocation: String?
    let securityCodeLength: Int?
    let totalAmount: Double?
    let installments: Int?
    let escStatus: String?
}
