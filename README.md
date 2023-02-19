# TodoList - is a task management application, using MVP-architecture.

## Features

- Types of tasks: Task, RegularTask, ImportantTask
- Types of taskManagers: TaskManager, SortedTaskManager
- Repositories for TaskManager: TaskRepositoryStub
- Section manager: SectionForTaskManagerAdapter

- In the application there are two types of tasks RegularTask with a title and a state and ImportantTask with a deadline.
- You can use a default TaskManager or SortedTaskManager, or you can implement your, using the ITaskManager protocol, and using the decorator pattern.
- Using the ITaskRepository protocol (pattern) you can substitute the task list in TaskManager.
- You can use SectionForTaskManagerAdapter to manipulate tableview sections, or implement your section vision using ISectionForTaskManagerAdapter.

## Default Configuration
```Swift
let rootVC = TodoListViewController()
let taskManager: ITaskManager = SortedTaskManager(taskManager: TaskManager())
let adapter: ISectionForTaskManagerAdapter = SectionForTaskManagerAdapter(taskManager: taskManager)
let repository: ITaskRepository = TaskRepositoryStub()
taskManager.addTasks(repository.getAllTasks())
let presenter: ITodoListPresenter = TodoListPresenter(view: rootVC, adapter: adapter)
rootVC.presenter = presenter
```
