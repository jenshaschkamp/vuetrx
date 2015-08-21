//
//  reset.js
//  iBeacons Demo
//
//  Copyright  (c) 2015 Clearbridge Mobile Inc. All rights reserved.
//
//  Purpose
//  Reset Saleforce data to starting number
//

exports.action = {
  name:                   'reset',
  description:            'reset',
  blockedConnectionTypes: [],
  outputExample:          {},
  matchExtensionMimeType: false,
  version:                1.0,
  toDocument:             true,

  inputs: {},

  run: function(api, connection, next){
    // your logic here
    console.log("Reset request Connected to DB");

          api.pg.client.query('UPDATE salesforce.Account SET loyalty_points__c = 249 WHERE id = 1;', function(err,res){
            if(err)next(connection, true);

              console.log("update DB");

               api.pg.client.query('SELECT loyalty_points__c FROM salesforce.Account WHERE id = 1;',function(err,res){
                      console.log("Got values from db");
                      connection.response.result = res.rows;
                      next(connection, true);
               });
          });
  }
};