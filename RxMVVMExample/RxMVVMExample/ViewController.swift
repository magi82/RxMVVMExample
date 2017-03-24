//
//  ViewController.swift
//  RxMVVMExample
//
//  Created by Byung Kook Hwang on 2017. 3. 22..
//  Copyright © 2017년 Byung Kook Hwang. All rights reserved.
//

import UIKit
import RxSwift

final class ViewController: UIViewController {
  
  let viewModel: TestViewModel = TestViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    viewModel.PropertyChanged
    .subscribe(onNext: { (bindName) in
      switch bindName {
        case .testDescriptionBinding:
          print(self.viewModel.testDescription)
        break
      }
    })
    .addDisposableTo(viewModel.Dispose)
    
    viewModel.testDescription = "test"
    
    if let value = viewModel.SubmitCommand?.canExecute(param: nil) {
      print(value)
    }
    
    if let value = viewModel.SubmitCommand {
      value.execute(param: "true")
    }
}

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

