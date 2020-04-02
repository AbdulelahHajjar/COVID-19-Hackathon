//
//  ActionCell.swift
//  COVID-19-Hackathon
//
//  Created by Abdulelah Hajjar on 31/03/2020.
//  Copyright © 2020 Squadra. All rights reserved.
//

import UIKit
import CoreImage

class ActionCell: UITableViewCell {
	@IBOutlet weak var buttonView: UIView!
	@IBOutlet weak var sideView: UIView!
	@IBOutlet weak var title: UILabel!
	@IBOutlet weak var subtitle: UILabel!
	
	@IBOutlet weak var icon: UIImageView!
	
	let unifiedCornerRadius = CGFloat(10.0)
	
	var colors: [CGColor]?
	
    override func awakeFromNib() {
        super.awakeFromNib()

    }
	
	override func layoutSubviews() {
		super.layoutSubviews()
		setUpInitialSettingsForViews()
		setUpButtonViewShadow()
		setUpSideViewGradient()
		setUpSideViewShadow()
	}
	
	func setUpSideViewShadow() {
		sideView.layer.masksToBounds = true
		sideView.layer.shadowColor = colors![0]
		sideView.layer.shadowOpacity = 0.3
		sideView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
		sideView.layer.shadowRadius = 3.0
		sideView.layer.masksToBounds = false
	}
	
	func setUpInitialSettingsForViews() {
		sideView.layer.cornerRadius = 12
		icon.tintColor = .white
		buttonView.backgroundColor = .white
		buttonView.layer.cornerRadius = unifiedCornerRadius
		sideView.layer.cornerRadius = unifiedCornerRadius
	}
	
	func setUpButtonViewShadow() {
		buttonView.layer.shadowColor = UIColor.black.cgColor
		buttonView.layer.shadowRadius = 3
		buttonView.layer.shadowOpacity = 0.1
		buttonView.layer.shadowOffset = .zero
	}
	
	func setUpSideViewGradient() {
		let gradientView = getGradientViewFromColors()
		sideView.insertSubview(gradientView, at: 0)

	}
	
	
	func getGradientViewFromColors() -> UIView {
		let gradient = CAGradientLayer()
		gradient.frame = sideView.bounds
		gradient.colors = colors
		gradient.startPoint = CGPoint(x: 1, y: 1)
		gradient.endPoint = CGPoint(x: 0, y: 0)
		
		let gradientView = UIView()
		gradientView.frame = sideView.bounds
		gradientView.layer.insertSublayer(gradient, at: 0)
		gradientView.layer.cornerRadius = unifiedCornerRadius
		gradientView.clipsToBounds = true
		
		return gradientView
	}
	
//	func getShadowLayer(shadowBounds: CGRect, shadowColor: CGColor) -> CALayer {
//		let shadowLayer = CAShapeLayer()
//		shadowLayer.path = UIBezierPath(roundedRect: shadowBounds, cornerRadius: unifiedCornerRadius).cgPath
//		shadowLayer.shadowColor = shadowColor
//		shadowLayer.shadowPath = shadowLayer.path
//		shadowLayer.shadowOffset = CGSize(width: 0.0, height: 1.0)
//		shadowLayer.shadowOpacity = 1.0
//		shadowLayer.shadowRadius = 3
//		return shadowLayer
//	}
	
	func setUpButton(titleString: String, subtitle: String, image: UIImage, colors: [CGColor]) {
		self.title.text = titleString
		self.subtitle.text = subtitle
		icon.image = image
		self.colors = colors
	}
	
	func showClickAnimation(completion: @escaping () -> ()) {
		
	}
	
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
	
}
