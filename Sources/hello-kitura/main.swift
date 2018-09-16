import Kitura
import HeliumLogger
import LoggerAPI

HeliumLogger.use()

// Create a new router
let router = Router()

router.post("hello") { request, response, _ in
  
}

router.get("hello") { request, response, next in
  let pokemons = [["name":"Pikachu"],["name":"Caterpie"]]
  response.send(json: pokemons)

//  let result = ["status":"ok","message":"Hello World"]
//  let result = ["message":"Hello World"]
//  response.send(json: result)
  next()
}

//router.get("hello") { request, response, next in
//  response.send("HELLO WORLD")
//}

//router.all() { request, response, next in
//  response.send("Hello World")
//  try response.end()
//}

// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: 8090, with: router)

// Start the Kitura runloop (this call never returns)
Kitura.run()
