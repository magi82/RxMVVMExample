//
//  ToastViewModel.swift
//  RxMVVMExample
//
//  Created by Byung Kook Hwang on 2017. 3. 22..
//  Copyright © 2017년 Byung Kook Hwang. All rights reserved.
//

import Foundation
import RxSwift

enum ToastBindingType {
  case description(String)
}

final class ToastViewModel: BaseViewModel<ToastBindingType> {
  
  // MARK: Properties
  
  private var toastCommand: DelegateCommand<Void>?
  public var ToastCommand: DelegateCommand<Void>? {
    get {
      return toastCommand
    }
  }
  
  private let toastDelegate: PublishSubject<Void> = PublishSubject<Void>()
  public var ToastDelegate: PublishSubject<Void> {
    get {
      return toastDelegate
    }
  }
  
  // MARK: Initializing
  
  override init() {
    super.init()
    
    toastCommand = DelegateCommand<Void>(executeParam: executeToast, canExecuteParam: canExecuteToast)
  }
  
  // MARK: Data Binding
  
  var toastDescription: String = "" {
    didSet {
      raisePropertyChanged(ToastBindingType.description(toastDescription))
      
      if let command = toastCommand {
        command.raiseCanExecuteChanged()
      }
    }
  }
  
  // MARK: Command
  
  private func executeToast(_: Void?) {
    toastDelegate.onNext()
    toastDescription = ""
  }
  
  private func canExecuteToast(_: Void?) -> Bool {
    guard toastDescription.characters.count > 4 else { return false }
    
    return true
  }
}

