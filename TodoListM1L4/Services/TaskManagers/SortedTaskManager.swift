//
//  SortedTaskManager.swift
//  TodoListM1L4
//
//  Created by Supodoco on 18.02.2023.
//

import Foundation

class SortedTaskManager: ITaskManager {
	var taskManager: ITaskManager
	
	func addTask(task: Task) {
		taskManager.addTask(task: task)
	}
	func addTasks(_ tasks: [Task]) {
		taskManager.addTasks(tasks)
	}
	
	func delete(task: Task) {
		taskManager.delete(task: task)
	}
	
	func getAllTasks() -> [Task] {
		taskManager.getAllTasks()
	}
	
	func getUnDoneTasks() -> [Task] {
		taskManager.getUnDoneTasks().sorted {
			sort(taskOne: $0, taskTwo: $1)
		}
	}
	
	func getCompletedTasks() -> [Task] {
		taskManager.getCompletedTasks().sorted {
			sort(taskOne: $0, taskTwo: $1)
		}
	}
	
	private func sort(taskOne: Task, taskTwo: Task) -> Bool {
		if let taskOne = taskOne as? ImportantTask, let taskTwo = taskTwo as? ImportantTask {
			return taskOne.priority.description > taskTwo.priority.description
		} else if taskOne is RegularTask, taskTwo is ImportantTask {
			return false
		} else if taskOne is ImportantTask, taskTwo is RegularTask {
			return true
		}
		return true
	}
	
	init(taskManager: ITaskManager) {
		self.taskManager = taskManager
	}
}
