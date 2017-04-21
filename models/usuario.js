/**
 * Created by Charly on 10/03/2017.
 */
var connection = require("../connection/connection");

var usuarioModel = {};

usuarioModel.gellAll = function (callback) {
    if (connection){
        var sql = "SELECT * FROM usuario";
        connection.query(sql, function (error,data) {
            if (error)
                throw error;
            else{
                callback(null,data);
            }
        });
    }
};
usuarioModel.save = function (usr,dir,log,callback) {
    connection.beginTransaction(function(err) {
        if (err) { callback(true,{"er":"connection","cod":error}); }
        connection.query('INSERT INTO usuario  VALUES (?, ?, ?, ?, ?, ?, ?)',usr,function (error, results) {
            if (error) {
                return connection.rollback(function() {
                    callback(true,{"er":"usr","cod":error});
                });
            }
            connection.query('INSERT INTO direccion  VALUES (?,?,?,?,?,?,?,?,?,?,?,?);',dir, function (error, results, fields) {
                if (error) {
                    return connection.rollback(function() {
                        callback(true,{"er":"dir","cod":error});
                    });
                }
                connection.query('INSERT INTO login VALUES (?,?)',log, function (error, results, fields) {
                    if (error) {
                        return connection.rollback(function() {
                            callback(true,{"er":"log","cod":error});
                        });
                    }

                    connection.commit(function(err) {
                        if (err) {
                            return connection.rollback(function() {
                                callback(true,{"er":"comit","cod":error});
                            });
                        }
                        console.log('success!');
                        callback(true,{"state":true,"datos": results});
                    });

                });
            });
        });
    });
};
usuarioModel.findById = function (id,callback) {
    if (connection){
        var sql = "SELECT * FROM usuario where email = ?";
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
        var sql = "DELETE FROM usuario where email = ?";
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






