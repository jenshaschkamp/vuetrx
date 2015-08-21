//
//  app.js
//  iBeacons Demo
//
//  Copyright  (c) 2015 Clearbridge Mobile Inc. All rights reserved.
//
//  Purpose
//  Init Poatgres into actionhero
//

var pg = require("../servers/pg.js");

module.exports = {
    initialize: function(api, next) {
        pg.init(api, next);
    },
    start: function(api, next) {
        next();
    },
    stop: function(api, next) {
        next();
    }
}