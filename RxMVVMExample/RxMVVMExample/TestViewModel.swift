//
//  TestViewModel.swift
//  RxMVVMExample
//
//  Created by Byung Kook Hwang on 2017. 3. 22..
//  Copyright © 2017년 Byung Kook Hwang. All rights reserved.
//

import Foundation

enum TestBindingType {
  case testDescriptionBinding
}

final class TestViewModel: BaseViewModel<TestBindingType> {
  
  var testDescription: String = "" {
    didSet {
      PropertyChanged.onNext(.testDescriptionBinding)
    }
  }
}

