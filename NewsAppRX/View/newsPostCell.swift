//
//  newsPostCell.swift
//  NewsAppRX
//
//  Created by Yadilsa Diaz on 9/26/21.
//

import UIKit

class newsPostCell: UITableViewCell {
    @IBOutlet weak var postContainer: UIView!
    @IBOutlet weak var authorTextField: UILabel!
    @IBOutlet weak var postTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        postContainer.layer.cornerRadius = self.postContainer.frame.height / 8
        // Initialization code
    }
    
    
    func updateCell(post: Post) {
        self.authorTextField.text = post.author
        self.postTitleLabel.text = post.title
    }

    
}
