//
//  POGuessingForm.swift
//  MercadoPagoSDKExamples
//
//  Created by Demian Tejo on 7/26/16.
//  Copyright © 2016 MercadoPago. All rights reserved.
//

import Foundation


import XCTest

class POGuessingForm: MPPageObject {
    
    let continuarButton = application.navigationBars.buttons["Continuar"]
    let anteriorButton = application.navigationBars.buttons["Anterior"]
    let cardNumberField = application.textFields["Número de tarjeta"]
    let cardholderNameField = application.textFields["Nombre y apellido"]
    let expirationDateField = application.textFields["Fecha de expiración"]
    let securityCodeField = application.textFields["Código de seguridad"]
        
    
    
    func pressPromociones() -> POPromos{
        return POPromos()
    }
    
    /* Continuar & Anterior */
    func pressContinue(){
        continuarButton.tap()
    }
    func pressAnterior(){
        anteriorButton.tap()
    }
    
    /* Numero */
    func completeNumero(numero: String){
   //     cardNumberField.tap()
        cardNumberField.typeText(numero)
       
    }
    func clearNumero(){
        completeNumero("")
    }
    func completeNumeroAndContinue(numero: String){
        completeNumero(numero)
        pressContinue()
    }
    
    /* Nombre */
    func completeNombre(nombre: String){
        cardholderNameField.typeText(nombre)
    }
    func clearNombre(){
        completeNombre("")
    }
    func completeNombreAndContinue(nombre: String){
        completeNombre(nombre)
        pressContinue()
    }
    
    /* Fecha */
    func completeFecha(fecha: String){
        expirationDateField.typeText(fecha)
    }
    func clearFecha(){
        completeFecha("")
    }
    func completeFechaAndContinue(fecha: String, cvvRequired: Bool = true) -> POIdentificationForm?{
        completeFecha(fecha)
        pressContinue()
        if (cvvRequired){
            return nil
        }else{
            return POIdentificationForm()
        }
    }
    
    
    /* CVV */
    func completeCVV(cvv: String){
        securityCodeField.typeText(cvv)
    }
    func clearCVV(){
        securityCodeField.typeText("")

    }
    func completeCVVAndContinue(cvv: String) -> POIdentificationForm{
        securityCodeField.typeText(cvv)
        pressContinue()
        return POIdentificationForm()
    }
    
}
