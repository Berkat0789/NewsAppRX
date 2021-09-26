//
//  NewsService.swift
//  NewsAppRX
//
//  Created by Yadilsa Diaz on 9/26/21.
//

import Foundation
import RxCocoa
import RxSwift
import Combine



protocol NewsDelegate  {
    func didReceiveNewsData(post: [Post])
}

fileprivate let key = "75e37550551648429666d9cbbe5d3681"


struct NewsService {

    private let bag = DisposeBag()
    var delegate: NewsDelegate?
    
    func getNewsData() {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(key)") else {fatalError("Invalid Error")}
        Observable.just(url).flatMap({ url -> Observable<Data> in
            let request = URLRequest(url: url)
            return URLSession.shared.rx.data(request: request)
        }).map({ data -> Feed in
            return try JSONDecoder().decode(Feed.self, from: data)
        }).subscribe(onNext: { feed in
//            print(feed)
            // Assign posts from feed
            print(feed)
                self.delegate?.didReceiveNewsData(post: feed.articles)
            
        }).disposed(by: bag)
    }
}
