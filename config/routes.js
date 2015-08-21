//
//  routes.js
//  iBeacons Demo
//
//  Copyright  (c) 2015 Clearbridge Mobile Inc. All rights reserved.
//
//  Purpose
//  Routs inbound request to the desired action
//

exports.default = { 
  routes: function(api){
    return {
      
      post: [{
        path: "/beacon",
        action :"beacon"
      }, {
		    path: "/users",
        action :"users"
      }]
      
    }
  }
}