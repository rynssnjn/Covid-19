//
//  Kio
//  Copyright (c) Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import class Foundation.DispatchQueue
import struct Foundation.DispatchWorkItemFlags

public class SynchronizedDictionary<Key: Hashable, Value> {
    /**
     The initializer
     - parameter dict: Dictionary instance to be managed
    */
    public init(dict: [Key: Value]) {
        self.dict = dict
    }

    /**
     The queue that handles the read/writes to the dictionary instance.
    */
    private let _queue: DispatchQueue = DispatchQueue(
        label: "SynchronizedDictionary",
        attributes: DispatchQueue.Attributes.concurrent
    )

    /**
     The dictionary instance.
    */
    private var dict: [Key: Value]

    // MARK: Computed Properties
    /**
     The DispatchQueue instance used by the SynchronizedDictionary instance
    */
    public var queue: DispatchQueue {
        return self._queue
    }
}

// MARK: - Read Properties & Methods
public extension SynchronizedDictionary {
    /**
     Synchronous read of the dictionary's count property.
    */
    var count: Int {
        var count: Int = 0
        self._queue.sync { count = self.dict.count }
        return count
    }
    /**
     Synchronous read of the dictionary's first property.
    */
    var first: (key: Key, value: Value)? {
        var first: (key: Key, value: Value)?
        self._queue.sync { first = self.dict.first }
        return first
    }

    /**
     Synchronous read of the dictionary's isEmpty property.
    */
    var isEmpty: Bool {
        var isEmpty: Bool = true
        self._queue.sync { isEmpty = self.dict.isEmpty }
        return isEmpty
    }

    /**
     Synchronous read of the dictionary's key property.
    */
    var keys: Dictionary<Key, Value>.Keys {
        return self._queue.sync { return self.dict.keys }
    }

    /**
     Synchronous read of the dictionary's underestimatedCount property.
    */
    var underestimatedCount: Int {
        var underestimatedCount: Int = 0
        self._queue.sync { underestimatedCount = self.dict.underestimatedCount }
        return underestimatedCount
    }

    /**
     Synchronous read of the dictionary's values property.
    */
    var values: Dictionary<Key, Value>.Values {
        return self._queue.sync { return self.dict.values }
    }

    /**
     Synchronous read of the dictionary's contains method.
    */
    func contains(where predicate: (Key, Value) throws -> Bool) rethrows -> Bool {
        var contains: Bool = false
        try self._queue.sync {
            do {

                contains = try self.dict.contains(where: predicate)

            } catch let error {

                throw error

            }
        }
        return contains
    }

    /**
     Synchronous read of the dictionary's enumerated method.
    */
    func enumerated() -> EnumeratedSequence<Dictionary<Key, Value>> { // swiftlint:disable:this syntactic_sugar
        return self._queue.sync { return self.dict.enumerated() }
    }

    /**
     Synchronous read of the dictionary's filter method.
    */
    func filter(_ isIncluded: (Key, Value) throws -> Bool) rethrows -> [(key: Key, value: Value)] {
        var filtered: [(key: Key, value: Value)] = []
        try self._queue.sync {
            do {

                filtered = try self.dict.filter(isIncluded)

            } catch let error {

                throw error

            }
        }
        return filtered
    }

    /**
     Synchronous read of the dictionary's first method.
    */
    func first(where predicate: ((key: Key, value: Value)) throws -> Bool) rethrows -> (key: Key, value: Value)? {
        var first: (key: Key, value: Value)?
        try self._queue.sync {
            do {

                first = try self.dict.first(where: predicate)

            } catch let error {

                throw error

            }
        }
        return first
    }

    /**
     Synchronous read of the dictionary's flatMap<ElementOfResult> method.
    */
    func flatMap<ElementOfResult>(_ transform: (Key, Value) throws -> ElementOfResult?) rethrows -> [ElementOfResult] {
        var result: [ElementOfResult] = []
        try self._queue.sync {
            do {

                result = try self.dict.compactMap(transform)

            } catch let error {

                throw error

            }
        }
        return result
    }

    /**
     Synchronous read of the dictionary's flatMap<SegmentOfResult> method.
    */
    func flatMap<SegmentOfResult : Sequence>(_ transform: (Key, Value) throws -> SegmentOfResult) rethrows -> [SegmentOfResult.Iterator.Element] {
        var result: [SegmentOfResult.Iterator.Element] = []
        try self._queue.sync {
            do {

                result = try self.dict.flatMap(transform)

            } catch let error {

                throw error

            }
        }
        return result
    }

    /**
     Synchronous read of the dictionary's forEach method.
    */
    func forEach(_ body: (Key, Value) throws -> Void) rethrows {

        return try self._queue.sync {
            do {

                return try self.dict.forEach(body)

            } catch let error {

                throw error

            }
        }
    }

    /**
     Synchronous read of the dictionary's firstIndex method.
    */
    func firstIndex(where predicate: (Key, Value) throws -> Bool) rethrows -> DictionaryIndex<Key, Value>? {
        var index: DictionaryIndex<Key, Value>?
        try self._queue.sync {
            do {

                index = try self.dict.firstIndex(where: predicate)

            } catch let error {

                throw error

            }
        }
        return index
    }

    /**
     Synchronous read of the dictionary's map<T> method.
    */
    func map<T>(_ transform: (Key, Value) throws -> T) rethrows -> [T] {
        var result: [T] = []
        try self._queue.sync {
            do {

                result = try self.dict.map(transform)

            } catch let error {

                throw error

            }
        }
        return result
    }

    /**
     Synchronous read of the dictionary's reduce<Result> method.
    */
    func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, (key: Key, value: Value)) throws -> Result) rethrows -> Result {
        var result: Result = initialResult
        try self._queue.sync {
            do {

                result = try self.dict.reduce(initialResult, nextPartialResult)

            } catch let error {

                throw error

            }
        }
        return result
    }

    /**
     Synchronous read of the dictionary's reversed method.
    */
    func reversed() -> [(key: Key, value: Value)] {
        var result: [(key: Key, value: Value)] = []
        self._queue.sync { result = self.dict.reversed() }
        return result
    }
}

// MARK: - Write Methods
public extension SynchronizedDictionary {
    /**
     Asynchronous write of the dictionary's popFirst method.
    */
    func popFirst(callback: @escaping ((key: Key, value: Value)?) -> Void) {
        self._queue.async(flags: DispatchWorkItemFlags.barrier) {
            DispatchQueue.main.async {
                callback(self.dict.popFirst())
            }
        }
    }

    /**
     Asynchronous write of the dictionary's removeAll method.
    */
    func removeAll() {
        self._queue.async(flags: DispatchWorkItemFlags.barrier) { self.dict.removeAll() }
    }

    /**
     Asynchronous write of the dictionary's updateValue method.
    */
    func updateValue(_ value: Value, forKey key: Key, callback: @escaping (Value?) -> Void) {
        self._queue.async(flags: DispatchWorkItemFlags.barrier) {
            DispatchQueue.main.async {
                callback(self.dict.updateValue(value, forKey: key))
            }
        }
    }

    /**
     Asynchronous write of the dictionary's removeValue method.
    */
    func removeValue(forKey key: Key, callback: @escaping (Value?) -> Void) {
        self._queue.async(flags: DispatchWorkItemFlags.barrier) {
            DispatchQueue.main.async {
                callback(self.dict.removeValue(forKey: key))
            }
        }
    }
}

// MARK: - Subscript
public extension SynchronizedDictionary {
    /**
     Synchronous getter subscript.
     Asynchronous setter subscript.
    */
    subscript(key: Key) -> Value? {
        get {
            var value: Value?

            self._queue.sync {
                guard let dictValue = self.dict[key] else { return }
                value = dictValue
            }

            return value
        }

        set {

            guard let newValue = newValue else { return }

            self._queue.async(flags: DispatchWorkItemFlags.barrier) {
                self.dict[key] = newValue
            }

        }
    }
}
