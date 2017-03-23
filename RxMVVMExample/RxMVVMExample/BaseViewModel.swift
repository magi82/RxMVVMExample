//
//  BaseViewModel.swift
//  RxMVVMExample
//
//  Created by Byung Kook Hwang on 2017. 3. 23..
//  Copyright © 2017년 Byung Kook Hwang. All rights reserved.
//

import Foundation
import RxSwift

class BaseViewModel<T> {
  
  var propertyChanged: PublishSubject<T> = PublishSubject<T>()
  var disposeBag: DisposeBag = DisposeBag()
  
  init() {
    propertyChanged = PublishSubject<T>()
    disposeBag = DisposeBag()
  }
}
