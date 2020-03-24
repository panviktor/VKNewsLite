//
//  FeedViewController.swift
//  VKNewsLite
//
//  Created by Виктор on 24.03.2020.
//  Copyright © 2020 SwiftViktor. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        fetcher.getFeed { (feedResponse) in
            guard let feedResponse = feedResponse else { return }
            feedResponse.items.map({ feedItem in
                print(feedItem.date)
            })
        }
    }
}
