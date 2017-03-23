//
//  ViewController.swift
//  RxMVVMExample
//
//  Created by Byung Kook Hwang on 2017. 3. 22..
//  Copyright © 2017년 Byung Kook Hwang. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
  
  let viewModel: TestViewModel = TestViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    viewModel.propertyChanged
    .subscribe(onNext: { (bindName) in
      switch bindName {
        case .testDescription:
          print(self.viewModel.testDescription)
        break
      }
    })
    .addDisposableTo(viewModel.disposeBag)
    
    viewModel.testDescription = "test"
}

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

