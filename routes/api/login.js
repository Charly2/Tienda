/**
 * Created by Charly on 20/04/2017.
 */
var express = require('express');
var router = express.Router();
var loginModel = require("../../models/login");
var usuarioModel = require("../../models/usuario");

router.post('/', function(req, res, next) {
    
    loginModel.login([req.body.usuario,req.body.password],function (error,data,login) {
        if (error){
            res.status(200).json({'status':false,'data':'usuario no valido'});
        }
        else{
            if(login){
                usuarioModel.findById(data,function (error,data) {
                    if(!error) {
                        req.session.usuario = data;
                        res.status(200).json({'status': true, 'data': data[0]});
                    }
                });

            }else {
                res.status(200).json({'status':false,'data':'usuario no valido'});
            }
        }
    });
});

router.post('/logout',function (req,res,next) {
    req.session.destroy(function(err) {
        res.send("Se cerro la session");
    });
});


module.exports = router;