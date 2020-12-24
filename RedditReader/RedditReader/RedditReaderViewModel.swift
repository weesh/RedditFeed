//
//  RedditReaderViewModel.swift
//  RedditReader
//
//  Created by Kenneth Wieschhoff on 12/24/20.
//

import Foundation

class RedditReaderViewModel {
    
    var data: Entry?
    var entries = [Children]()
    var nextBatch: String = ""

    func fetchBatch() {
        let urlString = "http://www.reddit.com/.json" + (nextBatch.isEmpty ? "" : "?after=" + nextBatch)
        if let url = URL(string: urlString) {
            do {
                let contents = try String(contentsOf: url)
                let jsonData = contents.data(using: .utf8)!
                data = try! JSONDecoder().decode(Entry.self, from: jsonData)
                entries.append(contentsOf: data?.data?.children ?? [Children]())
                nextBatch = data?.data?.after ?? ""
            } catch {
                // contents could not be loaded
            }
        } else {
            // the URL was bad!
        }
    }
    
    func entryCount() -> Int {
        return entries.count
    }

    func allData() -> Entry? {
        return data
    }
    
    func allEntries() -> [Children] {
        return entries
    }
    
}
