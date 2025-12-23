import Foundation

struct APIService {
    static func fetchGames(urlString: String, completion:@escaping(Result<[GameGridItem],APIError>)->Void){
        
        guard let url = URL(string: urlString) else{
            completion(Result.failure(APIError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){
            data, response, error in
            
            if let errorResponse = error {
                completion(Result.failure(APIError.urlSessionError(errorResponse)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(Result.failure(APIError.invalidResponse))
                return
            }
            
            if let dataResponse = data{
                do{
                    let decoded = try JSONDecoder().decode(GameResponse.self, from: dataResponse)
                    completion(Result.success(decoded.results))
                }catch{
                    completion(Result.failure(APIError.decodingFailed(error)))
                }
            } else {
                completion(Result.failure(.noData))
            }
        }
        task.resume()
    }
}
