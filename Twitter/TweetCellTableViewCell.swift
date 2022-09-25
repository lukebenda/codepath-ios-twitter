// Twitter
// TweetCellTableViewCell.swift
// Created by Lucas Benda on  9/25/22 AT 11:35 AM.
// Copyright © 2022 Dan. All rights reserved.
// Swift version  5.0
// Running on macOS 12.5


import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
