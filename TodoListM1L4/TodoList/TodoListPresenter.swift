//
//  TodoListPresenter.swift
//  TodoListM1L4
//
//  Created by Supodoco on 17.02.2023.
//

import Foundation

/// Протокол для TodoListPresenter.
protocol ITodoListPresenter {
	/// Возвращает кол-во секций.
	var numberOfSections: Int { get }
	
	/// Возвращает кол-во строк в определенной секции.
	/// - Parameter section: Выбранная секция.
	func numberOfRowsInSection(section: Int) -> Int
	
	/// Возвращает заголовки секций.
	func getHeadersForSections() -> [String]
	
	/// Возвращает модель для отображения ячейки.
	func getTaskViewData(_ indexPath: IndexPath) -> ICellViewData
	
	/// Меняет текущее состояние задачи на противоположное.
	func changeStateForTask(indexPath: IndexPath)
	init(view: ITodoListViewController, adapter: ISectionForTaskManagerAdapter)
}

class TodoListPresenter: ITodoListPresenter {
	private weak var view: ITodoListViewController?
	let adapter: ISectionForTaskManagerAdapter
	
	var numberOfSections: Int {
		adapter.getHeadersForSections().count
	}
	
	func getHeadersForSections() -> [String] {
		adapter.getHeadersForSections()
	}
	func numberOfRowsInSection(section: Int) -> Int {
		adapter.getTasksForSections(sectionIndex: section).count
	}
	
	func getTaskViewData(_ indexPath: IndexPath) -> ICellViewData {
		let task = getCurrentTask(indexPath)
		return TodoListCellViewData(task: task)
	}
	func changeStateForTask(indexPath: IndexPath) {
		let task = getCurrentTask(indexPath)
		task.completed.toggle()
	}
	private func getCurrentTask(_ indexPath: IndexPath) -> Task {
		return adapter.getTasksForSections(sectionIndex: indexPath.section)[indexPath.row]
	}
	
	required init(view: ITodoListViewController, adapter: ISectionForTaskManagerAdapter) {
		self.view = view
		self.adapter = adapter
	}
	
}
