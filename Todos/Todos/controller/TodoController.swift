//
//  TodoController.swift
//  Todos
//
//  Created by 谢庭宇 on 2021/9/1.
//

import UIKit

protocol TodoDelegate {
    func didAdd(name: String)
    func didEdit(name: String)
}

class TodoController: UITableViewController {
    
    //自定义protocol和delegate来反向传值
    var delegate:TodoDelegate?
    var name:String?
    

    @IBOutlet weak var todoInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //打开本页面时候让光标自动定位到输入框
        todoInput.becomeFirstResponder()
        
        todoInput.text = name
        
        if name != nil {
            //说明是在编辑任务
            navigationItem.title = "编辑任务"
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */
    
    @IBAction func done(_ sender: Any) {
        //判断用户有没有输入为nil的情况 + 用户是否只输入了空格（空字符串的情况）
        if let name = todoInput.text, !name.isEmpty {
            if self.name != nil {
                //说明当前是在编辑任务
                delegate?.didEdit(name: name)
            } else {
                //自定义的protocol和delegate来反向传值
                delegate?.didAdd(name: name)
            }
        }
        //让本页面弹出栈-类似于项目之前的dismiss
        navigationController?.popViewController(animated: true)
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
