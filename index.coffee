Hapi = require 'hapi'

server = Hapi.createServer '0.0.0.0', '1111'

server.route
   method: 'POST'
   path: '/'
   config:
      handler:
         proxy:
            passThrough: true
            mapUri: (request, callback) ->
               console.log  request.payload.number
               console.log request.url.search
               console.log request.method
               callback null, 'http://accounts.is.dev.bluekite.com/v1/services/is/vodafone/accounts?token=1'

server.route
   method: 'POST'
   path: '/v2'
   config:
      handler: (request, reply) ->
         console.log request.method
         reply request.payload.number

server.start ->
   console.log 'Server started at ' + server.info.uri
