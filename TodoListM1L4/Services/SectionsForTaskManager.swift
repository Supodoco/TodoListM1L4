//
//  SectionsForTaskmanager.swift
//  TodoListM1L4
//
//  Created by Supodoco on 17.02.2023.
//

import Foundation
/// Протокол для Адаптера позволяющий управлять секциями.
protocol ISectionForTaskManagerAdapter {
	/// Возвращает заголовки для секций
	func getHeadersForSections() -> [String]
	/// Возвращает список задач для конкретной секций, по индексу секции.
	func getTasksForSections(sectionIndex: Int) -> [Task]
}
class SectionForTaskManagerAdapter: ISectionForTaskManagerAdapter {
	let taskManager: ITaskManager
	
	init(taskManager: ITaskManager) {
		self.taskManager = taskManager
	}
	func getHeadersForSections() -> [String] {
		["Comleted Tasks", "Uncompleted Tasks"]
	}
	func getTasksForSections(sectionIndex: Int) -> [Task] {
		switch sectionIndex {
		case 1: return taskManager.getUnDoneTasks()
		default: return taskManager.getCompletedTasks()
		}
	}
}
