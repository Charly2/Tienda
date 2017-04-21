//noinspection JSUnresolvedFunction
/** * Created by Charly on 10/03/2017. */
var express = require('express');
var router = express.Router();

var usuarioModel = require("../../models/usuario");
router.get('/', function(req, res, next) {
    if (typeof req.session.usuario !== 'undefined'){
        usuarioModel.gellAll(function (error,data) {
            res.io.emit("getAll", data);
            res.status(202).json({'usuarios':data});
        });
    }else
        res.status(202).json({'status':false});

});
router.post('/', function(req, res, next) {
    if (typeof req.session.usuario !== 'undefined'){
        usuarioModel.save(JSON.parse(req.body.user),JSON.parse(req.body.dir),JSON.parse(req.body.log),function (error,data) {
            if (error){
                res.status(200).json(data);
            }else{
                res.io.emit("savs", data);
                res.status(202).json(data);
            }
        });
    }else
        res.status(202).json({'status':false});

});
router.get('/:id', function(req, res, next) {
    if (typeof req.session.usuario !== 'undefined'){
        usuarioModel.findById(req.params.id,function (error,data) {
            res.io.emit("byID", data);
            res.status(202).json(data);
        });
    }else
        res.status(202).json({'status':false});
});
//noinspection JSUnresolvedFunction
router.delete('/:id', function(req, res, next) {
    if (typeof req.session.usuario !== 'undefined'){
        usuarioModel.deleteById(req.params.id,function (error,data) {
           if (error){
               res.status(202).json({"er":"no pudo eliminar ","d":data});
           }
           else {
               res.io.emit("delete", data);
               res.status(202).json(data);
           }
        });
    }else
        res.status(202).json({'status':false});
});
//noinspection JSUnresolvedVariable
module.exports = router;
