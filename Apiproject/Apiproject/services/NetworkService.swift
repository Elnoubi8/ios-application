//
//  NetworkService.swift
//  Apiproject
//
//  Created by Elnoby on 3/30/20.
//  Copyright © 2020 elnoubi. All rights reserved.
//

import Foundation

class NetworkService{
    static let share = NetworkService()
    let URL_BASED = "http://localhost:3003"
    let URL_ADD = "/add"
    let session = URLSession(configuration: .default)
    func getTodos(onSuccess: @escaping (Todos) -> Void, onError: @escaping (String) -> Void) {
        let url = URL(string: "\(URL_BASED)")!
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            DispatchQueue.main.async {
                if let error = error {
                    onError(error.localizedDescription)
                    return
                }
                
                guard let data = data, let response = response as? HTTPURLResponse else {
                    onError("Invalid data or response")
                    return
                }
                
                do {
                    if response.statusCode == 200 {
                        let items = try JSONDecoder().decode(Todos.self, from: data)
                        onSuccess(items)
                    } else {
                        let err = try JSONDecoder().decode(APIError.self, from: data)
                        onError(err.message)
                    }
                }
                catch {
                    onError(error.localizedDescription)
                }
            }
            
        }
        task.resume()
    }
    func addTodo(todo: Todo, onSuccess: @escaping (Todos) -> Void, onError: @escaping (String) -> Void) {
        let url = URL(string: "\(URL_BASED)\(URL_ADD)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            let body = try JSONEncoder().encode(todo)
            request.httpBody = body
            
            let task = session.dataTask(with: request) { (data, response, error) in
                
                DispatchQueue.main.async {
                    if let error = error {
                        onError(error.localizedDescription)
                        return
                    }
                    
                    guard let data = data, let response = response as? HTTPURLResponse else {
                        onError("Invalid data or response")
                        return
                    }
                    
                    do {
                        if response.statusCode == 200 {
                            let items = try JSONDecoder().decode(Todos.self, from: data)
                            onSuccess(items)
                        } else {
                            let err = try JSONDecoder().decode(APIError.self, from: data)
                            onError(err.message)
                        }
                    } catch {
                        onError(error.localizedDescription)
                    }
                }
                
                
            }
            task.resume()
            
        } catch {
            onError(error.localizedDescription)
        }
        
    }
}

