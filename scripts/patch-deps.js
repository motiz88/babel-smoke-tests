#!/usr/bin/env node

var getOurPackages = require('../src/getOurPackages');
var getTheirPackages = require('../src/getTheirPackages');
var getDepsToOverride = require('../src/getDepsToOverride');
var patchDependency = require('../src/patchDependency');

var ourPackages = getOurPackages();
var deps = getDepsToOverride(getTheirPackages(), ourPackages);
deps.forEach(function (dep) { patchDependency(dep, ourPackages); });
