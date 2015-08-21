//
//  user.js
//  iBeacons Demo
//
//  Copyright  (c) 2015 Clearbridge Mobile Inc. All rights reserved.
//
//  Purpose
//  Poll the Postgres Databse for user loyalty points
//

exports.action = {
  name:                   'users',
  description:            'users',
  blockedConnectionTypes: [],
  outputExample:          {},
  matchExtensionMimeType: false,
  version:                1.0,
  toDocument:             true,

  inputs: {},

  run: function(api, connection, next){
    
      console.log("User request Connected to DB");

         api.pg.client.query('SELECT loyalty_points__c FROM salesforce.Account WHERE id = 1;',function(err,res){
                console.log("Got values from db");
                connection.response.result = res.rows;
                next(connection, true);
         });

  }
};