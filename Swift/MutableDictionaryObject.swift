//
//  MutableDictionaryObject.swift
//  CouchbaseLite
//
//  Copyright (c) 2017 Couchbase, Inc All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Foundation
import CouchbaseLiteSwift_Private

/// MutableDictionaryProtocol defines a set of methods for getting and setting
/// dictionary data.
public protocol MutableDictionaryProtocol: DictionaryProtocol, MutableDictionaryFragment {

    // MARK: Type Setters
    
    @discardableResult func setValue(_ value: Any?, forKey key: String) -> Self
    
    @discardableResult func setString(_ value: String?, forKey key: String) -> Self
    
    @discardableResult func setNumber(_ value: NSNumber?, forKey key: String) -> Self
    
    @discardableResult func setInt(_ value: Int, forKey key: String) -> Self
    
    @discardableResult func setInt64(_ value: Int64, forKey key: String) -> Self
    
    @discardableResult func setFloat(_ value: Float, forKey key: String) -> Self
    
    @discardableResult func setDouble(_ value: Double, forKey key: String) -> Self
    
    @discardableResult func setBoolean(_ value: Bool, forKey key: String) -> Self
    
    @discardableResult func setDate(_ value: Date?, forKey key: String) -> Self
    
    @discardableResult func setBlob(_ value: Blob?, forKey key: String) -> Self
    
    @discardableResult func setArray(_ value: ArrayObject?, forKey key: String) -> Self
    
    @discardableResult func setDictionary(_ value: DictionaryObject?, forKey key: String) -> Self
    
    // MARK: Data
    
    @discardableResult func setData(_ data: Dictionary<String, Any>) -> Self
    @discardableResult func setJSON(_ json: String) throws -> Self
    
    // MARK: Removing Entries
    
    @discardableResult func removeValue(forKey key: String) -> Self
    
    // MARK: Getting MutableDictionaryObject and MutableArrayObject
    
    func array(forKey key: String) -> MutableArrayObject? /* override */
    
    func dictionary(forKey key: String) -> MutableDictionaryObject? /* override */
    
}

/// MutableDictionaryObject provides access to dictionary data.
public final class MutableDictionaryObject: DictionaryObject, MutableDictionaryProtocol {
    
    // MARK: Initializers
    
    /// Initialize a new empty MutableDictionaryObject object.
    public init() {
        super.init(CBLMutableDictionary())
    }
    
    /// Initialzes a new MutableDictionaryObject object with the data. Allowed
    /// value types are Array, ArrayObject, Blob, Date, Dictionary,
    /// DictionaryObject, NSNull, Number types, and String.
    /// The Arrays and Dictionaries must contain only the above types.
    ///
    /// - Parameter dictionary: the dictionary object.
    public init(data: Dictionary<String, Any>) {
        super.init(CBLMutableDictionary())
        setData(data)
    }
    
    /// Initialzes a new MutableDictionary object from the JSON string.
    ///
    /// - Parameter json: The JSON string with data.
    /// - Throws: An error on a failure.
    public init(json: String) throws {
        super.init(CBLMutableDictionary())
        try setJSON(json)
    }
    
    // MARK: Type Setters
    
    /// Set a value for the given key. Allowed value types are Array, Date, Dictionary,
    /// Number types, NSNull, String, ArrayObject, Blob, DictionaryObject and nil.
    /// The Arrays and Dictionaries must contain only the above types. A nil value will be
    /// converted to an NSNull. An Date object will be converted to an ISO-8601 format string.
    ///
    /// - Parameters:
    ///   - value: The value.
    ///   - key: The key.
    /// - Returns: The self object.
    @discardableResult public func setValue(_ value: Any?, forKey key: String) -> Self {
        dictImpl.setValue(DataConverter.convertSETValue(value), forKey: key)
        return self
    }
    
    /// Set a String value for the given key.
    ///
    /// - Parameters:
    ///   - value: The String value.
    ///   - key: The key.
    /// - Returns: The self object.
    @discardableResult public func setString(_ value: String?, forKey key: String) -> Self {
        return setValue(value, forKey:  key)
    }

    /// Set a Number value for the given key.
    ///
    /// - Parameters:
    ///   - value: The number value.
    ///   - key: They key.
    /// - Returns: The self object.
    @discardableResult public func setNumber(_ value: NSNumber?, forKey key: String) -> Self {
        return setValue(value, forKey: key);
    }
    
    /// Set an int value for the given key.
    ///
    /// - Parameters:
    ///   - value: The int value.
    ///   - key: The key.
    /// - Returns: The self object.
    @discardableResult public func setInt(_ value: Int, forKey key: String) -> Self {
        return setValue(value, forKey: key)
    }
    
    /// Set an int64 value for the given key.
    ///
    /// - Parameters:
    ///   - value: The int64 value.
    ///   - key: The key.
    /// - Returns: The self object.
    @discardableResult public func setInt64(_ value: Int64, forKey key: String) -> Self {
        return setValue(value, forKey: key)
    }
    
    /// Set a double value for the given key.
    ///
    /// - Parameters:
    ///   - value:  The double value.
    ///   - key: The key.
    /// - Returns: The self object.
    @discardableResult public func setDouble(_ value: Double, forKey key: String) -> Self {
        return setValue(value, forKey: key)
    }
    
    /// Set a float value for the given key.
    ///
    /// - Parameters:
    ///   - value: The float value.
    ///   - key: The key.
    /// - Returns: The self object.
    @discardableResult public func setFloat(_ value: Float, forKey key: String) -> Self {
        return setValue(value, forKey: key)
    }

    /// Set a boolean value for the given key.
    ///
    /// - Parameters:
    ///   - value: The boolean value.
    ///   - key: The key.
    /// - Returns: The self object.
    @discardableResult public func setBoolean(_ value: Bool, forKey key: String) -> Self {
        return setValue(value, forKey: key)
    }
    
    /// Set a Date object for the given key. A nil value will be converted to an NSNull.
    ///
    /// - Parameters:
    ///   - value: The Date object.
    ///   - key: The key.
    /// - Returns: The self object.
    @discardableResult public func setDate(_ value: Date?, forKey key: String) -> Self {
        return setValue(value, forKey: key)
    }
    
    /// Set a Blob object for the given key. A nil value will be converted to an NSNull.
    ///
    /// - Parameters:
    ///   - value: The Blob object.
    ///   - key: The key.
    /// - Returns: The self object.
    @discardableResult public func setBlob(_ value: Blob?, forKey key: String) -> Self {
        return setValue(value, forKey: key)
    }
    
    /// Set an ArrayObject object for the given key. A nil value will be converted to an NSNull.
    ///
    /// - Parameters:
    ///   - value: The ArrayObject object.
    ///   - key: The key.
    /// - Returns: The self object.
    @discardableResult public func setArray(_ value: ArrayObject?, forKey key: String) -> Self {
        return setValue(value, forKey: key)
    }
    
    /// Set a DictionaryObject object for the given key. A nil value will be converted to an NSNull.
    ///
    /// - Parameters:
    ///   - value: The DictionaryObject object.
    ///   - key: The key.
    /// - Returns: The self object.
    @discardableResult public func setDictionary(_ value: DictionaryObject?, forKey key: String) -> Self {
        return setValue(value, forKey: key)
    }

    // MARK: Data
    
    /// Set data for the dictionary. Allowed value types are Array, ArrayObject,
    /// Blob, Date, Dictionary, DictionaryObject, NSNull, Number types, and String.
    /// The Arrays and Dictionaries must contain only the above types.
    ///
    /// - Parameter data: The data.
    /// - Returns: The self object.
    @discardableResult public func setData(_ data: Dictionary<String, Any>) -> Self {
        dictImpl.setData(DataConverter.convertSETDictionary(data))
        return self
    }
    
    // MARK: setJSON
    
    /// Set data with JSON string.
    ///
    /// - Parameter json: The JSON string with data.
    /// - Returns: The self object.
    /// - Throws: An error on a failure.
    @discardableResult public func setJSON(_ json: String) throws -> Self {
        try dictImpl.setJSON(json)
        return self
    }
    
    // MARK: Removing Entries
    
    /// Removes a given key and its value from the dictionary.
    ///
    /// - Parameter key: The key.
    /// - Returns: The self object.
    @discardableResult public func removeValue(forKey key: String) -> Self {
        dictImpl.removeValue(forKey: key)
        return self
    }
    
    // MARK: Getting DictionaryObject and ArrayObject
    
    /// Get a property's value as an MutableArrayObject, which is a mapping
    /// object of an array value. Returns nil if the property doesn't exists,
    /// or its value is not an array.
    ///
    /// - Parameter key: The key.
    /// - Returns: The MutableArrayObject object or nil if the property doesn't exist.
    public override func array(forKey key: String) -> MutableArrayObject? {
        return self.value(forKey: key) as? MutableArrayObject
    }
    
    /// Get a property's value as a MutableDictionaryObject, which is a mapping
    /// object of a dictionary value. Returns nil if the property doesn't exists,
    /// or its value is not a dictionary.
    ///
    /// - Parameter key: The key.
    /// - Returns: The MutableDictionaryObject object.
    public override func dictionary(forKey key: String) -> MutableDictionaryObject? {
        return value(forKey: key) as? MutableDictionaryObject
    }
    
    // MARK: Subscript
    
    /// Subscripting access to a MutableFragment object that represents the
    /// value of the dictionary by key.
    ///
    /// - Parameter key: The key.
    /// - Returns: The Fragment object.
    public override subscript(key: String) -> MutableFragment {
        return MutableFragment((dictImpl as CBLMutableDictionaryFragment)[key])
    }
    
    /// Mutable Objects will throw an exception, when called toJSON
    public override func toJSON() -> String {
        return impl.toJSON()
    }
    
    // MARK: Internal
    
    init(_ impl: CBLMutableDictionary) {
        super.init(impl)
    }
    
    // MARK: Private
    
    private var dictImpl: CBLMutableDictionary {
        return impl as! CBLMutableDictionary
    }
    
}
