//
//  ReactiveReSwiftBridge.swift
//  ReactiveReSwift-ReactiveSwiftExample
//
//  Created by Charlotte Tortorella on 2/12/16.
//  Copyright © 2016 ReSwift. All rights reserved.
//



import ReactiveReSwift
import RxSwift

//ObservableProperty.ValueType

extension Variable: ObservablePropertyType {
    
    
    
    public typealias ValueType = Element
    public typealias DisposableType = DisposableWrapper
    
    public func subscribe(_ function: @escaping (Element) -> Void) -> DisposableWrapper? {
//        let disposable = self.asObservable().subscribe(function)
        
        
        
//        let disposable = self.asObservable().subscribe(onNext: function)
//        
//        return disposable
        
//        let disposable = self.asObservable().subscribe { (element) in
//            
//        }
//        
//        
//        return disposable
        
        return DisposableWrapper(disposable: asObservable().subscribe(onNext: function))
    }
    
//    public func subscribe(_ function: @escaping (Self.ValueType) -> Swift.Void) -> Self.DisposableType?
    
    

//    public var value: Variable.ValueType {
//        get {
//            
//            return self.value
//        }
//        set (input) {
//            self.value = input
//        }
//    }

}
//extension Disposable: SubscriptionReferenceType {
//}

//
//extension Observable: StreamType {
//    public typealias ValueType = Variable<Element>
//    public typealias DisposableType = Disposable
//    
//    @discardableResult
//    public func subscribe(_ function: @escaping (Variable<Any>) -> Void) -> Disposable? {
//        return Disposable(self.on(value: function).start())
//        return self.subscribe(function)
//    }
//}

extension Observable: StreamType {
    public typealias ValueType = Element
    public typealias DisposableType = DisposableWrapper
    
    public func subscribe(_ function: @escaping (Element) -> Void) -> DisposableWrapper? {
        return DisposableWrapper(disposable: subscribe(onNext: function))
    }
}

public struct DisposableWrapper: SubscriptionReferenceType {
    let disposable: Disposable
    
    public func dispose() {
        disposable.dispose()
    }
    
//    public func dis
    
    public func disposed(by bag: RxSwift.DisposeBag) {
        disposable.disposed(by: bag)
    }
}



/*
//public typealias StoreReducer = (Action, ObservableProperty.ValueType) -> ObservableProperty.ValueType

//typealias ReactiveReducer = (Action, ObservableProperty<Any>.ValueType) -> ObservableProperty<Any>.ValueType
 
 

extension Variable: ObservablePropertyType {
    public typealias ValueType = Variable<Any>
    public typealias DisposableType = CompositeDisposable
    
    @discardableResult
    public func subscribe(_ function: @escaping (Variable<Any>) -> Void) -> CompositeDisposable? {
//        let disposable = self.producer.on(value: function).start()
        let disposable = self.asObservable().subscribe(function)
        return disposable//Disposable(disposable)
    }
    
    public var value: Variable.ValueType {
        get {
            return self.value
        }
        set (input) {
            self.value = input
        }
    }
}

//extension Observable: StreamType {
//    public typealias ValueType = Variable<Any>
//    public typealias DisposableType = Disposable
//    
//    @discardableResult
//    public func subscribe(_ function: @escaping (Variable<Any>) -> Void) -> Disposable? {
//        let disposable = self.observe { event in
//            if case let .value(value) = event {
//                function(value)
//            }
//        }
//        return disposable.map { Disposable($0) }
//    }
//}

extension Observable: StreamType {
    public typealias ValueType = Variable<Any>
    public typealias DisposableType = CompositeDisposable
    
    @discardableResult
    public func subscribe(_ function: @escaping (Variable<Any>) -> Void) -> CompositeDisposable? {
        return Disposable(self.on(value: function).start())
        return self.subscribe(function)
    }
}

extension CompositeDisposable: SubscriptionReferenceType {
}

//public typealias StoreReducer = (Action, ObservableProperty.ValueType) -> ObservableProperty.ValueType
//public typealias Reducer<State> = (Action, State) -> State
*/
