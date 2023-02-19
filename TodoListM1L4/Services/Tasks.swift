//
//  Tasks.swift
//  TodoListM1L4
//
//  Created by Supodoco on 11.02.2023.
//

import Foundation

/// Дефолтная задача.
class Task: CustomStringConvertible {
	/// Заголовок задачи.
	var title: String
	
	/// Флаг обозначающий состояние задачи выполнено или не выполнено.
	var completed: Bool
	
	init(title: String, completed: Bool) {
		self.title = title
		self.completed = completed
	}
	/// Краткое описание задачи.
	var description: String {
		"Task: \(title), isDone: \(completed ? "Done" : "Undone")"
	}
}


/// Важная задача с параметром приоритета важности выполнения.
final class ImportantTask: Task {
	
	/// Перечисление позволяющее выбрать приоритет задачи.
	enum TaskPriority {
		case low
		case medium
		case high
	}
	/// Приоритет задачи.
	var priority: TaskPriority
	
	
	/// Время к которому необходимо выполнить задачу.
	var deadLineTime: Date {
		switch priority {
		case .low: return Date() + 3 * oneDayTime
		case .medium: return Date() + 2 * oneDayTime
		case .high: return Date() + oneDayTime
		}
	}
	override var description: String {
		super.description + ", priority: \(priority), deadline: \(deadLineTime)"
	}
	
	private var oneDayTime: TimeInterval = 60*60*24
	
	init(title: String, completed: Bool, priority: TaskPriority) {
		self.priority = priority
		super.init(title: title, completed: completed)
	}
}

final class RegularTask: Task { }

extension ImportantTask.TaskPriority: CustomStringConvertible {
	
	/// Возвращает строку, в зависимости от приоритета.
	var description: String {
		switch self {
		case .low: return "!"
		case .medium: return "!!"
		case .high: return "!!!"
		}
	}
}
