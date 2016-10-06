#!/usr/bin/env Node

var getOurPackages = require('../src/getOurPackages');
var getTheirPackages = require('../src/getTheirPackages');
var getDepsToOverride = require('../src/getDepsToOverride');
var patchDependency = require('../src/patchDependency');

var deps = getDepsToOverride(getTheirPackages(), getOurPackages());
deps.forEach(patchDependency);
