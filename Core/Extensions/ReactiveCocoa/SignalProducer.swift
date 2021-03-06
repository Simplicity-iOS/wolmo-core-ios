//
//  SignalProducer.swift
//  Core
//
//  Created by Francisco Depascuali on 6/29/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import ReactiveCocoa

public extension SignalProducer {
    
    /**
     Transforms a `SignalProducer<Value, Error>` to `SignalProducer<Value, NewError>`
     This is usually pretty useful when the `flatMap` operator is used and the outer
     producer has `NoError` error type and the inner one a different type of error.
     
     - returns: A signal producer with the same value type but with `NewError` as the error type
     */
    func liftError<NewError: ErrorType>() -> SignalProducer<Value, NewError> {
        return flatMapError { _ in SignalProducer<Value, NewError>.empty }
    }
    
}
