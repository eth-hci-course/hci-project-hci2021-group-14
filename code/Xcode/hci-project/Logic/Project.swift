//
//  Human Computer Interaction, ETH Zürich
//  Copyright © 2021 Alexandre Reol. All rights reserved.
//

import Foundation

class Project {
    internal init(id: Int? = nil, name: String? = nil, category: projectCategory? = nil, shortDescription: String? = nil, longDescription: String? = nil, currentFunding: Double? = nil, wantedFunding: Double? = nil, yearlyROI: Double? = nil, lengthInMonths: Int? = nil, todaysConsumption: Double? = nil, futureConsumption: Double? = nil, aggregatedProductionCost: Double, lifetimeSavings: Int? = nil, investorName: String? = nil, pictureAssetName: String? = nil, riskStars: Double? = nil, investementImpact: Double? = nil) {
        self.id = id
        self.name = name
        self.category = category
        self.shortDescription = shortDescription
        self.longDescription = longDescription
        self.currentFunding = currentFunding
        self.wantedFunding = wantedFunding
        self.yearlyROI = yearlyROI
        self.lengthInMonths = lengthInMonths
        self.todaysConsumption = todaysConsumption
        self.futureConsumption = futureConsumption
        self.aggregatedProductionCost = aggregatedProductionCost
        self.lifetimeSavings = lifetimeSavings
        self.investorName = investorName
        self.pictureAssetName = pictureAssetName
        self.riskStars = riskStars
        self.investementImpact = investementImpact
    }
    
    var id: Int! // 0, 1, 2, ... , n
    var name: String! // name of the project
    
    var category: projectCategory! // from the defined enums
    var shortDescription: String! // max 10 words.
    var longDescription: String! // approx. 30 words
    
    var currentFunding: Double! // in CHF
    var wantedFunding: Double! // in CHF
    var yearlyROI: Double! // in percentage, for example *2.5%* --> 0.025
    
    var lengthInMonths: Int! // length of repayment in months
    var todaysConsumption: Double! // in kWh/year
    var futureConsumption: Double! // in kWh/year; for obvious reasons todaysConsumption > futureConsumption
    var aggregatedProductionCost: Double! // in kWh
    
    var lifetimeSavings: Int! // in kWh
    var score: Double! {
        get {
            return Double(Int(Double(self.lengthInMonths!) * (self.todaysConsumption! - self.futureConsumption!) - self.aggregatedProductionCost!))
        }
    }
    
    var investorName: String! // name of the investor
    var pictureAssetName: String! // name of the JPG/PNG with the picture of the user, for example for *userPic.jpg* --> "userPic"
    
    var riskStars: Double! // star rating in 1.0 steps: {0, 1.0, 2.0, 3.0, 4.0, 5.0}
    var investementImpact: Double! // star rating in 1.0 steps: {0, 1.0, 2.0, 3.0, 4.0, 5.0}
}

enum projectCategory: String {
    case kitchen = "Kitchen appliances"
    case ac = "Air conditioners"
    case office = "Office"
    case lighting = "Lighting"
    case household = "Household"
}

extension projectCategory {
    static let allItems: [projectCategory] = [.kitchen, .ac, .office, .lighting, .household]
}
