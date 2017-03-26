//
//  TestViewModel.swift
//  RxMVVMExample
//
//  Created by Byung Kook Hwang on 2017. 3. 22..
//  Copyright © 2017년 Byung Kook Hwang. All rights reserved.
//

import Foundation

enum TestBindingType {
  case description(String)
}

final class TestViewModel: BaseViewModel<TestBindingType> {
  
  // MARK: Properties
  
  private var submitCommand: DelegateCommand<String>?
  public var SubmitCommand: DelegateCommand<String>? {
    get {
      return submitCommand
    }
  }
  
  // MARK: Initializing
  
  override init() {
    super.init()
    
    submitCommand = DelegateCommand<String>(executeParam: executeSubmit, canExecuteParam: canExecuteSubmit)
  }
  
  // MARK: Data Binding
  
  var testDescription: String = "" {
    didSet {
      raisePropertyChanged(TestBindingType.description(testDescription))
      
      if let command = submitCommand {
        command.raiseCanExecuteChanged()
      }
    }
  }
  
  // MARK: Command
  
  private func executeSubmit(str: String?) {
    guard let value = str else { return }
    
    print(value)
  }
  
  private func canExecuteSubmit(str: String?) -> Bool {
    guard str != nil else  { return false }
    
    return true
  }
}

