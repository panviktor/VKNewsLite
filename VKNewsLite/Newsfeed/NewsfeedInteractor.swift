//
//  NewsfeedInteractor.swift
//  VKNewsLite
//
//  Created by Виктор on 24.03.2020.
//  Copyright (c) 2020 SwiftViktor. All rights reserved.
//

import UIKit

protocol NewsfeedBusinessLogic {
    func makeRequest(request: Newsfeed.Model.Request.RequestType)
}

class NewsfeedInteractor: NewsfeedBusinessLogic {

  var presenter: NewsfeedPresentationLogic?
  var service: NewsfeedService?
    
  func makeRequest(request: Newsfeed.Model.Request.RequestType) {
    if service == nil {
      service = NewsfeedService()
    }
    
    switch request {
    case .getNewsfeed:
        service?.getFeed(completion: { [weak self] (revealedPostIds, feed) in
            self?.presenter?.presentData(response: .presentNewsfeed(feed: feed, revealdedPostIds: revealedPostIds))
        })
    case .getUser:
        service?.getUser(completion: { [weak self] (user) in
            self?.presenter?.presentData(response: .presentUserInfo(user: user))
        })
    case .revealPostIds(let postId):
        service?.revealPostIds(forPostId: postId, completion: { [weak self] (revealedPostIds, feed) in
            self?.presenter?.presentData(response: .presentNewsfeed(feed: feed, revealdedPostIds: revealedPostIds))
        })
    case .getNextBatch:
        self.presenter?.presentData(response: .presentFooterLoader)
        service?.getNextBatch(completion: { (revealedPostIds, feed) in
            self.presenter?.presentData(response: .presentNewsfeed(feed: feed, revealdedPostIds: revealedPostIds))
        })
    }
  }
}


