//
//  TaskManager.swift
//  TodoListM1L4
//
//  Created by Supodoco on 11.02.2023.
//

import Foundation
/// Протокол для TaskManager.
protocol ITaskManager {
	/// Метод добавляет одну задачу в список.
	func addTask(task: Task)
	/// Метод удаляет задачу из списка.
	func delete(task: Task)
	/// Метод возвращает все задачи из списка
	func getAllTasks() -> [Task]
	/// Метод возвращает все незавершенные задачи из списка.
	func getUnDoneTasks() -> [Task]
	/// Метод возвращает все завершенные задачи из списка.
	func getCompletedTasks() -> [Task]
	/// Метод добавляет несколько задач в список.
	func addTasks(_ tasks: [Task])
}

class TaskManager {
	private var tasks: [Task] = []
	
	func addTask(task: Task) {
		tasks.append(task)
	}
	func delete(task: Task) {
		tasks.removeAll { $0 === task }
	}
	func getAllTasks() -> [Task] {
		tasks
	}
	func getUnDoneTasks() -> [Task] {
		tasks.filter { !$0.completed }
	}
	func getCompletedTasks() -> [Task] {
		tasks.filter { $0.completed }
	}
}

extension TaskManager: ITaskManager {}

extension TaskManager {
	func addTasks(_ tasks: [Task]) {
		tasks.forEach { self.tasks.append($0) }
	}
}
