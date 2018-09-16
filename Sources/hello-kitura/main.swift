import Kitura
import HeliumLogger
import LoggerAPI

HeliumLogger.use()

struct Pokemon: Codable {
  let name: String
}

// Create a new router
let router = Router()

router.get("pokemon/:name") { request, response, next in
  
  guard let name = request.parameters["name"] else {
    try response.status(.badRequest).end()
    return
  }
  
  response.send("The Pokemon name is \(name)")
}

// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: 8090, with: router)

// Start the Kitura runloop (this call never returns)
Kitura.run()
