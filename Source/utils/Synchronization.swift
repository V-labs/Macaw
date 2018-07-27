//
// Created by Arthur Guillaume on 27/07/2018.
// Copyright (c) 2018 Exyte. All rights reserved.
//

import Foundation

@discardableResult
public func synchronized<T>(_ lock: AnyObject, _ body: () throws -> T) rethrows -> T {
    objc_sync_enter(lock)
    defer { objc_sync_exit(lock) }
    return try body()
}
