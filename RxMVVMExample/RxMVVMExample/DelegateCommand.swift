//
//  DelegateCommand.swift
//  RxMVVMExample
//
//  Created by Byung Kook Hwang on 2017. 3. 24..
//  Copyright © 2017년 Byung Kook Hwang. All rights reserved.
//

import Foundation
import RxSwift

protocol CommandProtocol {
  associatedtype V
  
  func execute(_: V?)
  func canExecute(_: V?) -> Bool
  func raiseCanExecuteChanged()
}

final class DelegateCommand<T>: CommandProtocol {

  typealias V = T
  
  // MARK: Properties
  
  private let executeAction: (T?) -> Void
  private let canExecuteAction: (T?) -> Bool
  
  private let canExecuteActionChanged: PublishSubject<Void> = PublishSubject<Void>()
  public var CanExecuteActionChanged: PublishSubject<Void> {
    get {
      return canExecuteActionChanged
    }
  }
  
  // MARK: Initializing
  
  init(executeParam: @escaping (T?) -> Void) {
    self.executeAction = executeParam
    self.canExecuteAction = { (_) in true }
  }
  
  init(executeParam: @escaping (T?) -> Void, canExecuteParam: @escaping (T?) -> Bool) {
    self.executeAction = executeParam
    self.canExecuteAction = canExecuteParam
  }
  
  // MARK: Method
  
  func execute(_ param: T? = nil) {
    if self.canExecuteAction(param) {
      self.executeAction(param)
    }
  }
  
  func canExecute(_ param: T? = nil) -> Bool {
    return self.canExecuteAction(param)
  }
  
  func raiseCanExecuteChanged() {
    canExecuteActionChanged.onNext()
  }
}
