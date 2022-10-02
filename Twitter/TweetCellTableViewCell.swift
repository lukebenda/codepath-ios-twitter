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
    @IBOutlet weak var favButtton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if(toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(_isFavorited: true)
            }, failure: { (error) in
                print("Favorite did not succeed: \(error)")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(_isFavorited: false)
            }, failure: {(error) in
                print("Unfavorite did not not succeed: \(error)")
            })
        }
    }
    
    @IBAction func retweet(_ sender: Any) {
        
    }
    
    var favorited:Bool = false
    var tweetId:Int = -1
    
    func setFavorite(_isFavorited:Bool) {
        favorited = _isFavorited
        if (favorited) {
            favButtton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else {
            favButtton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
