//
//  ViewController.swift
//  NewsAppRX
//
//  Created by Yadilsa Diaz on 9/26/21.
//

import UIKit
import Combine

class homeVC: UIViewController {
    
    @IBOutlet weak var newsTableView: UITableView!
    
    private var posts = [Post]()
    var service = NewsService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        service.delegate = self
        service.getNewsData()
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

extension homeVC: NewsDelegate {
    func didReceiveNewsData(post: [Post]) {
        DispatchQueue.main.async {
            self.posts = post
            self.newsTableView.reloadData()
        }
    }
    
    
}



