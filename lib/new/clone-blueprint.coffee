which = require('which')
exec = require("child_process").execFile

module.exports = (name, cb) ->
  cloneGitRepo("git@github.com:cabbagejs/blueprint-simple.git", name, cb)

cloneGitRepo = (gitRepo, name, cb) ->
  exec(which.sync('git'), ["clone", gitRepo, name], {cwd: process.cwd()}, cb)
