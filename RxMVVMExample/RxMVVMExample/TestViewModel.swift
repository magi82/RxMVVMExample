//
//  TestViewModel.swift
//  RxMVVMExample
//
//  Created by Byung Kook Hwang on 2017. 3. 22..
//  Copyright © 2017년 Byung Kook Hwang. All rights reserved.
//

import Foundation
import RxSwift

protocol DataBindingProtocol {
  var propertyChanged: PublishSubject<String> { get set }
}

// init 구현해야함
struct TestViewModel: DataBindingProtocol {
  var propertyChanged: PublishSubject<String> = PublishSubject<String>()
  
  private var testDescription: String?
  var TestDescription: String {
    get {
      guard let value = testDescription else  { return "" }
      return value
    }
    set(value) {
      testDescription = value
      
      propertyChanged.onNext(value)
    }
  }
}
