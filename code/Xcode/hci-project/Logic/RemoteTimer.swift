//
//  Human Computer Interaction, ETH Zürich
//  Copyright © 2021 Alexandre Reol. All rights reserved.
//

import Foundation

class RemoteTimer {
    static func start() {
        URLCache.shared.removeAllCachedResponses()
        let url = URL(string: "http://server.reol.ch/hci-start?ABtesting=\(UserDefaults.standard.bool(forKey: "activateABtesting"))")!
        let task = URLSession.shared.dataTask(with: url)
        task.resume()
    }
    
    static func stop() {
        URLCache.shared.removeAllCachedResponses()
        let url = URL(string: "http://server.reol.ch/hci-stop?ABtesting=\(UserDefaults.standard.bool(forKey: "activateABtesting"))")!
        let task = URLSession.shared.dataTask(with: url)
        task.resume()
    }
}
