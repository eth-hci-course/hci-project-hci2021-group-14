//
//  Human Computer Interaction, ETH Zürich
//  Copyright © 2021 Alexandre Reol. All rights reserved.
//

import UIKit

class TechnicalDetailsViewController: UIViewController {

    var project: Project?
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var scoreButton: UIButton!
    @IBOutlet var lifetimeInvestmentLabel: UILabel!
    @IBOutlet var futureInvestmentLabel: UILabel!
    @IBOutlet var aggregatedProductionCost: UILabel!
    @IBOutlet var riskStarsLabel: UILabel!
    @IBOutlet var investmentImpactLabel: UILabel!
    @IBOutlet var todayConsumptionLabel: UILabel!
    
    override func viewDidLoad() {
        RemoteTimer.incrementLostness()
        RemoteTimer.incrementLostness()
        nameLabel.text = project!.name
        descriptionLabel.text = project!.longDescription
        scoreButton.setTitle("\(project!.score!) kWh", for: .normal)
        lifetimeInvestmentLabel.text = (project!.lengthInMonths > 12) ? "\(Double(project!.lengthInMonths)/12.0) years" : "\(project!.lengthInMonths!) months"
        todayConsumptionLabel.text = "\(project!.todaysConsumption!) kWH/year"
        futureInvestmentLabel.text = "\(project!.futureConsumption!) kWH/year"
        aggregatedProductionCost.text = "\(project!.aggregatedProductionCost!) kWH"
        riskStarsLabel.text = DigitToSymbol.getString(bold: "★", light: "☆", value: project!.riskStars)
        investmentImpactLabel.text = DigitToSymbol.getString(bold: "●", light: "○", value: project!.investementImpact)
        super.viewDidLoad()
    }
    
    @IBAction func riskStarsButton(_ sender: Any) {
        let alert = UIAlertController(title: "How are stars calculated?", message: "Well... that still need to be written lmao", preferredStyle: .alert) // TODO: write message
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func investmentImpactButton(_ sender: Any) {
        let alert = UIAlertController(title: "How is the investment impact calculated?", message: "Well... that still need to be written lmao", preferredStyle: .alert) // TODO: write message
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func paymentSchemeButton(_ sender: Any) {
        let alert = UIAlertController(title: "How does the payment scheme work?", message: "Well... that still need to be written lmao", preferredStyle: .alert) // TODO: write message
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}
