fs = require 'fs'
cson = require 'cson'
p = console.log

build = (params, callback) ->

	cson.parseFile "templates/shared.cson", (err, obj)->

		p obj

		


task "build", "Build cloudformation templates", build 

	


