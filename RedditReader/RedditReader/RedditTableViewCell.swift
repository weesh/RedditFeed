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
        titleLabel.preferredMaxLayoutWidth = UIScreen.main.bounds.width
        titleLabel.lineBreakMode = .byTruncatingTail
        titleLabel.baselineAdjustment = .alignBaselines
        titleLabel.adjustsFontSizeToFitWidth = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.frame = CGRect(x: 0, y: 0,width: frame.width, height:21)
//        titleLabel.layer.borderWidth = 1
//        titleLabel.layer.borderColor = UIColor.red.cgColor
        contentView.addSubview(titleLabel)
        
        theImage.translatesAutoresizingMaskIntoConstraints = false
        theImage.clipsToBounds = true
        theImage.contentMode = .scaleAspectFit
        theImage.frame = CGRect(x: 0, y: 0,width: frame.width, height:153)
//        theImage.layer.borderWidth = 1
//        theImage.layer.borderColor = UIColor.red.cgColor
        contentView.addSubview(theImage)

        numComments.lineBreakMode = .byTruncatingTail
        numComments.baselineAdjustment = .alignBaselines
        numComments.adjustsFontSizeToFitWidth = false
        numComments.translatesAutoresizingMaskIntoConstraints = false
        numComments.frame = CGRect(x: 0, y: 0,width: frame.width, height:21)
//        numComments.layer.borderWidth = 1
//        numComments.layer.borderColor = UIColor.red.cgColor
        contentView.addSubview(numComments)

        score.lineBreakMode = .byTruncatingTail
        score.baselineAdjustment = .alignBaselines
        score.adjustsFontSizeToFitWidth = false
        score.translatesAutoresizingMaskIntoConstraints = false
        score.frame = CGRect(x: 0, y: 0,width: frame.width, height:21)
//        score.layer.borderWidth = 1
//        score.layer.borderColor = UIColor.red.cgColor
        contentView.addSubview(score)
        
        let views: [String: Any] = [
            "titleLabel": titleLabel,
            "theImage": theImage,
            "numComments": numComments,
            "score": score]

        var allConstraints: [NSLayoutConstraint] = []
        allConstraints += NSLayoutConstraint.constraints(
          withVisualFormat: "V:|-5-[titleLabel]",
          metrics: nil,
          views: views)
        allConstraints += NSLayoutConstraint.constraints(
          withVisualFormat: "V:[titleLabel]-10-[theImage]",
          metrics: nil,
          views: views)
        allConstraints += NSLayoutConstraint.constraints(
          withVisualFormat: "V:[theImage]-10-[numComments]",
          metrics: nil,
          views: views)
        allConstraints += NSLayoutConstraint.constraints(
          withVisualFormat: "V:[numComments]-10-[score]",
          metrics: nil,
          views: views)

        NSLayoutConstraint.activate(allConstraints)
        
    }

    required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
}
