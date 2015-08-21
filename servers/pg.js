//
//  beacon.js
//  iBeacons Demo
//
//  Copyright  (c) 2015 Clearbridge Mobile Inc. All rights reserved.
//
//  Purpose
//  Create a connection to the Postgres Databse
//

var pgPackage = require('pg');

var conString = "postgres://username:password@localhost/database";  //Fill in your Postgres DB info here

var pg = {
	init: function (api, next) {
	    api.pg = pgPackage;
	    api.pg.client = {};


	        api.pg.connect(conString, function(err, client) {
	            if(err) {
	                console.log(err+"error in pgdb connection");
	                next();
	                } else {
	                    console.log("pgDb connection ok ");
	                    api.pg.client = client;
	                    next();
	                }
	        });
	}
}

module.exports = pg;