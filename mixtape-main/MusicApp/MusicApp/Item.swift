//
//  Item.swift
//  MusicApp
//
//  Created by 小华 on 11/13/22.
//

import UIKit

class Item: Codable{
    var listening: String
    var moodToday: String?
    var dateTitle: String?
    var noteText: String?
    
    
 // convenience init(from decoder: Decoder) throws {
      // decode a key value pair with name "bar" and an Int value using decoder
 //     let decodedBar = try ...
  //    self.init(bar: decodedBar)
  // }  //  init(listening: String, moodToday: String?, dateTitle: Date, noteText: String?) {
   //     self.listening = listening
   //     self.moodToday = moodToday
   //     self.dateTitle = dateTitle
   //     self.noteText = noteText
    
   init() {
       listening = "okay"
       moodToday = "happy"
       dateTitle = "today"
     noteText = "none"
      print("in init()")
     }
    
}
