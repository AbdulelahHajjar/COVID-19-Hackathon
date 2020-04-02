//
//  ActionModel.swift
//  COVID-19-Hackathon
//
//  Created by Abdulelah Hajjar on 02/04/2020.
//  Copyright © 2020 Squadra. All rights reserved.
//

import Foundation

struct ActionModel {
	static let history = Action(title: "سجل المخالطة", subtitle: "من هنا يمكنك مراجعة تاريخ المخالطة حتى ١٤ يوماً سابقة", color1: "a81616", color2: "a81616", systemImageStr: "person.3")
	static let timer = Action(title: "مؤقت العزل الصحي", subtitle: "من هنا يمكنك جمع عروض وخصومات بإستبدالها بالوقت المقضي في منزلك", color1: "#a1c4fd", color2: "#c2e9fb", systemImageStr: "clock")
	static let call937 = Action(title: "تواصل مع 937", subtitle: "من هنا اتصل او احجز موعد ليتم الإتصال بك لاحقاً من وزارة الصحة", color1: "#84fab0", color2: "#8fd3f4", systemImageStr: "phone.circle")
}
