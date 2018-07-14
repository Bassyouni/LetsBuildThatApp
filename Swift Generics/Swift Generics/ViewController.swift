//
//  ViewController.swift
//  Swift Generics
//
//  Created by MacBook Pro on 7/14/18.
//  Copyright © 2018 Bassyouni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        fetchGenericData(urlString: "https://api.letsbuildthatapp.com/youtube/home_feed") { (homeFeed: HomeFeed) in
            homeFeed.videos.forEach({print($0.name)})
        }
    
        fetchGenericData(urlString: "https://api.letsbuildthatapp.com/youtube/course_detail?id=1") { (courseDetails: [CourseDetail]) in
            courseDetails.forEach({print($0.name, $0.duration) })
        }
    }

    fileprivate func fetchGenericData<T: Decodable>(urlString: String ,complition: @escaping (T) -> ())
    {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, resp, err) in
            
            guard let data = data else { return }
            
            do
            {
                let obj = try JSONDecoder().decode(T.self, from: data)
                complition(obj)
            }
            catch let jsonErr
            {
                print("failed to decode json:", jsonErr)
            }
            
        }.resume()
    }

}

struct CourseDetail: Decodable
{
    let name: String
    let duration: String
}

struct HomeFeed: Decodable
{
    let videos: [Video]
}

struct Video: Decodable
{
    let id: Int
    let name: String
}

