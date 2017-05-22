//
//  ViewController.swift
//  ReactiveReSwift-ReactiveSwiftExample
//
//  Created by Charlotte Tortorella on 2/12/16.
//  Copyright © 2016 ReSwift. All rights reserved.
//

import UIKit
import ReactiveReSwift
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var counterLabel: UILabel!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainStore.observable.asObservable().subscribe { [weak self] appState in
            self?.counterLabel.text = String(appState.counter)
        }?.disposed(by: disposeBag)
    }
    
    // when either button is tapped, an action is dispatched to the store
    // in order to update the application state
    @IBAction func downTouch(_ sender: AnyObject) {
        // This is just to demonstrate that you can dispatch promises directly,
        // don't actually do this, this is bad code
        mainStore.dispatch(Variable<AppAction>(.decrease))
    }
    
    @IBAction func upTouch(_ sender: AnyObject) {
        // This is just to demonstrate that you can dispatch promises directly,
        // don't actually do this, this is bad code
        mainStore.dispatch(Variable<AppAction>(.increase))
    }
}
