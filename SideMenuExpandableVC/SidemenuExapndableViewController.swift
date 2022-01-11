//
//  SidemenuExapndableViewController.swift
//  SideMenuExpandableVC
//
//  Created by venu vadla on 30/09/21.
//

import UIKit
struct Section {
    let titles : String
    let options : [String]
    var isOpend : Bool = false
    
    
    init(title : String,
         options: [String],
         isOpend: Bool = false) {
        self.titles = title
        self.options = options
        self.isOpend = isOpend
    }
    
}


class SidemenuExapndableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
   
    private var sections = [Section]()

    override func viewDidLoad() {
        super.viewDidLoad()

        sections = [
            Section(title: "Section 1", options: [1,2,3].compactMap({ return "Cell \($0)"})),
            Section(title: "Section 2", options: [1,2,3].compactMap({ return "Cell \($0)"})),
            Section(title: "Section 3", options: [1,2,3].compactMap({ return "Cell \($0)"})),
            Section(title: "Section 4", options: [1,2,3].compactMap({ return "Cell \($0)"})),]

             
        
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.bounds
    }
    
   
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

    let section = sections[section]
        if section.isOpend {
            return section.options.count + 1
        }else{
            return 1
        }
    
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.row == 0 {
            cell.textLabel?.text = sections[indexPath.section].titles

        }
        else{
            cell.textLabel?.text = sections[indexPath.section].options[indexPath.row - 1]

        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
        
        
        if indexPath.row == 0{
            sections[indexPath.section].isOpend = !sections[indexPath.section].isOpend
            
            tableView.reloadSections([indexPath.section], with:.none)
            
            
        }else {
            print("venu kumar")
        }
        }
    }
