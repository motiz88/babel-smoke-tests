var glob = require('glob');
var path = require('path');
var fs = require('fs');

function isSymlink (filename) {
  var stats = fs.lstatSync(filename);
  return stats && stats.isSymbolicLink();
}

module.exports = function getTheirPackages () {
  var packageJsonLocations = glob.sync("**/package.json", {
    cwd: path.resolve(__dirname, '../them'),
    absolute: true
  });
  return packageJsonLocations.map(function (packageJsonLocation) {
    try {
      var location = path.dirname(packageJsonLocation);
      if (isSymlink(location)) {
        return null;
      }
      var packageJson = require(packageJsonLocation);
      return {name: packageJson.name, location: location};
    } catch (e) {
      return null;
    }
  }).filter(Boolean);
};