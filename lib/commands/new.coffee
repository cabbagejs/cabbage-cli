path = require('path')
rimraf = require('rimraf')

cloneBlueprint = require('./../new/clone-blueprint')
installNpmModule = require('./../new/install-npm-module')

module.exports = (name, skipInstall = false, cb = ->) ->
  console.log "Cloning a new cabbage project into '#{name}'"
  cloneBlueprint name, (err) ->
    return console.error("Error cloning blueprint project. Verify your network connection and try again.\n#{err.stack}") if err?
    dest = path.resolve(process.cwd(), name)

    console.log "Installing cabbage and broccoli from npm"
    installOrSkip skipInstall, dest, (err) ->
      return (console.error("Error installing cabbage and broccoli from npm.\n#{err.stack}"); cb(err)) if err?
      rimraf.sync(path.resolve(dest, ".git"))

      console.log """
      Your cabbage/broccoli project is ready to go! To get started:

      $ cd #{name}
      $ cabbage run
      """
      cb(null)

installOrSkip = (skip, dest, cb) ->
  if skip
    console.log("Skipping npm install of cabbage and broccoli. Run `npm i --save-dev cabbage broccoli` to install them.")
    cb(null)
  else
    installNpmModule(dest, cb)
