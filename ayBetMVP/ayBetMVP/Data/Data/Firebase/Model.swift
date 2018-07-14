//
//  Model.swift
//  Data
//
//  Created by HAROL GOMEZ RUIZ on 13/7/18.
//  Copyright © 2018 HAROL GOMEZ RUIZ. All rights reserved.
//

import Foundation
import Firebase

public struct Match {
    var title:String
    var ratio:String
}

public struct Bet {
    var amount: Double
    var name: String
    var idTeam: String
    var flag: String
}

class Transform {
    
    class func getBet(snapshot: DataSnapshot)-> Bet? {
        
        let snapshotValue = snapshot.value as? [String: AnyObject]
        if(snapshotValue != nil){
            
            let amount = (snapshotValue?["amount"] as? Double) ?? 0
            let name = (snapshotValue?["user"] as? String) ?? "Anónimo"
            let idTeam = (snapshotValue?["idTeam"] as? String) ?? ""
            let flag = (snapshotValue?["flag"] as? String) ?? ""
            return Bet(amount: amount , name: name, idTeam: idTeam, flag: flag)
        }
            
        return nil
    }
    
}

