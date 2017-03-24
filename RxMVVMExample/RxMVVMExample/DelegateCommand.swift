//
//  DelegateCommand.swift
//  RxMVVMExample
//
//  Created by Byung Kook Hwang on 2017. 3. 24..
//  Copyright © 2017년 Byung Kook Hwang. All rights reserved.
//

import Foundation

final class DelegateCommand<T> {
  
  // MARK: Properties
  
  private let executeAction: (T?) -> Void
  private let canExecuteAction: (T?) -> Bool
  
  // MARK: Initializing
  
  init(executeParam: @escaping (T?) -> Void) {
    self.executeAction = executeParam
    self.canExecuteAction = { (T) in true }
  }
  
  init(executeParam: @escaping (T?) -> Void, canExecuteParam: @escaping (T?) -> Bool) {
    self.executeAction = executeParam
    self.canExecuteAction = canExecuteParam
  }
  
  // MARK: Method
  
  func execute(param: T? = nil) {
    if self.canExecuteAction(param) {
      self.executeAction(param)
    }
  }
  
  func canExecute(param: T? = nil) -> Bool {
    return self.canExecuteAction(param)
  }
}
