//
//  FirebaseAPIHelper.swift
//  
//
//  Created by Will Oakley on 10/24/18.
//

import Foundation
import FirebaseStorage
import FirebaseDatabase
import UIKit

class FirebaseAPIClient {
    
    static func getSnaps(completion: @escaping ([SnapImage]) -> ()) {
        /* PART 2A START */
        var allSnaps: [SnapImage] = []
        Database.database().reference().child("snapImages").observe(.value) { (snap) in
            for child in snap.children {
                let snapDict = (child as! DataSnapshot).value as! NSDictionary
                let sentBy = snapDict.value(forKey: "sentBy") as! String
                let timeSent = snapDict.value(forKey: "timeSent") as! String
                let sentTo = snapDict.value(forKey: "sentTo") as! String
                let imgURL = snapDict.value(forKey: "imageURL") as! String
                var snapImage: UIImage?
                if let url = URL(string: imgURL) {
                    do {
                        let data = try Data(contentsOf: url)
                        snapImage = UIImage(data: data)
                    } catch let err {
                        print("Error : \(err.localizedDescription)")
                    }
                }
                let newSnap = SnapImage(sentBy: sentBy, sentTo: sentTo, timeSent: timeSent, image: snapImage!)
                allSnaps.append(newSnap)
                
            }
             completion(allSnaps)
        }
       
        /* PART 2A FINISH */
    }
}
