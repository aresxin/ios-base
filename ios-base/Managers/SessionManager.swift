//
//  SessionDataManager.swift
//  ios-base
//
//  Created by Juan Pablo Mazza on 11/8/16.
//  Copyright © 2016 Rootstrap Inc. All rights reserved.
//

import UIKit

class SessionManager: NSObject {

  static var currentSession: Session? {
    get {
      if
        let data = UserDefaults.standard.data(forKey: "ios-base-session"),
        let session = try? JSONDecoder().decode(Session.self, from: data)
      {
        return session
      }
      return nil
    }
    
    set {
      let session = try? JSONEncoder().encode(newValue)
      UserDefaults.standard.set(session, forKey: "ios-base-session")
    }
  }
  
  class func deleteSession() {
    UserDefaults.standard.removeObject(forKey: "ios-base-session")
  }
  
  static var validSession: Bool {
    currentSession?.isValid ?? false
  }
}
