/** * Created by Charly on 10/03/2017. */
var express = require('express');
var router = express.Router();
var productoModel = require("../../models/producto");

router.get('/', function(req, res, next) {
    if (typeof req.session.usuario !== 'undefined'){
        productoModel.gellAll(function (error,data) {
            res.io.emit("getAll", data);
            res.status(202).json({'productos':data});
        });
    }else
        res.status(202).json({'status':false});
});
router.post('/', function(req, res, next) {
    if (typeof req.session.usuario !== 'undefined'){
        productoModel.save(JSON.parse(req.body.pro),function (error,data) {
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
        productoModel.findById(req.params.id,function (error,data) {
            req.session.nombre = data;
            console.log(req.session);
            res.io.emit("byID", data);
            res.status(202).json(data);
        });
    }else
        res.status(202).json({'status':false});
});
router.delete('/:id', function(req, res, next) {
    if (typeof req.session.usuario !== 'undefined'){
        productoModel.deleteById(req.params.id,function (error,data) {
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
module.exports = router;