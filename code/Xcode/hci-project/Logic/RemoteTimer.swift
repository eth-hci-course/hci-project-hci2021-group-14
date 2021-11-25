//
//  Human Computer Interaction, ETH Zürich
//  Copyright © 2021 Alexandre Reol. All rights reserved.
//

import Foundation

class RemoteTimer {
    
    static func start(name: String) {
        UserDefaults.standard.set(name, forKey: "testName")
        UserDefaults.standard.set(0, forKey: "lostness")
        UserDefaults.standard.set(Date.timeIntervalSinceReferenceDate, forKey: "timerStart")
    }
    
    static func incrementLostness() {
        let before = UserDefaults.standard.integer(forKey: "lostness")
        UserDefaults.standard.set(before+1, forKey: "lostness")
    }
    
    static func stop() {
        URLCache.shared.removeAllCachedResponses()
        let name = UserDefaults.standard.string(forKey: "testName") ?? "Unknown"
        let ABtesting = UserDefaults.standard.bool(forKey: "activateABtesting") ? "B" : "A"
        let startTimestamp = UserDefaults.standard.double(forKey: "timerStart")
        let stopTimestamp = Date.timeIntervalSinceReferenceDate
        let secondsTimer = String(format: "%.2f", stopTimestamp - startTimestamp)
        let lostness = UserDefaults.standard.integer(forKey: "lostness")
        let url = URL(string: "http://server.reol.ch/hci-stop?name=\(name)&abtesting=\(ABtesting)&secondstimer=\(secondsTimer)&lostnessvalue=\(lostness)")!
        let task = URLSession.shared.dataTask(with: url)
        task.resume()
    }
}
