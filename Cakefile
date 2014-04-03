fs = require 'fs'
cson = require 'cson'
async = require 'async'
path = require 'path'
extend = require 'extend'
jsonfile = require 'jsonfile'
rm = require 'remove'
glob = require 'glob'

# global variables
p = console.log
templateDir = path.resolve __dirname, "templates"
cfTemplateDir = path.resolve __dirname, "output"


###
#   UTILITY FUNCTIONS
###
writeCfTemplate = (templatePath, data, callback)->

  # write the cf template as needed
  write = ->
    jsonfile.writeFile templatePath, data, (err)->
      return callback err if err
      callback null
    
  # check if the directory exists
  fs.exists cfTemplateDir, (exists)->
    if not exists
      fs.mkdir cfTemplateDir, (err)->
        return callback err if err
        do write
    else
      fs.stat cfTemplateDir, (err, stat)->
        if stat.isDirectory
          do write

extendObject = (baseObj, obj)->

  newObj = {}
  extend true, newObj, baseObj, obj
  for key of newObj
    if obj[key] and obj[key]["extend"] and baseObj[key]
      newKey = {}
      extend true, newObj[key], obj[key], baseObj[key]
      delete newObj[key]["extend"]

  # delete the require key
  if newObj["require"]
    delete newObj["require"]

  return newObj

# buildTemplate "path.cson", (err, results) ->
buildTemplate = (templatePath, callback)->

  # generate output path
  cfTemplatePath = path.resolve cfTemplateDir, path.basename(templatePath).replace ".ctemplate", ".template"

  # parse template
  fs.readFile templatePath, "utf-8", (err, data)->

    return callback err if err
    cson.parse data, (err, obj)->

      return callback(err) if err
      return callback() if not obj
      
      # add in ability to require an array of files if necessary
      if obj.require
        templatePath = obj.require
        # check if its a relative path
        if templatePath[0] != "/"
          templatePath = path.resolve(templateDir, templatePath)

        fs.exists templatePath, (exists)->

          return callback Error("Requirement missing") if not exists
        
          cson.parseFile templatePath, (err, baseObj)->

            obj = extendObject baseObj, obj
            
            writeCfTemplate cfTemplatePath, obj, callback

      # no requires to be handled
      else
        writeCfTemplate cfTemplatePath, obj, callback

###
#   TASK DECLARATIONS
###

task "build", "Build cloudformation templates", ->

  glob "#{templateDir}/*.ctemplate" , (err, filenames)->
    return callback(err) if err
    async.each filenames, buildTemplate, (err)->  
      return p(err) if err
      p "Build successful"

task "clean", "Clean directory", ->

  rm cfTemplateDir, (err)->


