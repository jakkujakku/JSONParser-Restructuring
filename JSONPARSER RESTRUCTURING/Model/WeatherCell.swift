//
//  WeatherCell.swift
//  JSONPARSER RESTRUCTURING
//
//  Created by (^ㅗ^)7 iMac on 2022/12/01.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var countryLabel : UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
