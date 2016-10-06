var glob = require('glob');
var path = require('path');

module.exports = function getTheirPackages () {
  var packageJsonLocations = glob.sync("**/package.json", {
    cwd: path.resolve(__dirname, '../them'),
    absolute: true
  });
  return packageJsonLocations.map(function (packageJsonLocation) {
    try {
      var packageJson = require(packageJsonLocation);
      return {name: packageJson.name, location: path.dirname(packageJsonLocation)};
    } catch (e) {
      return null;
    }
  }).filter(Boolean);
};