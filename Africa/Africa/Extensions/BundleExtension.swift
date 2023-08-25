//
//  BundleExtension.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 11/08/23.
//

import Foundation

extension Bundle {
    
    /// Find and decode a specific json file
    func decode<T: Codable>(_ file: String, completionHandler: @escaping (MockResponse<T>) -> Void)  {
        // 1: Find the JSON file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            completionHandler(.failure(message: "Failed to locate \(file) in bundle."))
            return
        }
        
        // 2: Store the data from JSON in a variable
        guard let data = try? Data(contentsOf: url) else {
            completionHandler(.failure(message: "Failed to load \(file) from bundle."))
            return
        }
        
        // 3: Create a decoder
        let decoder = JSONDecoder()
        
        // 4: Create a variable to store the decoded data
        guard let response = try? decoder.decode(T.self, from: data) else {
            completionHandler(.failure(message: "Failed to decode \(file) from bundle."))
            return
        }
        
        // 5: Return the expected data in the completionHandler function
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // wait one second to simulate API call
            completionHandler(.success(response: response))
        }
    }
}
