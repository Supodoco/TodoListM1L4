//
//  Repository.swift
//  TodoListM1L4
//
//  Created by Supodoco on 17.02.2023.
//

import Foundation

/// Протокол Репозитория.
protocol ITaskRepository {
	/// Метод возвращающий список задач.
	func getAllTasks() -> [Task]
}

/// Дефолтный репозиторий.
class TaskRepositoryStub: ITaskRepository {
	func getAllTasks() -> [Task] {
		[
			ImportantTask(title: "go to shop", completed: false, priority: .high),
			RegularTask(title: "do homework", completed: true),
			ImportantTask(title: "watch Avatar 2", completed: false, priority: .low),
			RegularTask(title: "learn Spanish", completed: false),
			ImportantTask(title: "watch TV", completed: true, priority: .medium)
		]
	}
}
