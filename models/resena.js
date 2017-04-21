/**
 * Created by Charly on 10/03/2017.
 */
var connection = require("../connection/connection");

var resenaModel = {};

resenaModel.gellAll = function (callback) {
    if (connection){
        var sql = "SELECT * FROM resena";
        connection.query(sql, function (error,data) {
            if (error)
                throw error;
            else{
                callback(null,data);
            }
        });
    }
};
resenaModel.save = function (prod,callback) {
    if (connection) {
        connection.query('INSERT INTO resena VALUES (?,?,?)',prod, function (error, results, fields) {
            if (error) {
                return connection.rollback(function() {
                    callback(true,{"er":"pro","cod":error});
                });
            }
            callback(null,results);
        });
    }
};

resenaModel.findById = function (id,callback) {
    if (connection){
        var sql = "SELECT * FROM resena WHERE producto = ?";
        connection.query(sql,id, function (error,data) {
            if (error)
                throw error;
            else{
                callback(null,data);
            }
        });
    }
};
resenaModel.deleteById = function (id,callback) {
    if (connection){
        var sql = "DELETE FROM resena WHERE producto = ? and usuario = ?";
        connection.query(sql,id, function (error,data) {
            if (error)
                throw error;
            else{
                callback(null,data);
            }
        });
    }
};
module.exports = resenaModel;