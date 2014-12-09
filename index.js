require('coffee-script/register')

module.exports = require('./lib/cli');

module.exports.commands = {
  new: require('./lib/commands/new')
};
