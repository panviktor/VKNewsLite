//
//  NewsfeedPresenter.swift
//  VKNewsLite
//
//  Created by Виктор on 24.03.2020.
//  Copyright (c) 2020 SwiftViktor. All rights reserved.
//

import UIKit

protocol NewsfeedPresentationLogic {
    func presentData(response: Newsfeed.Model.Response.ResponseType)
}

class NewsfeedPresenter: NewsfeedPresentationLogic {
    weak var viewController: NewsfeedDisplayLogic?
    
    func presentData(response: Newsfeed.Model.Response.ResponseType) {
        switch response {
        case .some:
            print(".some Presenter")
        case .presentNewsfeed:
            print(".presentNewsfeed Presenter")
            viewController?.displayData(viewModel: .displayNewsfeed)
        }
    }
}
