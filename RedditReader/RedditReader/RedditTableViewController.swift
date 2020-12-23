//
//  RedditTableViewController.swift.swift
//  RedditReader
//
//  Created by Kenneth Wieschhoff on 12/21/20.
//

import UIKit

class RedditTableViewController: UITableViewController {

    var allData: Entry?
    var entries = [Children]()
    var nextBatch: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RedditTableViewCell.self, forCellReuseIdentifier: "Cell")
        fetchBatch()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        
        tableView.reloadData()
    }
    
    private func fetchBatch() {
        let urlString = "http://www.reddit.com/.json" + (nextBatch.isEmpty ? "" : "?after=" + nextBatch)
        if let url = URL(string: urlString) {
            do {
                let contents = try String(contentsOf: url)
                let jsonData = contents.data(using: .utf8)!
                allData = try! JSONDecoder().decode(Entry.self, from: jsonData)
                entries.append(contentsOf: allData?.data?.children ?? [Children]())
                nextBatch = allData?.data?.after ?? ""
            } catch {
                // contents could not be loaded
            }
        } else {
            // the URL was bad!
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let child = entries[indexPath.row].data
        let cell:RedditTableViewCell? = tableView.dequeueReusableCell( withIdentifier: "Cell" )
            as? RedditTableViewCell
        
        cell?.titleLabel.text = child?.title
        cell?.numComments.text = "Number of comments: \(child?.num_comments ?? 0)"
        cell?.score.text = "Score: \(child?.score ?? 0)"
        if let url = URL(string: (child?.thumbnail)!) {
            let data = try? Data(contentsOf: url)
            cell?.theImage.image = data == nil ? UIImage(imageLiteralResourceName: "emptyPicture") : UIImage(data: data!)
        } else {
            cell?.theImage.image = UIImage(imageLiteralResourceName: "emptyPicture")
        }

        if cell == nil {
            let newCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "NewCell" )
            newCell.textLabel?.text = child?.title
            return newCell
        }
        return cell!
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)) {
            fetchBatch()
            tableView.reloadData()
        }
    }
}
