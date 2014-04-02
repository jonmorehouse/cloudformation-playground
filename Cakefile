fs = require 'fs'
cson = require 'cson'
async = require 'async'
path = require 'path'
extend = require 'extend'
jsonfile = require 'jsonfile'
rm = require 'remove'

# global variables
p = console.log
templateDir = path.resolve __dirname, "templates"
cfTemplateDir = path.resolve __dirname, "output"

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


# buildTemplate "path.cson", (err, results) ->
buildTemplate = (filename, callback)->

  templatePath = path.resolve templateDir, filename 
  cfTemplatePath = path.resolve cfTemplateDir, filename.replace ".cson", ".template"
  cson.parseFile templatePath, (err, obj)->

    return callback(err) if err
    return callback() if not obj

    # add in ability to require an array of files if necessary
    if obj.require
      templatePath = obj.require
      # check if its a relative path
      if templatePath[0] != "/"
        templatePath = path.resolve(templateDir, templatePath)
      
      cson.parseFile templatePath, (err, baseObj)->
        extend baseObj, obj
        obj = baseObj
        delete obj['require']
        writeCfTemplate cfTemplatePath, obj, callback

    # no requires to be handled
    else
      writeCfTemplate cfTemplatePath, obj, callback

# task declarations 
task "build", "Build cloudformation templates", ->

  fs.readdir templateDir, (err, filenames)->

    return callback(err) if err

    async.each filenames, buildTemplate, (err)->  

task "clean", "Clean directory", ->

  rm cfTemplateDir, (err)->



