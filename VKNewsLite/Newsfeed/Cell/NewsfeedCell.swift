//
//  NewsfeedCell.swift
//  VKNewsLite
//
//  Created by Виктор on 25.03.2020.
//  Copyright © 2020 SwiftViktor. All rights reserved.
//

import UIKit

protocol FeedCellViewModel {
    var iconUrlString: String { get }
    var name: String { get }
    var date: String { get }
    var text: String? { get }
    var likes: String? { get }
    var comments: String? { get }
    var shares: String? { get }
    var views: String? { get }
    var photoAttachement: FeedCellPhotoAttachementViewModel? { get }
    var sizes: FeedCellSizes { get }
}

protocol FeedCellSizes {
    var postLabelFrame: CGRect { get }
    var attachmentFrame: CGRect { get }
    var bottomViewFrame: CGRect { get }
    var totalHeight: CGFloat { get }
}

protocol FeedCellPhotoAttachementViewModel {
    var photoUrlString: String? { get }
    var width: Int { get }
    var height: Int { get }
}

class NewsfeedCell: UITableViewCell {
    
    static let reuseId = "NewsfeedCell"
    
    @IBOutlet var cardView: UIView!
    @IBOutlet var iconImageView: WebImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var likesLabel: UILabel!
    @IBOutlet var postImageView: WebImageView!
    @IBOutlet var postLabel: UILabel!
    @IBOutlet var commentsLabel: UILabel!
    @IBOutlet var sharesLabel: UILabel!
    @IBOutlet var viewsLabel: UILabel!
    @IBOutlet var bottomView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconImageView.layer.cornerRadius = iconImageView.frame.width / 2
        iconImageView.clipsToBounds = true
        
        cardView.layer.cornerRadius = 10
        cardView.clipsToBounds = true
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    override func prepareForReuse() {
        iconImageView.set(imageURL: nil)
        postImageView.set(imageURL: nil)
    }
    
    func set(viewModel: FeedCellViewModel) {
        iconImageView.set(imageURL: viewModel.iconUrlString)
        nameLabel.text = viewModel.name
        dateLabel.text = viewModel.date
        postLabel.text = viewModel.text
        likesLabel.text = viewModel.likes
        commentsLabel.text = viewModel.comments
        sharesLabel.text = viewModel.shares
        viewsLabel.text = viewModel.views
        
        postLabel.frame = viewModel.sizes.postLabelFrame
        postImageView.frame = viewModel.sizes.attachmentFrame
        bottomView.frame = viewModel.sizes.bottomViewFrame
        
        if let photoAttachment = viewModel.photoAttachement {
            postImageView.set(imageURL: photoAttachment.photoUrlString)
            postImageView.isHidden = false
        } else {
            postImageView.isHidden = true
        }
    }
}
