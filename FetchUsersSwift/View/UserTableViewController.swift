//
//  UserTableViewController.swift
//  FetchUsersSwift
//
//  Created by Payal Kandlur on 10/16/24.
//

import UIKit

class UserTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let viewModel = UserViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
        
        Task {
            await viewModel.fetchUsers()
            tableView.reloadData()
        }
    }

}

extension UserTableViewController: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as? UserTableViewCell
        else { return UITableViewCell() }
        cell.fistnameLbl.text = viewModel.user[indexPath.row].firstName
        cell.emailLbl.text = viewModel.user[indexPath.row].email
        return cell
    }
}
