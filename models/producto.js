/**
 * Created by Charly on 10/03/2017.
 */
var connection = require("../connection/connection");

var usuarioModel = {};

usuarioModel.gellAll = function (callback) {
    if (connection){
        var sql = "SELECT * FROM producto";
        connection.query(sql, function (error,data) {
            if (error)
                throw error;
            else{
                callback(null,data);
            }
        });
    }
};
usuarioModel.save = function (prod,callback) {
    if (connection) {
        connection.query('INSERT INTO producto VALUES (?, ?, ?, ?, ?, ?, ?, ?)',prod, function (error, results, fields) {
            if (error) {
                return connection.rollback(function() {
                    callback(true,{"er":"pro","cod":error});
                });
            }
            callback(null,results);
        });
    }
};

usuarioModel.findById = function (id,callback) {
    if (connection){
        var sql = "SELECT * FROM producto WHERE idproducto = ?";
        connection.query(sql,id, function (error,data) {
            if (error)
                throw error;
            else{
                callback(null,data);
            }
        });
    }
};
usuarioModel.deleteById = function (id,callback) {
    if (connection){
        var sql = "DELETE FROM producto WHERE idproducto = ?";
        connection.query(sql,id, function (error,data) {
            if (error)
                throw error;
            else{
                callback(null,data);
            }
        });
    }
};
module.exports = usuarioModel;