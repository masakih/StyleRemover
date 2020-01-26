//
//  ActionPublisher.swift
//  StyleRemover
//
//  Created by Hori,Masaki on 2020/01/19.
//  Copyright © 2020 Hori,Masaki. All rights reserved.
//

import Cocoa
import Combine

public protocol ActionPerfomer: AnyObject {
    
    var target: AnyObject?  { get set }
    var action: Selector? { get set }
}

extension NSControl: ActionPerfomer {}
extension NSMenuItem: ActionPerfomer {}

public struct ActioinSubscription: Subscription {
    
    public let combineIdentifier = CombineIdentifier()
    let actionReceiver: ActionReceiver
    
    public func request(_ demand: Subscribers.Demand) {}
    
    public func cancel() {
        
        actionReceiver.handler = nil
    }
}

internal final class ActionReceiver: NSObject {
    
    private(set) weak var actionPerfomer: ActionPerfomer!
    var handler: ((ActionPerfomer) -> Void)?
    
    init(actionPerfomer: ActionPerfomer) {
        
        self.actionPerfomer = actionPerfomer
        
        super.init()
        
        actionPerfomer.target = self
        actionPerfomer.action = #selector(action)
    }
    
    @IBAction private func action(_ sender: Any) {
        
        handler?(actionPerfomer)
    }
}

public struct ActionPublisher: Publisher {
    
    public typealias Output = ActionPerfomer
    public typealias Failure = Never
    
    private let actionReceiver: ActionReceiver
    
    init(actionPerfomer: Output) {
        
        self.actionReceiver = .init(actionPerfomer: actionPerfomer)
    }
    
    public func receive<S>(subscriber: S)
        where S : Subscriber, Failure == S.Failure, Output == S.Input {
            
            actionReceiver.handler = { control in _ = subscriber.receive(control) }
            
            subscriber.receive(subscription: ActioinSubscription(actionReceiver: actionReceiver))
    }
}

extension ActionPerfomer {
    
    func actionPublisher() -> ActionPublisher {
        
        .init(actionPerfomer: self)
    }
}
