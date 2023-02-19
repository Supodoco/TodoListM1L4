//
//  TodoListTableViewController.swift
//  TodoListM1L4
//
//  Created by Supodoco on 11.02.2023.
//

import UIKit
/// Протокол для TodoListViewController.
protocol ITodoListViewController: AnyObject {}

extension TodoListViewController: ITodoListViewController {}

/// Отображает список выполненных и не выполненных задач.
class TodoListViewController: UITableViewController {
	var presenter: ITodoListPresenter!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "TodoList"
		navigationController?.navigationBar.prefersLargeTitles = true
	}
}

// MARK: - Table view data source
extension TodoListViewController {
	override func numberOfSections(in tableView: UITableView) -> Int {
		presenter.numberOfSections
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		presenter.numberOfRowsInSection(section: section)
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell()
		cell.selectionStyle = .none
		
		var content = cell.defaultContentConfiguration()
		let viewData = presenter.getTaskViewData(indexPath)

		content.attributedText = viewData.title
		content.secondaryText = viewData.secondaryTitle
		content.textProperties.color = viewData.textColor
		
		cell.tintColor = indexPath.section == 0 ? .red : .systemGray
		
		content.secondaryTextProperties.font = UIFont.systemFont(ofSize: 16)
		content.textProperties.font = UIFont.boldSystemFont(ofSize: 19)
		cell.accessoryType = .checkmark
		cell.contentConfiguration = content
		
		return cell
	}
	
	override func tableView(
		_ tableView: UITableView,
		titleForHeaderInSection section: Int
	) -> String? {
		presenter.getHeadersForSections()[section]
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		presenter.changeStateForTask(indexPath: indexPath)
		tableView.reloadData()
	}
}
