//
//  TodoListViewModel.swift
//  TodoListM1L4
//
//  Created by Supodoco on 18.02.2023.
//

import UIKit

protocol ICellViewData {
	/// Заголовок для задачи.
	var title: NSAttributedString { get }
	
	/// Подзаголовок для задачи.
	var secondaryTitle: String? { get }
	
	/// Возвращает розовый цвет, если задача просрочена или черный если нет.
	var textColor: UIColor { get }
}

struct TodoListCellViewData: ICellViewData {
	private var task: Task
	var title: NSAttributedString {
		guard let task = task as? ImportantTask
		else { return NSAttributedString(string: task.title) }
		
		let text = task.priority.description + " " + task.title
		let priorityText = task.priority.description
		
		let range = (text as NSString).range(of: priorityText)
		let mutableAttributedString = NSMutableAttributedString(string: text)
		mutableAttributedString.addAttribute(.foregroundColor, value: UIColor.red, range: range)
		return mutableAttributedString
	}
	var secondaryTitle: String? {
		guard let task = task as? ImportantTask else { return nil }
		return "Deadline: " + task.deadLineTime.formatted()
	}
	var textColor: UIColor {
		guard let task = task as? ImportantTask else { return .black }
		return task.deadLineTime < Date() ? .systemPink : .black
	}
	init(task: Task) {
		self.task = task
	}
}
