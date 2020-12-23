//
//  RedditTableViewCell.swift
//  RedditReader
//
//  Created by Kenneth Wieschhoff on 12/21/20.
//

import UIKit

class RedditTableViewCell: UITableViewCell {
    var titleLabel = UILabel()
    var theImage = UIImageView()
    var numComments = UILabel()
    var score = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byTruncatingTail
        titleLabel.baselineAdjustment = .alignBaselines
        titleLabel.adjustsFontSizeToFitWidth = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.frame = CGRect(x: 11, y: 12,width: 394, height:41)
        contentView.addSubview(titleLabel)
        
        theImage.translatesAutoresizingMaskIntoConstraints = false
        theImage.clipsToBounds = true
        theImage.contentMode = .scaleAspectFit
        theImage.frame = CGRect(x: 11, y: 56,width: 188, height:153)
        contentView.addSubview(theImage)

        numComments.lineBreakMode = .byTruncatingTail
        numComments.baselineAdjustment = .alignBaselines
        numComments.adjustsFontSizeToFitWidth = false
        numComments.translatesAutoresizingMaskIntoConstraints = false
        numComments.frame = CGRect(x: 20, y: 217,width: 385, height:21)
        contentView.addSubview(numComments)

        score.lineBreakMode = .byTruncatingTail
        score.baselineAdjustment = .alignBaselines
        score.adjustsFontSizeToFitWidth = false
        score.translatesAutoresizingMaskIntoConstraints = false
        score.frame = CGRect(x: 20, y: 242,width: 385, height:21)
        contentView.addSubview(score)
        
//        let stack = UIStackView(arrangedSubviews: [titleLabel, theImage, numComments,score])
//        contentView.addSubview(stack)
     }

     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
}
