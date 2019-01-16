//
//  Network.swift
//  FleetWit
//
//  Created by Ethan Keiser on 1/16/19.
//  Copyright © 2019 Ethan Keiser. All rights reserved.
//

import Foundation

class Network
{
    let urlSession = URLSession(configuration: .default)

    func getTop(urlString: String,body: Data?, success:@escaping ([Item]) -> (), failure:@escaping (HTTPURLResponse, Error?) -> ())
    {
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "Get"
        request.httpBody = body
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")

        let task = urlSession.dataTask(with: request)
        { (data, response, error) in
            
            guard let httpResponse = response as? HTTPURLResponse, let data = data else {
             return
            }
            
             if(error != nil)
             {
                failure(httpResponse, error)
             }
             else
             {
                let decoder = JSONDecoder()
                let generic = try! decoder.decode(GenericDataType.self, from: data)
                let items = generic.listing!.children.map{$0.item as! Item}
                OperationQueue.main.addOperation{
                    success(items)
                }
            }
        }
        task.resume()
    }
}
