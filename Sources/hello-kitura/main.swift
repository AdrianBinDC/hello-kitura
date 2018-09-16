import Kitura
import HeliumLogger
import LoggerAPI

HeliumLogger.use()

struct Pokemon: Codable {
  let name: String
}

// Create a new router
let router = Router()
router.post(middleware: BodyParser())

router.post("pokemonFE") { request, response, next in
  
  guard let body = request.body,
        let values = body.asURLEncoded,
        let name = values["name"]
    else {
      try response.status(.badRequest).end()
      return
  }
  
  response.send(name)
  next()
}

// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: 8090, with: router)

// Start the Kitura runloop (this call never returns)
Kitura.run()
