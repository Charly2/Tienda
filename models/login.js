/**
 * Created by Charly on 20/04/2017.
 */

var connection = require("../connection/connection");

var loginModel = {};

loginModel.login = function (params,callback) {
    if (connection){
        var sql = "SELECT usuario FROM login where usuario = ? and password = ?";
        connection.query(sql,params, function (error,data) {
            if (error)
                callback(true,null,false);
            else{
                if(data.length > 0){
                    callback(null,data[0].usuario,true);
                }else{
                    callback(null,data,false);
                }
            }
        });
    }
};

module.exports = loginModel;