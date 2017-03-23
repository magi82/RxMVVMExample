//
//  TestViewModel.swift
//  RxMVVMExample
//
//  Created by Byung Kook Hwang on 2017. 3. 22..
//  Copyright © 2017년 Byung Kook Hwang. All rights reserved.
//

import Foundation

enum TestViewModelType {
  case testDescription
}

final class TestViewModel: BaseViewModel<TestViewModelType> {
  
  var testDescription: String = "" {
    didSet {
      propertyChanged.onNext(.testDescription)
    }
  }
}

