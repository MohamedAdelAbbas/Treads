//
//  RunLogVC.swift
//  Treads
//
//  Created by Mohamed Adel on 5/29/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//

import UIKit

class RunLogVC: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var logTableView: UITableView!
    // MARK: Properties
    
    // MARK: View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
extension RunLogVC: UITableViewDelegate, UITableViewDataSource {
    
     // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Run.getAllRuns()?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RunLogCell") as? RunLogCell {
            guard let run = Run.getAllRuns()?[indexPath.row] else {
                return RunLogCell()
            }
            cell.configure(run: run)
            return cell
        } else {
            return RunLogCell()
        }
    }
}
