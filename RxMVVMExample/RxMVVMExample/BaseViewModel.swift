//
//  BaseViewModel.swift
//  RxMVVMExample
//
//  Created by Byung Kook Hwang on 2017. 3. 23..
//  Copyright © 2017년 Byung Kook Hwang. All rights reserved.
//

import Foundation
import RxSwift

protocol DataBindingProtocol {
  associatedtype V
  
  func raisePropertyChanged(_: V)
}

class BaseViewModel<T>: DataBindingProtocol {
  
  typealias V = T

  // MARK: Properties

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
  
  // MARK: Initializing
  
  init() {
    propertyChanged = PublishSubject<T>()
    dispose = DisposeBag()
  }
  
  // MARK: Method
  
  func raisePropertyChanged(_ property: T) {
    propertyChanged.onNext(property)
  }
}
