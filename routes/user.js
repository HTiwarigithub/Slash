var http = require('http');
var urlencode = require('urlencode');
var msg = '';
var username = 'md@teranogroup.com';
var hash = 'SlashntePass2020';
var sender = 'txtlcl';
// var data = 'username=' + username + '&hash=' + hash + '&sender=' + sender + '&numbers=' + '9871949688' + '&message=' + msg;
/*var options = {
    host: 'api.textlocal.in', path: '/send?' + data
};*/
exports.userSignup = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var otp = Math.floor(1000 + Math.random() * 9000);
        console.log(otp);
        var request = new db.Request();
        request.input('ActionType', db.NVarChar, 'Insert');
        request.input('name', db.NVarChar, req.body.name);
        request.input('email', db.NVarChar, req.body.email);
        request.input('phone', db.NVarChar, req.body.phone);
        request.input('dob', db.NVarChar, req.body.dob);
        request.input('otp', db.NVarChar, otp);
        request.input('createdTime', db.NVarChar, new Date().toLocaleString());
        request.input('user_image',db.NVarChar,req.body.user_image);
        request.execute('prcslashUser', (error, result) => {
            if (error) {
                res.send({
                    "status": "0",
                    "message": "Error occured",
                    "data": {}
                });
            }
            else {
                if (result.rowsAffected == 0) {
                    res.send({
                        "status": "0",
                        "message": "Error in registering in app",
                        "data": {}
                    });
                }
                else {
                    /*msg = urlencode('Your otp is '+result.recordset[0].otp);
                    var data = 'username=' + username + '&hash=' + hash + '&sender=' + sender + '&numbers=' + req.body.phone + '&message=' + msg;
                    var options = {
                        host: 'api.textlocal.in', path: '/send?' + data
                    };
                    http.request(options, callback).end();*/
                    var message = 'Your Slash app otp is : ' + otp;
                    var number = req.body.phone;
                    http.get('http://www.teleshoppe.com/serv/BulkPush/?user=Terranoecom&pass=SlashPass1120&message=' + message + '&msisdn=' + number + '&sender=SVMTPL&type=text', (response) => {
                        let data = '';
                        response.on('data', (chunk) => {
                            data += chunk;
                        });
                        response.on('end', () => {
                            console.log('Your Slash app otp is : ' + otp);
                            res.send({
                                "status": "1",
                                "message": "Otp Send to your mobile",
                                "data": result.recordset[0]
                            })
                        });

                    }).on("error", (err) => {
                        console.log("Error: " + err.message);
                    });
                    /*res.send({
                        "status": "1",
                        "message": "OTP send to your mobile",
                        "data": result.recordset[0]
                    });*/
                }
            }
        });
    });
};

exports.login = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var otp = Math.floor(1000 + Math.random() * 9000);
        console.log(otp);
        var request = new db.Request();
        request.input('ActionType', db.NVarChar, 'Login');
        request.input('phone', db.NVarChar, req.body.phone);
        request.input('otp', db.NVarChar, otp);
        request.execute('prcslashUser', (error, result) => {
            if (error) {
                console.log(error);
                res.send({
                    "status": "0",
                    "message": "Error occured",
                    "data": {}
                });
            }
            else {
                console.log(result);
                if (result.recordset == 0) {
                    console.log("heyyyyyyyyyyy")
                    res.send({
                        "status": "0",
                        "message": "Please register first",
                        "data": {}
                    });
                }
                else {
                    
                    /*msg = urlencode('Your otp is '+result.recordset[0].otp);
                    var data = 'username=' + username + '&hash=' + hash + '&sender=' + sender + '&numbers=' + req.body.phone + '&message=' + msg;
                    var options = {
                        host: 'api.textlocal.in', path: '/send?' + data
                    };
                    http.request(options, callback).end();
                    res.send({
                        "status": "1",
                        "message": "OTP send to your mobile",
                        "data": result.recordset[0]
                    });*/
                    var message = 'Your Slash app otp is : ' + result.recordset[0].otp;
                    var number = req.body.phone;
                    http.get('http://www.teleshoppe.com/serv/BulkPush/?user=Terranoecom&pass=SlashPass1120&message=' + message + '&msisdn=' + number + '&sender=SVMTPL&type=text', (response) => {
                        let data = '';
                        response.on('data', (chunk) => {
                            data += chunk;
                        });
                        response.on('end', () => {
                            res.send({
                                "status": "1",
                                "message": "Otp Send to your mobile",
                                "data": result.recordset[0]
                            })
                        });

                    }).on("error", (err) => {
                        console.log("Error: " + err.message);
                    });
                }
            }
        });
    });
};

callback = function (response) {
    var str = '';//another chunk of data has been recieved, so append it to `str`
    response.on('data', function (chunk) {
        str += chunk;
    });//the whole response has been recieved, so we just print it out here
    response.on('end', function () {
        console.log(str);
    });
}

exports.socialLogin = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var request = new db.Request();
        request.input('ActionType', db.NVarChar, 'SocialLogin');
        request.input('name', db.NVarChar, req.body.name);
        request.input('email', db.NVarChar, req.body.email);
        request.input('phone', db.NVarChar, req.body.phone);
        request.input('dob', db.NVarChar, req.body.dob);
        request.input('isSocial', db.NVarChar, req.body.isSocial);
        request.input('socialId', db.NVarChar, req.body.socialId);
        request.input('createdTime', db.NVarChar, new Date().toLocaleString());
        request.execute('prcslashUser', (error, result) => {
            if (error) {
                res.send({
                    "status": "0",
                    "message": "Error occured",
                    "data": {}
                });
            }
            else {
                if (result.recordset == 0) {
                    res.send({
                        "status": "0",
                        "message": "Error in login in app",
                        "data": {}
                    });
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "Login successfully",
                        "data": result.recordset[0]
                    });
                }
            }
        });
    });
};

exports.submitOtp = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var request = new db.Request();
        request.input('ActionType', db.NVarChar, 'Submit_Otp');
        request.input('uid', db.NVarChar, req.body.uid);
        request.input('otp', db.NVarChar, req.body.otp);
        request.execute('prcslashUser', (error, result) => {
            if (error) {
                res.send({
                    "status": "0",
                    "message": "Error occured",
                    "data": {}
                });
            }
            else {
                console.log(result)
                if (result.recordset == 0) {
                    res.send({
                        "status": "0",
                        "message": "Incorrect OTP",
                        "data": {}
                    });
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "Login Successfull",
                        "data": result.recordset[0]
                    });
                }
            }
        });
    });
};

exports.resendOtp = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var otp = Math.floor(1000 + Math.random() * 9000);
        console.log(otp);
        var request = new db.Request();
        request.input('ActionType', db.NVarChar, 'Resend_Otp');
        request.input('uid', db.NVarChar, req.body.uid);
        request.input('otp', db.NVarChar, otp);
        request.execute('prcslashUser', (error, result) => {
            if (error) {
                res.send({
                    "status": "0",
                    "message": "Error occured",
                    "data": {}
                });
            }
            else {
                if (result.rowsAffected == 0) {
                    res.send({
                        "status": "0",
                        "message": "Error in getting otp",
                        "data": {}
                    });
                }
                else {
                    /*msg = urlencode('Your otp is '+result.recordset[0].otp);
                    var data = 'username=' + username + '&hash=' + hash + '&sender=' + sender + '&numbers=' + result.recordset[0].phone + '&message=' + msg;
                    var options = {
                        host: 'api.textlocal.in', path: '/send?' + data
                    };
                    http.request(options, callback).end();
                    res.send({
                        "status": "1",
                        "message": "OTP send to your mobile",
                        "data": result.recordset[0]
                    });*/
                    var message = 'Your Slash app otp is : ' + result.recordset[0].otp;
                    var number = result.recordset[0].phone;
                    http.get('http://www.teleshoppe.com/serv/BulkPush/?user=Terranoecom&pass=SlashPass1120&message=' + message + '&msisdn=' + number + '&sender=SVMTPL&type=text', (response) => {
                        let data = '';
                        response.on('data', (chunk) => {
                            data += chunk;
                        });
                        response.on('end', () => {
                            res.send({
                                "status": "1",
                                "message": "Otp Send to your mobile",
                                "data": result.recordset[0]
                            })
                        });

                    }).on("error", (err) => {
                        console.log("Error: " + err.message);
                    });
                }
            }
        });
    });
};

exports.editProfile = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var request = new db.Request();
        request.input('ActionType', db.NVarChar, 'Update');
        request.input('name', db.NVarChar, req.body.name);
        request.input('email', db.NVarChar, req.body.email);
        request.input('phone', db.NVarChar, req.body.phone);
        request.input('dob', db.NVarChar, req.body.dob);
        request.input('uid', db.NVarChar, req.body.uid);
        request.execute('prcslashUser', (error, result) => {
            if (error) {
                res.send({
                    "status": "0",
                    "message": "Error occured",
                    "data": {}
                });
            }
            else {
                if (result.rowsAffected == 0) {
                    res.send({
                        "status": "0",
                        "message": "Error in updating profile detail",
                        "data": {}
                    });
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "Profile detail updated successfully",
                        "data": result.recordset[0]
                    });
                }
            }
        });
    });
};

exports.deleteProfile = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var request = new db.Request();
        request.input('ActionType', db.NVarChar, 'Delete');
        request.input('uid', db.NVarChar, req.body.uid);
        request.execute('prcslashUser', (error, result) => {
            if (error) {
                res.send({
                    "status": "0",
                    "message": "Error occured"
                });
            }
            else {
                if (result.rowsAffected == 0) {
                    res.send({
                        "status": "0",
                        "message": "Error in deleting account"
                    });
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "Account deleted successfully",
                    });
                }
            }
        });
    });
};


exports.allList = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var request = new db.Request();
        request.input('ActionType', db.NVarChar, 'List');
        request.execute('prcslashUser', (error, result) => {
            if (error) {
                res.send({
                    "status": "0",
                    "message": "Error Occured",
                    "data": {}
                })
            }
            else {
                if (result.recordsets == 0) {
                    res.send({
                        "status": "0",
                        "message": "no data",
                        "data": {}
                    })
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "List",
                        "data": {
                            "productList": result.recordsets[0],
                            "storeList": Object.values(JSON.parse(result.recordsets[1][0]['JSON_F52E2B61-18A1-11d1-B105-00805F49916B'])),
                            "offerList": Object.values(JSON.parse(result.recordsets[2][0]['JSON_F52E2B61-18A1-11d1-B105-00805F49916B']))
                        }
                    })
                }
            }
        });
    });
};


exports.getAll = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var request = new db.Request();
        request.input('ActionType', db.NVarChar, 'getAllUser');
        request.execute('prcslashUser', (error, result) => {
            if (error) {
                res.send({
                    "status": "0",
                    "message": "Error Occured",
                    "data": {}
                })
            }
            else {
                if (result.recordsets == 0) {
                    res.send({
                        "status": "0",
                        "message": "no data",
                        "data": {}
                    })
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "List",
                        "data": result.recordsets
                    })
                }
            }
        });
    });
};

exports.UpdateImage = (req,res) => {
    db.close();
    db.connect(conn, () =>{
        var request = new db.Request();
        request.input('Actiontype',db.NVarChar,'UpdateImage');
        request.input('uid',db.NVarChar,req.body.uid);
        request.input('user_image',db.NVarChar,req.body.user_image);
        request.execute('prcslashUser',(error,result) => {
                if(error){
                    res.send({
                        "status":"0",
                        "message":"Error"
                    })
                }
                else{
                    if(result.rowsAffected == 0){
                        res.send({
                            "status":"0",
                            "message":"Error in updating images"
                        })
                    }
                    else{
                        res.send({
                            "status":"1",
                            "message":"Image Updated",
                            "data":result.recordset
                        })
                    }
                }
        });
    })
}

exports.UpdateName = (req,res) => {
    db.close();
    db.connect(conn,() => {
    var request = new db.Request();
        request.input('Actiontype',db.NVarChar,'UpdateName');
        request.input('name',db.NVarChar,req.body.name);
        request.input('uid',db.NVarChar,req.body.uid);
        request.execute('prcslashUser',(error,result) => {
            if(error){
                res.send({
                   "status":"0",
                   "message":"Error" 
                })
            }
            else{
                if(result.rowsAffected ==0){
                    res.send({
                        "status":"0",
                        "message":"Profile Name not Updated"
                    })
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"Name Updated"
                    })
                }
            }
        })
    })
}