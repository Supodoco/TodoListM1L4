//
//  TodoListConfigurator.swift
//  TodoListM1L4
//
//  Created by Supodoco on 18.02.2023.
//

import UIKit

protocol IConfigurator {
	/// Метод отвечает за сборку модуля.
	func configure() -> UIViewController
}

class TodoListConfigurator: IConfigurator {
	func configure() -> UIViewController {
		let rootVC = TodoListViewController()
		let taskManager: ITaskManager = SortedTaskManager(taskManager: TaskManager())
		let adapter: ISectionForTaskManagerAdapter = SectionForTaskManagerAdapter(taskManager: taskManager)
		let repository: ITaskRepository = TaskRepositoryStub()
		taskManager.addTasks(repository.getAllTasks())
		let presenter: ITodoListPresenter = TodoListPresenter(view: rootVC, adapter: adapter)
		rootVC.presenter = presenter
		return rootVC
	}
}
