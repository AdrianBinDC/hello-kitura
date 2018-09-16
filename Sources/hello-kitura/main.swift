import Kitura
import HeliumLogger
import LoggerAPI

HeliumLogger.use()

struct Pokemon: Codable {
  let name: String
}

// Create a new router
let router = Router()

router.post("hello") { request, response, _ in
  
}

router.get("pokemons") { request, response, next in
  let pokemons: [Pokemon] = [
    Pokemon(name: "Pikachu"),
    Pokemon(name: "Caterpie")
  ]
  
  response.send(json: pokemons)
  
  next()
}

// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: 8090, with: router)

// Start the Kitura runloop (this call never returns)
Kitura.run()
