//
//  DashboardCell.swift
//  COVID-19-Hackathon
//
//  Created by Abdulelah Hajjar on 31/03/2020.
//  Copyright © 2020 Squadra. All rights reserved.
//

import UIKit

class DashboardCell: UITableViewCell {
	@IBOutlet weak var background: UIView!
	let gradient = CAGradientLayer()

    override func awakeFromNib() {
        super.awakeFromNib()
    }
	
	override func layoutIfNeeded() {
		super.layoutIfNeeded()
		configureGradientLayer()
		background.layer.cornerRadius = 14
		background.clipsToBounds = true

	}
	
	func configureGradientLayer() {
		gradient.colors = [	UIColor(red: 0.99, green: 0.37, blue: 0.39, alpha: 1.00).cgColor,
							UIColor(red: 0.99, green: 0.60, blue: 0.40, alpha: 1.00).cgColor]
		
		gradient.startPoint = CGPoint(x: 0, y: 0)
		gradient.endPoint = CGPoint(x: 1, y: 0)
		
		gradient.frame = background.bounds
		background.layer.insertSublayer(gradient, at: 0)
	}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
