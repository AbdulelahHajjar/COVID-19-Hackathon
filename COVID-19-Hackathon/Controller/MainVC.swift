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
	var screenHeight: CGFloat?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		screenHeight = UIScreen.main.fixedCoordinateSpace.bounds.height - self.navigationController!.navigationBar.frame.size.height - 120
		tableView.rowHeight = UITableView.automaticDimension
		title = "مساء الخير، عبدالإله!"
		navigationController?.title = "الرئيسية"
		navigationController?.navigationBar.subviews[1].semanticContentAttribute = .forceRightToLeft
		tableView.register(UINib(nibName: "DashboardCell", bundle: nil), forCellReuseIdentifier: "DashboardCell")
		tableView.register(UINib(nibName: "ActionCell", bundle: nil), forCellReuseIdentifier: "ActionCell")
		conformTableViewDelegates()
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		print("here")
		var rowHeight: CGFloat
		indexPath.row == 0 && indexPath.section == 0 ? (rowHeight = CGFloat(screenHeight! / 2.1)) : (rowHeight = CGFloat(screenHeight! / 6.5))
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
			switch indexPath.row {
			case 0:
				(cell as! ActionCell).setUpButton(action: ActionModel.history)
			case 1:
				(cell as! ActionCell).setUpButton(action: ActionModel.timer)
			default:
				(cell as! ActionCell).setUpButton(action: ActionModel.call937)
			}
		}
		cell.backgroundColor = .systemGroupedBackground
		cell.selectionStyle = .none
		return cell
	}
}

