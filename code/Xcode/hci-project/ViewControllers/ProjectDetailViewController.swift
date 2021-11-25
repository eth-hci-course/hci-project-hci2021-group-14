//
//  Human Computer Interaction, ETH Zürich
//  Copyright © 2021 Alexandre Reol. All rights reserved.
//

import UIKit

class ProjectDetailViewController: UIViewController {
    
    var project: Project?
    var investedAmount: Int = -1
    
    @IBOutlet var closeButton: UIBarButtonItem!
    @IBOutlet var nameProjectLabel: UILabel!
    @IBOutlet var personImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var slider: UISlider!
    @IBOutlet var topSummaryView: UIView!
    @IBOutlet var projectNameLabel: UILabel!
    @IBOutlet var lifetimeSavingsLabel: UILabel!
    @IBOutlet var wantedFundingLabel: UILabel!
    @IBOutlet var currentFundingLabel: UILabel!
    @IBOutlet var roiLabel: UILabel!
    @IBOutlet var investButton: UIButton!
    
    override func viewDidLoad() {
        RemoteTimer.incrementLostness()
        nameProjectLabel.text = project?.name
        personImage.image = UIImage(named: project!.pictureAssetName)
        personImage.makeRounded()
        nameLabel.text = project?.investorName
        ratingLabel.text = DigitToSymbol.getString(bold: "★", light: "☆", value: project!.riskStars)
        investedAmount = Int((project!.wantedFunding - project!.currentFunding)/2)
        slider.isContinuous = true
        slider.minimumValue = 10
        slider.maximumValue = Float(project!.wantedFunding - project!.currentFunding)
        slider.value = (slider.minimumValue+slider.maximumValue)/2
        textfield.text = String(Int((slider.minimumValue+slider.maximumValue)/2))
        topSummaryView.clipsToBounds = true
        topSummaryView.layer.cornerRadius = 15
        topSummaryView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        lifetimeSavingsLabel.text = "\(project!.score!) kWh"
        wantedFundingLabel.text = "\(project!.wantedFunding!) CHF"
        currentFundingLabel.text = "\(project!.currentFunding!) CHF"
        roiLabel.text = "\(project!.yearlyROI*100)%"
        investButton.clipsToBounds = true
        investButton.layer.cornerRadius = 15
        investButton.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? TechnicalDetailsViewController {
            destinationVC.project = self.project
        }
    }
    
    @IBAction func closeButton(_ sender: Any) {
        RemoteTimer.incrementLostness()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ratingHelpButton(_ sender: Any) {
        RemoteTimer.incrementLostness()
        let alert = UIAlertController(title: "How are stars calculated?", message: "Well... that still need to be written lmao", preferredStyle: .alert) // TODO: write message
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func updateSlider(_ sender: Any) {
        investedAmount = Int(slider.value)
        textfield.text = String(investedAmount)
    }
    
    @IBAction func investButton(_ sender: Any) {
        RemoteTimer.incrementLostness()
        let dataToPass = ["investorName":"\(self.project!.investorName!)", "amountInvested":"\(self.investedAmount)"]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "invested"), object: nil, userInfo: dataToPass)
        self.dismiss(animated: true)
    }
}
