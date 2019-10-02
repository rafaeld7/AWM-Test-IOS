//
//  BaseDeDatos.swift
//  AWMTest01
//
//  Created by AWM Solutions on 9/25/19.
//  Copyright © 2019 AWM Solutions. All rights reserved.
//

//import UIKit
//import Firebase
//import SwiftyJSON
//
// var posts = [Post]()
//
//class BaseDeDatos: UIViewController {
//    
// var posts = [Post]()
//    
//    @IBOutlet weak var tableView: UITableView!
//   
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
////        DatabaseService.shared.postsReference.observe(DataEventType.value, with: { (snapshot) in
////            print(snapshot)
////             let uid = Auth.auth().currentUser
////            // guard let postsSnapshot = PostSnapshot (with: snapshot) else { return }
////             let snap = JSON(snapshot.value!)
////             print(snap[]["username"])
//////            self.posts = postsSnapshot.posts
//////            self.tableView.reloadData()
//
//     //   })
//    }
//
//    @IBAction func onAddTapped(_ sender: Any) {
//
//        let alert = UIAlertController(title: "Post Something", message: "what would you like to post", preferredStyle: .alert)
//        alert.addTextField { (UITextField) in UITextField.placeholder = "Enter message here"
//        }
//        let cancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
//        let post = UIAlertAction(title: "Post", style: .default) { _ in
//            guard let text = alert.textFields?.first?.text else { return }
//            print(text)
//            //paso02
////
////            //parametros de envios para la base de datos Firebase
////            let dateString = String(describing: Date())
////            let parameters = ["username" : "@rafa",
////                              "message"  :  text,
////                              "date"     : dateString]
////
////          //publicacion en la base de datos
////        DatabaseService.shared.postsReference.childByAutoId().setValue(parameters)
////
//        }
//        alert.addAction(cancel)
//        alert.addAction(post)
//        present(alert, animated: true, completion: nil)
//    }
//}

//extension UIViewController: UITableViewDataSource{
//    public func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 0
//        //posts.count
//    }
//
//    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
//       cell.textLabel?.text =  posts[indexPath.row].message
//       cell.detailTextLabel?.text = posts[indexPath.row].username
//
//        return cell
//    }
//}
//
