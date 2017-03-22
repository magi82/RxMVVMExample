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

  let dispose: DisposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    var viewModel: TestViewModel = TestViewModel()
    
    viewModel.propertyChanged.map { (value) -> String in
        value + "!!!"
    }
    .subscribe { (event) in
      print(event)
    }
    .addDisposableTo(dispose)
    
    viewModel.TestDescription = "test"
}

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

