//
//  Human Computer Interaction, ETH Zürich
//  Copyright © 2021 Alexandre Reol. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var notificationView: UIView!
    @IBOutlet var notificationDescription: UILabel!
    @IBOutlet var discoverButton: UIButton!
    @IBOutlet var graphView: UIView!
    @IBOutlet var graphImage: UIImageView!
    @IBOutlet var investmentTableView: UITableView!
    
    var notificationProject: Project?
    var selectedProject: Int?
    
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(showAndCloseNotification), name: Notification.Name(rawValue: "invested"), object: nil)
        graphImage.layer.cornerRadius = 25
        graphImage.clipsToBounds = true
        investmentTableView.delegate = self
        investmentTableView.dataSource = self
        notificationView.isHidden = true
        notificationView.clipsToBounds = true
        notificationView.layer.cornerRadius = 25
        super.viewDidLoad()
    }
    
    @IBAction func discoverButton(_ sender: Any) {
        RemoteTimer.incrementLostness()
        self.performSegue(withIdentifier: "discover", sender: nil)
    }
    
    @IBAction func debugButton(_ sender: Any) {
        let alert = UIAlertController(title: "Debug menu", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "A/B testing", style: .default, handler: {_ in
            let alert = UIAlertController(title: "A/B testing", message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "A", style: .default, handler: {_ in
                UserDefaults.standard.set(false, forKey: "activateABtesting")
            }))
            alert.addAction(UIAlertAction(title: "B", style: .default, handler: {_ in
                UserDefaults.standard.set(true, forKey: "activateABtesting")
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Timer trigger", style: .default, handler: {_ in
            let alert = UIAlertController(title: "Timer trigger", message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "/start", style: .default, handler: {_ in
                let alertController = UIAlertController(title: "Name for test", message: "", preferredStyle: .alert)
                let saveAction = UIAlertAction(title: "Start test", style: .default, handler: { alert -> Void in
                    let firstTextField = alertController.textFields![0] as UITextField
                    RemoteTimer.start(name: "\(firstTextField.text!)")
                })
                let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
                alertController.addTextField { (textField : UITextField!) -> Void in
                    textField.placeholder = "Enter First Name"
                }
                alertController.addAction(cancelAction)
                alertController.addAction(saveAction)
                self.present(alertController, animated: true, completion: nil)
            }))
            alert.addAction(UIAlertAction(title: "/stop", style: .default, handler: {_ in
                RemoteTimer.stop()
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectedProject" {
            let navVC = segue.destination as? UINavigationController
            let destinationVC = navVC?.viewControllers.first as! ProjectDetailViewController
            destinationVC.project = DemoData.generate()[selectedProject!]
        }
    }
    
    @objc func showAndCloseNotification(notification: NSNotification) {
        RemoteTimer.incrementLostness()
        notificationDescription.text = "Thank you for helping \(notification.userInfo!["investorName"]!) with your investment of \(notification.userInfo!["amountInvested"]!) CHF"
        self.notificationView.alpha = 1
        self.notificationView.isHidden =  false
        UIView.animate(withDuration: 1.0, delay: 3.0, options: UIView.AnimationOptions(), animations: {
            self.notificationView.alpha = 0
        }, completion: {_ in
            self.notificationView.alpha = 1
            self.notificationView.isHidden =  true
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! AvailableProjectCell
        let currentProject = DemoData.generate()[indexPath.section]
        cell.personImage.image = UIImage(named: currentProject.pictureAssetName)
        cell.personImage.makeRounded()
        cell.nameLabel.text = currentProject.investorName
        cell.fundingText.text = "\(Int(currentProject.wantedFunding!)) CHF are fully funded!"
        cell.progressView.progress = 1.0
        cell.progressView.tintColor = UIColor.systemGreen
        cell.applianceLabel.text = currentProject.shortDescription
        return cell
    }
}
