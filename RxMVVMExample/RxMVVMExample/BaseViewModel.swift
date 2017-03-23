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
  
  private let propertyChanged: PublishSubject<T>
  public var PropertyChanged: PublishSubject<T> {
    get {
      return propertyChanged
    }
  }
  
  private let dispose: DisposeBag
  public var Dispose: DisposeBag {
    get {
      return dispose
    }
  }
  
  init() {
    propertyChanged = PublishSubject<T>()
    dispose = DisposeBag()
  }
}
