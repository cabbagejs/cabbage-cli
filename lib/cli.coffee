fs = require('fs')
resolve = require('resolve')

module.exports = ->
  switch command()
    when 'new' then require('./commands/new')(mode())
    else deferToFullCabbage()

command = ->
  process.argv[2]

mode = ->
  process.argv[3]

deferToFullCabbage = ->
  try
    cabbagePath = resolve.sync('cabbage', basedir: process.cwd())
    require(cabbagePath).cli()
  catch e
    if e.message.indexOf("Cannot find module 'cabbage'") > -1
      console.error """

        No `cabbage` module found. Are you sure you're running from a project directory with cabbage installed?

        To create a new project, run:

          $ cabbage new <project_name>

      """
    else
      console.error(e.stack)
    process.exit(1);
