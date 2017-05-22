//
//  AppDelegate.swift
//  ReactiveReSwift-ReactiveSwiftExample
//
//  Created by Charlotte Tortorella on 2/12/16.
//  Copyright © 2016 ReSwift. All rights reserved.
//

import UIKit
import ReactiveReSwift
import RxSwift

let middleware = Middleware<AppState>().sideEffect { _, _, action in
    print("Received action:")
}.sideEffect { _, _, action in
    print(action)
}


// The global application store, which is responsible for managing the appliction state.
let mainStore = Store(
    reducer: counterReducer,
    observable: Variable(AppState()),
    middleware: middleware
)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
}

