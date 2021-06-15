/**
#  Box.swift
   AbstractTimer
 
 ## Overview
 Boxing mechanism to be used for bindings between the ViewModel and the ViewController
*/

import Foundation

final class Box<T>
{
    typealias Listener = (T) -> Void
    var listener: Listener?
  
    var value: T
    {
        didSet
        {
            listener?(value)
        }
    }
    
    init(_ value: T)
    {
        self.value = value
    }
    
    /**
     Binding a box to a listener that will be called each time
     the box is updated.
     - Parameter listener: the listener function
     - Returns: NA
     */
    func bind(listener: Listener?)
    {
        self.listener = listener
        listener?(value)
    }
}
