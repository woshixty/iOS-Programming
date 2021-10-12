//
//  TodosController.swift
//  Todos
//
//  Created by 谢庭宇 on 2021/8/24.
//

import UIKit

class TodosController: UITableViewController {
    
    var todos = [
        Todo(name: "敲代码", checked: false),
        Todo(name: "玩滑板", checked: false),
        Todo(name: "看视频", checked: false),
        Todo(name: "聊聊天", checked: false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todo", for: indexPath) as! TodoCell

        // Configure the cell...
//        cell.checkMark.text = "√"
//        cell.todo.text = "谢庭宇记事本"
        cell.todo.text = todos[indexPath.row].name
        //三元运算符
        cell.checkMark.text = todos[indexPath.row ].checked ? "√" : " "
        return cell
    }
    
    //当用户选择了cell之后发生什么事情
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //切换功能常用技巧--取反
        todos[indexPath.row].checked = !todos[indexPath.row].checked
        //改视图view--根据已经改好的model的数据来改变视图中的显示数据
        let cell = tableView.cellForRow(at: indexPath) as! TodoCell
        cell.checkMark.text = todos[indexPath.row].checked ? "√" : " "
        //取消cell的选择状态（将底色去掉）
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "addTodo" {
            let vc = segue.destination as! TodoController
            //3、告诉我们是谁委托我们干活的
            vc.delegate = self
        } else if segue.identifier == "editTodo" {
            let vc = segue.destination as! TodoController
            //sender就是用户点击的那个cell
            let cell = sender as! TodoCell
            //通过cell找indexpath（上面的didEdit方法里面是反的，共同点是都写上一个tableView.你需要的东西）
            let row = tableView.indexPath(for: cell)!.row
            //正向传值
            vc.name = todos[row].name
            vc.delegate = self
        }
    }

}

//1、遵守相关自定义协议
extension TodosController:TodoDelegate {
    func didEdit(name: String) {
        //1、修改数据
        
        //2、更新视图
    }
    
    //2、实现协议里面的方法
    func didAdd(name: String) {
        //添加数据
        todos.append(Todo(name: name, checked: false))
        //更新视图
        let indexPath = IndexPath(row: todos.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    
}
