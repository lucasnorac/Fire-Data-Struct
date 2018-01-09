//
//  ViewController.swift
//  Fire Data Struct
//
//  Created by Lucas Caron Albarello on 18/12/17.
//  Copyright © 2017 Lucas Caron Albarello. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController {
    var posts = [Post]()
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        DatabaseService.shared.postRef.observe(DataEventType.value) { (snapshot) in
            print(snapshot)
            guard let postsSnaphot = PostsSnapshot(with: snapshot) else {return}
            self.posts = postsSnaphot.posts
            self.posts.sort(by: {$0.data.compare($1.data) == .orderedDescending})
            self.tableview.reloadData()
        }
    }
    @IBAction func addTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Posta Algo", message: "O que vc gostaria postar?", preferredStyle: .alert)
        alert.addTextField { (text) in
            text.placeholder = "Coloque sua mensagem aqui"
        }
        let cancel = UIAlertAction(title: "Cancela", style: .cancel, handler: nil)
        let post = UIAlertAction(title: "Postagen", style: .default) { _ in
            guard let text = alert.textFields?.first?.text else {return}
            print(text)
            
            let dataString = String(describing: Date())
            let parametres = ["nome": "Lucas Caron", "mensagem" : text, "data":dataString]
            DatabaseService.shared.postRef.childByAutoId().setValue(parametres)
        }
        alert.addAction(cancel)
        alert.addAction(post)
        present(alert, animated: true, completion: nil)
    }
    
}
    extension ViewController: UITableViewDataSource{
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return posts.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
            cell.textLabel?.text = posts[indexPath.row].mensagem
            cell.detailTextLabel?.text = posts[indexPath.row].nome
            return cell
        }
    }


