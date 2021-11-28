//
//  Human Computer Interaction, ETH Zürich
//  Copyright © 2021 Alexandre Reol. All rights reserved.
//

import UIKit

class AvailableProjectsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var filterView: UIView!
    @IBOutlet var filterViewHeight: NSLayoutConstraint!
    @IBOutlet var investmentTableView: UITableView!
    @IBOutlet var categoryButton: UIButton!
    @IBOutlet var riskButton: UIButton!
    @IBOutlet var minPriceButton: UIButton!
    @IBOutlet var maxPriceButton: UIButton!
    
    var selectedProject: Int?
    var categoryFilter: projectCategory?
    var riskFilter: Double = -1.0
    var minPriceFilter: Double = -1
    var maxPriceFilter: Double = -1
    var filteredList: [Project] = DemoData.generate()
    
    override func viewDidLoad() {
        investmentTableView.delegate = self
        investmentTableView.dataSource = self
        if !UserDefaults.standard.bool(forKey: "activateABtesting") {
            filterView.isHidden = true
            filterViewHeight.constant = 0
        }
        
        // MARK: Category filter
        let categoryMenu = UIMenu(title: "Filter by category of project", image: UIImage(systemName: "sidebar.left"), children: [
            UIAction(title: "No Filter", image: UIImage(systemName: "x.circle")) { action in
                RemoteTimer.incrementLostness()
                self.categoryFilter = nil
                self.categoryButton.setTitleColor(UIColor(named: "AccentColor")!, for: .normal)
                self.categoryButton.setTitle("Category", for: .normal)
                self.filterList()
            },
            UIAction(title: "Kitchen", image: UIImage(systemName: "thermometer")) { action in
                RemoteTimer.incrementLostness()
                self.categoryFilter = .kitchen
                self.categoryButton.setTitleColor(UIColor.white, for: .normal)
                self.categoryButton.setTitle("Kitchen", for: .normal)
                self.filterList()
            },
            UIAction(title: "A/C", image: UIImage(systemName: "wind")) { action in
                RemoteTimer.incrementLostness()
                self.categoryFilter = .ac
                self.categoryButton.setTitleColor(UIColor.white, for: .normal)
                self.categoryButton.setTitle("A/C", for: .normal)
                self.filterList()
            },
            UIAction(title: "Office", image: UIImage(systemName: "laptopcomputer")) { action in
                RemoteTimer.incrementLostness()
                self.categoryFilter = .office
                self.categoryButton.setTitleColor(UIColor.white, for: .normal)
                self.categoryButton.setTitle("Office", for: .normal)
                self.filterList()
            },
            UIAction(title: "Lighting", image: UIImage(systemName: "lightbulb")) { action in
                RemoteTimer.incrementLostness()
                self.categoryFilter = .lighting
                self.categoryButton.setTitleColor(UIColor.white, for: .normal)
                self.categoryButton.setTitle("Lighting", for: .normal)
                self.filterList()
            },
            UIAction(title: "Household", image: UIImage(systemName: "house.fill")) { action in
                RemoteTimer.incrementLostness()
                self.categoryFilter = .household
                self.categoryButton.setTitleColor(UIColor.white, for: .normal)
                self.categoryButton.setTitle("Household", for: .normal)
                self.filterList()
            },
            UIAction(title: "Heating", image: UIImage(systemName: "thermometer.sun.fill")) { action in
                RemoteTimer.incrementLostness()
                self.categoryFilter = .heating
                self.categoryButton.setTitleColor(UIColor.white, for: .normal)
                self.categoryButton.setTitle("Heating", for: .normal)
                self.filterList()
            },
            UIAction(title: "Insulation", image: UIImage(systemName: "house.circle")) { action in
                RemoteTimer.incrementLostness()
                self.categoryFilter = .insulation
                self.categoryButton.setTitleColor(UIColor.white, for: .normal)
                self.categoryButton.setTitle("Insulation", for: .normal)
                self.filterList()
            }
        ])
        categoryButton.menu = categoryMenu
        
        // MARK: Risk filter
        let riskMenu = UIMenu(title: "Filter by risk of project", image: UIImage(systemName: "sidebar.left"), children: [
            UIAction(title: "No Filter", image: UIImage(systemName: "x.circle")) { action in
                RemoteTimer.incrementLostness()
                self.riskFilter = -1.0
                self.riskButton.setTitleColor(UIColor(named: "AccentColor")!, for: .normal)
                self.riskButton.setTitle("Risk level", for: .normal)
                self.filterList()
            },
            UIAction(title: "★☆☆☆☆") { action in
                RemoteTimer.incrementLostness()
                self.riskFilter = 1.0
                self.riskButton.setTitleColor(UIColor.white, for: .normal)
                self.riskButton.setTitle("★☆☆☆☆", for: .normal)
                self.filterList()
            }
            ,UIAction(title: "★★☆☆☆") { action in
                RemoteTimer.incrementLostness()
                self.riskFilter = 2.0
                self.riskButton.setTitleColor(UIColor.white, for: .normal)
                self.riskButton.setTitle("★★☆☆☆", for: .normal)
                self.filterList()
            },
            UIAction(title: "★★★☆☆") { action in
                RemoteTimer.incrementLostness()
                self.riskFilter = 3.0
                self.riskButton.setTitleColor(UIColor.white, for: .normal)
                self.riskButton.setTitle("★★★☆☆", for: .normal)
                self.filterList()
            },
            UIAction(title: "★★★★☆") { action in
                RemoteTimer.incrementLostness()
                self.riskFilter = 4.0
                self.riskButton.setTitleColor(UIColor.white, for: .normal)
                self.riskButton.setTitle("★★★★☆", for: .normal)
                self.filterList()
            },
            UIAction(title: "★★★★★") { action in
                RemoteTimer.incrementLostness()
                self.riskFilter = 5.0
                self.riskButton.setTitleColor(UIColor.white, for: .normal)
                self.riskButton.setTitle("★★★★★", for: .normal)
                self.filterList()
            }
        ])
        riskButton.menu = riskMenu
        
        // MARK: Minimum price filter
        var minPriceMenuActionChildren = [
            UIAction(title: "No Filter", image: UIImage(systemName: "x.circle")) { action in
                RemoteTimer.incrementLostness()
                self.minPriceFilter = -1
                self.minPriceButton.setTitleColor(UIColor(named: "AccentColor")!, for: .normal)
                self.minPriceButton.setTitle("Min. CHF", for: .normal)
                self.filterList()
            }]
        
        for price in [1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000] {
            let action = UIAction(title: "\(price) CHF") { action in
                RemoteTimer.incrementLostness()
                self.minPriceFilter = Double(price)
                self.minPriceButton.setTitleColor(UIColor.white, for: .normal)
                self.minPriceButton.setTitle("Min.  \(price) CHF", for: .normal)
                self.filterList()
            }
            minPriceMenuActionChildren.append(action)
        }
        
        let minPriceMenu = UIMenu(title: "Filter by minimum price", image: UIImage(systemName: "dollarsign.circle"), children: minPriceMenuActionChildren)
        minPriceButton.menu = minPriceMenu
        
        // MARK: Maximum price filter
        var maxPriceMenuActionChildren = [
            UIAction(title: "No Filter", image: UIImage(systemName: "x.circle")) { action in
                RemoteTimer.incrementLostness()
                self.maxPriceFilter = -1
                self.maxPriceButton.setTitleColor(UIColor(named: "AccentColor")!, for: .normal)
                self.maxPriceButton.setTitle("Max. CHF", for: .normal)
                self.filterList()
            }]
        
        for price in [1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000] {
            let action = UIAction(title: "\(price) CHF") { action in
                RemoteTimer.incrementLostness()
                self.maxPriceFilter = Double(price)
                self.maxPriceButton.setTitleColor(UIColor.white, for: .normal)
                self.maxPriceButton.setTitle("Max.  \(price) CHF", for: .normal)
                self.filterList()
            }
            maxPriceMenuActionChildren.append(action)
        }
        
        let maxPriceMenu = UIMenu(title: "Filter by maximum price", image: UIImage(systemName: "dollarsign.circle"), children: maxPriceMenuActionChildren)
        maxPriceButton.menu = maxPriceMenu
        super.viewDidLoad()
    }
    
    func filterList() {
        var list = DemoData.generate()
        if let category = self.categoryFilter {
            list = list.filter { $0.category == category }
        }
        if self.riskFilter != -1 {
            list = list.filter { $0.riskStars == self.riskFilter }
        }
        
        if self.minPriceFilter != -1 {
            list = list.filter {$0.wantedFunding >= self.minPriceFilter}
        }
        
        if self.maxPriceFilter != -1 {
            list = list.filter {$0.wantedFunding <= self.maxPriceFilter}
        }
        self.filteredList = list
        investmentTableView.reloadData()
    }
    
    @IBAction func closeButton(_ sender: Any) {
        RemoteTimer.incrementLostness()
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? ProjectDetailViewController {
            destinationVC.project = DemoData.generate()[selectedProject!]
        }
    }
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return filteredList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch UserDefaults.standard.bool(forKey: "activateABtesting") {
        case true:
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! AvailableProjectCell
            let currentProject = filteredList[indexPath.section]
            cell.personImage.image = UIImage(named: currentProject.pictureAssetName)
            cell.personImage.makeRounded()
            cell.nameLabel.text = currentProject.investorName
            cell.fundingText.text = "\(Int(currentProject.currentFunding!)) of \(Int(currentProject.wantedFunding!)) CHF funded"
            cell.progressView.progress = Float(currentProject.currentFunding/currentProject.wantedFunding)
            cell.applianceLabel.text = currentProject.shortDescription
            return cell
        case false:
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifierA", for: indexPath) as! AvailableProjectCellA
            let currentProject = filteredList[indexPath.section]
            cell.personImage.image = UIImage(named: currentProject.pictureAssetName)
            cell.personImage.makeRounded()
            cell.nameLabel.text = currentProject.investorName
            cell.starsLabel.text = DigitToSymbol.getString(bold: "★", light: "☆", value: currentProject.riskStars!)
            cell.fundingText.text = "\(Int(currentProject.currentFunding!)) of \(Int(currentProject.wantedFunding!)) CHF funded"
            cell.progressView.progress = Float(currentProject.currentFunding/currentProject.wantedFunding)
            cell.applianceLabel.text = currentProject.shortDescription
            cell.roiButton.setTitle(String(format: "%.1f %%", currentProject.yearlyROI*100), for: .normal)
            cell.lifeTimeSavingButton.setTitle("\(currentProject.score!) kWh", for: .normal)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        RemoteTimer.incrementLostness()
        self.selectedProject = filteredList[indexPath.section].id
        self.performSegue(withIdentifier: "selectedProject", sender: nil)
    }
}

class AvailableProjectCell: UITableViewCell {
    @IBOutlet var personImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var fundingText: UILabel!
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var applianceLabel: UILabel!
}

class AvailableProjectCellA: UITableViewCell {
    @IBOutlet var personImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var fundingText: UILabel!
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var starsLabel: UILabel!
    @IBOutlet var applianceLabel: UILabel!
    @IBOutlet var roiButton: UIButton!
    @IBOutlet var lifeTimeSavingButton: UIButton!
}
