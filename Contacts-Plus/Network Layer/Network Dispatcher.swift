//
//  NetworkDispatcher.swift
//  Safety Survey
//
//  Created by Kyle Zawacki on 4/7/17.
//
//

import Foundation

class NetworkDispatcher: Dispatcher {
    
    var configuration: NetworkConfiguration
    private var session: URLSession
    
    required init(configuration: NetworkConfiguration = NetworkConfiguration.shared) {
        self.configuration = configuration
        self.session = URLSession(configuration: URLSessionConfiguration.default)
    }
    
    func execute(request: Request, completionHandler: @escaping ((Response) -> Void)) throws {
        guard NetworkReachability.getStatus() != .notReachable else { NetworkAlert.show(); return }
        
        let urlRequest = try prepareURLRequest(for: request)
        let networkTask = session.dataTask(with: urlRequest) { (data, urlResponse, error) in
            let response = Response(urlResponse: urlResponse as? HTTPURLResponse, data: data, error: error, for: request)
            completionHandler(response)
            LoadingIndicator.hide()
        }
        networkTask.resume()
        LoadingIndicator.show()
    }
    
    private func prepareURLRequest(for request: Request) throws -> URLRequest {
        let urlString = "\(configuration.baseUrl)/\(request.endpoint)"
        var urlRequest = URLRequest(url: URL(string: urlString)!)
        
        if let parameters = request.parameters {
            switch parameters {
            case .body(let params):
                if let params = params {
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: .init(rawValue: 0))
                } else {
                    throw NetworkErrors.badInput
                }
            case .url(let params):
                if let params = params {
                    let query_params = params.map({ (element) -> URLQueryItem in
                        return URLQueryItem(name: element.key, value: "\(element.value)")
                    })
                    guard var components = URLComponents(string: urlString) else {
                        throw NetworkErrors.badInput
                    }
                    components.queryItems = query_params
                    urlRequest.url = components.url
                } else {
                    throw NetworkErrors.badInput
                }
            case .image(let data):
                urlRequest = setMultiFormData(forRequest: urlRequest, withData: data)
            }
        }
        
        configuration.headers.forEach { urlRequest.addValue($0.value, forHTTPHeaderField: $0.key) }
        request.headers?.forEach { urlRequest.addValue($0.value, forHTTPHeaderField: $0.key) }
        
        urlRequest.httpMethod = request.method.rawValue
        
        return urlRequest
    }
    
    private func setMultiFormData(forRequest _urlRequest: URLRequest, withData data: Data) -> URLRequest {
        var urlRequest = _urlRequest

        let boundary = generateBoundaryString()
        
        //define the multipart request type
        
        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        let body = NSMutableData()
        
        let fname = "test.png"
        let mimetype = "image/jpg"
        
        //define the data post parameter
        
        body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
        body.append("Content-Disposition:form-data; name=\"test\"\r\n\r\n".data(using: String.Encoding.utf8)!)
        body.append("hi\r\n".data(using: String.Encoding.utf8)!)
        
        
        body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
        body.append("Content-Disposition:form-data; name=\"file\"; filename=\"\(fname)\"\r\n".data(using: String.Encoding.utf8)!)
        body.append("Content-Type: \(mimetype)\r\n\r\n".data(using: String.Encoding.utf8)!)
        body.append(data as Data)
        body.append("\r\n".data(using: String.Encoding.utf8)!)
        
        body.append("--\(boundary)--\r\n".data(using: String.Encoding.utf8)!)
        
        urlRequest.httpBody = body as Data
        return urlRequest
    }
    
    private func generateBoundaryString() -> String {
        return "Boundary-\(UUID().uuidString)"
    }
}
