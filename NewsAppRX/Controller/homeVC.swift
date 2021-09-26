//
//  ViewController.swift
//  NewsAppRX
//
//  Created by Yadilsa Diaz on 9/26/21.
//

import UIKit

class homeVC: UIViewController {
    
    @IBOutlet weak var newsTableView: UITableView!
    
    private var posts = [
        Post(title: "Checnking in on Vick", auhtor: "Berkat", url: "https://google.com"),
        Post(title: "Walking to the ravens", auhtor: "Brandon", url: "https://nfl.com")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        newsTableView.register(UINib(nibName: K.tableCellsandXibs.newsCell, bundle: nil), forCellReuseIdentifier: K.tableCellsandXibs.newsCell)
    }


}



extension homeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        guard let postCell = newsTableView.dequeueReusableCell(withIdentifier: K.tableCellsandXibs.newsCell, for: indexPath) as? newsPostCell else {return UITableViewCell()}
        postCell.updateCell(post: post)
        return postCell
    }
    
    
}



