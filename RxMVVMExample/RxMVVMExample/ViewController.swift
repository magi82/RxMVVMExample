//
//  ViewController.swift
//  RxMVVMExample
//
//  Created by Byung Kook Hwang on 2017. 3. 22..
//  Copyright © 2017년 Byung Kook Hwang. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa
import Toaster
import Then

final class ViewController: UIViewController {
  
  // MARK: Properties
  
  let viewModel: ToastViewModel = ToastViewModel()
  
  // MARK: UI Components
  
  @IBOutlet weak var toastLabel: UILabel!
  @IBOutlet weak var toastTextField: UITextField!
  @IBOutlet weak var toastButton: UIButton!
  
  // MARK: Method
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    loadViewModel()
  }
  
  func loadViewModel() {
    setCommand()
    setBinding()
  }
  
  func setCommand() {
    if let command = viewModel.ToastCommand {
      // can you execute this command?
      command.CanExecuteActionChanged
        .subscribe(onNext: { (_) in
          if command.canExecute() {
            self.toastButton.isEnabled = true
          }
          else {
            self.toastButton.isEnabled = false
          }
        })
        .addDisposableTo(viewModel.Dispose)
      
      // command execute
      toastButton.rx.tap
        .subscribe(onNext: {
          command.execute()
        })
        .addDisposableTo(viewModel.Dispose)
    }
    
    // delegate
    viewModel.ToastDelegate
      .subscribe(onNext: {
        Toast(text: self.viewModel.toastDescription, delay: 0, duration: 5).show()
        self.toastTextField.text = ""
      })
      .addDisposableTo(viewModel.Dispose)
  }
    
  func setBinding() {
    // view -> viewmodel
    toastTextField.rx.text
      .subscribe(onNext: { value in
        if value != nil {
          self.viewModel.toastDescription = value!
        }
      })
      .addDisposableTo(viewModel.Dispose)
    
    // viewmodel -> view
    viewModel.PropertyChanged
      .subscribe(onNext: { (type) in
        switch type {
        case ToastBindingType.description(let value):
          self.toastLabel.text = value
          break
        }
      })
      .addDisposableTo(viewModel.Dispose)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

