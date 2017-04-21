/** * Created by Charly on 10/03/2017. */
var express = require('express');
var router = express.Router();
var Model = require("../../models/resena");

router.get('/', function(req, res, next) {
    if (typeof req.session.usuario !== 'undefined'){
        Model.gellAll(function (error,data) {
            res.io.emit("getAll", data);
            res.status(202).json(data);
        });
    }else
        res.status(202).json({'status':false});
});
router.post('/', function(req, res, next) {

    var a = ['Juan', 'CSNP00000002', 'asdfghjk'];
    if (typeof req.session.usuario !== 'undefined'){
        Model.save(JSON.parse(req.body.resena),function (error,data) {
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
        Model.findById(req.params.id,function (error,data) {
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
        Model.deleteById(req.params.id,function (error,data) {
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