//
//  DBManager.swift
//  PyramidGold
//
//  Created by MAC on 21/11/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit
import RealmSwift


class DBManager {
     
    private var   database:Realm
    static let   sharedInstance = DBManager()
    
    private init() {
       database = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    func writeTransaction(completion:@escaping() -> ()){
       try! database.write({
            completion()
        })
    }
    
    /**
     Delete local database
     */
    func deleteDatabase() {
        try! database.write({
            database.deleteAll()
        })
    }
     
    /**
     Save object to realm database
     */
    func saveObject(obj: Object, completion : @escaping() -> ()) {
        try! database.write({
            database.add(obj)
            completion()
        })
    }
    
    func saveObjects(objs: Object, completion : @escaping() -> ()) {
        try! database.write({
            database.add(objs)
            completion()
        })
    }
    
    /*
     * Updates objects
     */
    
    func saveAndUpdateObject(obj: Object, completion : @escaping() -> ()) {
        try! database.write({
            database.add(obj, update: .all)
            completion()
        })
    }
    
    func saveAndUpdateObjects(objs: [Object], completion : @escaping() -> ()) {
        try! database.write({
            database.add(objs, update: .all)
            completion()
        })
    }
    
    /**
     Returs an array as [Object]
     */
    func getObjects(type: Object.Type) -> [Object] {
        var objects = [Object]()
        for result in database.objects(type) {
            objects.append(result)
        }
        return objects
    }
    
    func getObject(for query: String, type: Object.Type) -> Object? {
       let objs =  database.objects(type).filter(query)
       return objs.first
    }
    
    func getObjects(for query: String, type: Object.Type) -> [Object]? {
        let objs =  database.objects(type).filter(query)
        var objects = [Object]()
        for result in objs {
            objects.append(result)
        }
        return objects
    }
    
    func deleteObject(obj: Object, completion : @escaping() -> ()){
        try! database.write({
            database.delete(obj)
            completion()
        })
    }
    
    func deleteObjects(objs: [Object], completion : @escaping() -> ()){
        try! database.write({
            database.delete(objs)
            completion()
        })
    }
    
}
