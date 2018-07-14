//
//  FirebaseApiImpl.swift
//  Data
//
//  Created by HAROL GOMEZ RUIZ on 13/7/18.
//  Copyright © 2018 HAROL GOMEZ RUIZ. All rights reserved.
//

import Foundation
import Firebase

enum Child:String {
    case match = "Match"
    case bets = "Match/Bets"
}

public typealias updateMatchcompletion = ( _ match:Match)->Void
public typealias getBetscompletion = ( _ bets:[Bet])->Void

public protocol FirebaseApiProtocol {
    func getMatch(completion: @escaping updateMatchcompletion)
    func setBet(amount:Double,idTeam:Int)
    func getBetsForMatch(completion: @escaping getBetscompletion)
}

public class FirebaseApiImpl: FirebaseApiProtocol {
    
    public var databaseReferenceRoot: DatabaseReference?
    public static let sharedInstance = FirebaseApiImpl()

      init() {
        
 Database.database().isPersistenceEnabled = false
            Database.setLoggingEnabled(true)
        self.databaseReferenceRoot = Database.database().reference()
      }
    
    
   public func getMatch(completion: @escaping updateMatchcompletion) {
                self.databaseReferenceRoot?
                    .child(Child.match.rawValue)
                    .observe(.value, with: { snapshot in
                        if let snapshotValue = snapshot.value as? [String: AnyObject] {
                          
                            completion(Match(title: snapshotValue["title"] as! String, ratio: snapshotValue["ratio"] as! String))
                         
                        }
                        })
    }
    
   public func setBet(amount: Double,idTeam:Int) {
   self.databaseReferenceRoot?.child(Child.bets.rawValue).setValue(["amount":amount,"idTeam":idTeam])
    }
    
    public func getBetsForMatch(completion: @escaping getBetscompletion) {
        
        self.databaseReferenceRoot?
            .child(Child.bets.rawValue)
            .observe(.value, with: { snapshot in

                var newItems: [Bet] = []
                for item in snapshot.children {
                    let bet = Transform.getBet(snapshot: item as! DataSnapshot)
                    newItems.append(bet!)
                }
                completion(newItems)
            })
    }
    
    
}
