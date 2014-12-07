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
    console.error("No `cabbage` module found. Are you sure you're running from a directory with cabbage installed?")
    console.error(e.stack)
    process.exit(1);
