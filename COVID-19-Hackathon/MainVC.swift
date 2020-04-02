//
//  MainVC.swift
//  COVID-19-Hackathon
//
//  Created by Abdulelah Hajjar on 31/03/2020.
//  Copyright © 2020 Squadra. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "مساء الخير، عبدالإله!"
		navigationController?.title = "الرئيسية"
		navigationController?.navigationBar.subviews[1].semanticContentAttribute = .forceRightToLeft
		tableView.register(UINib(nibName: "DashboardCell", bundle: nil), forCellReuseIdentifier: "DashboardCell")
		tableView.register(UINib(nibName: "ActionCell", bundle: nil), forCellReuseIdentifier: "ActionCell")
		conformTableViewDelegates()
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		var rowHeight: CGFloat
		let screenHeight = UIScreen.main.fixedCoordinateSpace.bounds.height - self.navigationController!.navigationBar.frame.size.height - 120
		indexPath.row == 0 && indexPath.section == 0 ? (rowHeight = CGFloat(screenHeight / 2.1)) : (rowHeight = CGFloat(screenHeight / 6.5))
		return rowHeight
	}
	
	func conformTableViewDelegates() {
		tableView.delegate = self
		tableView.dataSource = self
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let numRows: Int
		section == 0 ? (numRows = 1) : (numRows = 3)
		return numRows
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if(tableView.cellForRow(at: indexPath) is ActionCell) {
			switch (indexPath.row) {
			case 0:
//				performSegue(withIdentifier: "", sender: self)
				print(0)
			case 1:
//				performSegue(withIdentifier: "", sender: self)
				print(1)
			case 2:
//				performSegue(withIdentifier: "", sender: self)
				print(2)
			default:
				print("Error: The cell was not recongnized")
			}
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var cell: UITableViewCell
		if(indexPath.section == 0) {
			cell = tableView.dequeueReusableCell(withIdentifier: "DashboardCell")!
		}
		else {
			cell = tableView.dequeueReusableCell(withIdentifier: "ActionCell")!
			var title: String
			var subtitle: String
			var image: UIImage
			var colors: [CGColor]
			
			switch indexPath.row {
			case 0:
				title = "سجل المخالطة"
				subtitle = "من هنا يمكنك مراجعة تاريخ المخالطة حتى ١٤ يوماً سابقة"
				image = UIImage(systemName: "person.3")!
				colors = [UIColor(red: 1.00, green: 0.78, blue: 0.31, alpha: 1.00).cgColor,
							  UIColor(red: 1.00, green: 0.87, blue: 0.66, alpha: 1.00).cgColor]
				(cell as! ActionCell).setUpButton(titleString: title, subtitle: subtitle, image: image, colors: colors)
			case 1:
				title = "مؤقت العزل الصحي"
				subtitle = "من هنا يمكنك جمع عروض وخصومات بإستبدالها بالوقت المقضي في منزلك"
				image = UIImage(systemName: "clock")!
				colors = [UIColor(red: 0.63, green: 0.77, blue: 0.99, alpha: 1.00).cgColor,
						  UIColor(red: 0.76, green: 0.91, blue: 0.98, alpha: 1.00).cgColor]
				(cell as! ActionCell).setUpButton(titleString: title, subtitle: subtitle, image: image, colors: colors)
			default:
				title = "تواصل مع 937"
				subtitle = "من هنا اتصل او احجز موعد ليتم الإتصال بك لاحقاً من وزارة الصحة"
				image = UIImage(systemName: "phone.circle")!
				colors = [UIColor(red: 0.56, green: 0.83, blue: 0.96, alpha: 1.00).cgColor,
						  UIColor(red: 0.52, green: 0.98, blue: 0.69, alpha: 1.00).cgColor]
				(cell as! ActionCell).setUpButton(titleString: title, subtitle: subtitle, image: image, colors: colors)
			}
		}
		cell.backgroundColor = .systemGroupedBackground
		cell.selectionStyle = .none
		return cell
	}
}

