import UIKit

class ViewController: UIViewController {
    var slider: HorizontalItemList!//上面list栏
    var menuIsOpen = false //flag
    var items = [5, 6, 7]
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var buttonMenu: UIButton!
    @IBOutlet var titleLabel: UILabel!
    
    @IBAction func toggleMenu(_ sender: AnyObject) {
        menuIsOpen = !menuIsOpen
        
    }
    
    func showItem(_ index: Int) {
        //用代码创建一个imageview（分析项目需求之后，发现不能在storyboard上直接拉imageview，只能动态创建）
        let imageView = UIImageView(image: UIImage(named: "summericons_100px_0\(index).png"))
        imageView.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5)
        imageView.layer.cornerRadius = 5.0//设置圆角属性需要加layer
        //用代码写的控件，默认情况下xcode会帮我们推断出约束，我们要自定义约束，所以定为false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)//在根视图上加子视图
        
        
    }
    
    
}

//////////////////////////////////////
//
//   初始时代码--有些时学过的，可以顺带复习一下，没有学过的了解一下就行了
//
//////////////////////////////////////

let itemTitles = ["买冰激凌的钱", "好天气", "沙滩球", "男式泳衣", "女式泳衣", "沙滩游戏", "冲浪板", "鸡尾酒", "太阳镜", "人字拖"]

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    //配置上面的list栏（了解）
    func makeSlider() {
        slider = HorizontalItemList(inView: view)
        slider.didSelectItem = {index in
            self.items.append(index)
            self.tableView.reloadData()
            self.toggleMenu(self)
        }
        titleLabel.superview?.addSubview(slider)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeSlider()
        tableView.rowHeight = 54.0//此项也可以在storyboard上设
    }
    
    //配置tableview的数据
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        cell.accessoryType = .none
        cell.textLabel?.text = itemTitles[items[indexPath.row]]
        cell.imageView?.image = UIImage(named: "summericons_100px_0\(items[indexPath.row]).png")
        return cell
    }
    //用户点击单元格（cell）之后要做的
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showItem(items[indexPath.row])
    }
    
}
