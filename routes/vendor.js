const { Console } = require('console');
var http = require('http');
exports.addVendor = (req, res) => {
    db.close();
    db.connect(conn, () => {
        if (req.body.storeName == 'undefined' || req.body.storeName == null) {
            res.send({
                "status": "0",
                "message": "Please enter store name",
                "data": {}
            })
        }
        else {
            if (req.body.vName == 'undefined' || req.body.vName == null) {
                res.send({
                    "status": "0",
                    "message": "Please enter your name",
                    "data": {}
                })
            }
            else {
                if (req.body.vPhone == 'undefined' || req.body.vPhone == null) {
                    res.send({
                        "status": "0",
                        "message": "Please enter your phone",
                        "data": {}
                    })
                }
                else {
                    if (req.body.vEmail == 'undefined' || req.body.vEmail == null) {
                        res.send({
                            "status": "0",
                            "message": "Please enter your email",
                            "data": {}
                        })
                    }
                    else {
                        if (req.body.state == 'undefined' || req.body.state == null) {
                            res.send({
                                "status": "0",
                                "message": "Please enter store state",
                                "data": {}
                            })
                        }
                        else {
                            if (req.body.district == 'undefined' || req.body.district == null) {
                                res.send({
                                    "status": "0",
                                    "message": "Please enter store district",
                                    "data": {}
                                })
                            }
                            else {
                                if (req.body.region == 'undefined' || req.body.region == null) {
                                    res.send({
                                        "status": "0",
                                        "message": "Please enter store region",
                                        "data": {}
                                    })
                                }
                                else {
                                    if (req.body.storeAddress == 'undefined' || req.body.storeAddress == null) {
                                        res.send({
                                            "status": "0",
                                            "message": "Please enter store address",
                                            "data": {}
                                        })
                                    }
                                    else {
                                        if (req.body.storephone1 == 'undefined' || req.body.storephone1 == null) {
                                            res.send({
                                                "status": "0",
                                                "message": "Please enter store first contact no",
                                                "data": {}
                                            })
                                        }
                                        else {
                                            if (req.body.storephone2 == 'undefined' || req.body.storephone2 == null) {
                                                res.send({
                                                    "status": "0",
                                                    "message": "Please enter store second contact no",
                                                    "data": {}
                                                })
                                            }
                                            else {
                                                if (req.body.validity == 'undefined' || req.body.validity == null) {
                                                    res.send({
                                                        "status": "0",
                                                        "message": "Please enter store licence validity",
                                                        "data": {}
                                                    })
                                                }
                                                else {
                                                    if (req.body.storeType == 'undefined' || req.body.storeType == null) {
                                                        res.send({
                                                            "status": "0",
                                                            "message": "Please enter store type",
                                                            "data": {}
                                                        })
                                                    }
                                                    else {
                                                        if (req.query.salesmanid == 'undefined' || req.query.salesmanid == null) {
                                                            res.send({
                                                                "status": "0",
                                                                "message": "Please enter sales men id",
                                                                "data": {}
                                                            })
                                                        }
                                                        else {
                                                            if (req.file == undefined) {
                                                                res.send({
                                                                    "status": "0",
                                                                    "message": "Please select your store logo",
                                                                    "data": {}
                                                                })
                                                            }
                                                            else {
                                                                var otp = Math.floor(1000 + Math.random() * 9000);
                                                                console.log(otp);
                                                                var salesmanid = req.query.salesmanid;
                                                                console.log(salesmanid);
                                                                console.log('akhkfgfafdsfhk');
                                                                var request = new db.Request();
                                                                request.input('ActionType', db.NVarChar, 'Insert');
                                                                request.input('storeName', db.NVarChar, req.body.storeName);
                                                                request.input('vName', db.NVarChar, req.body.vName);
                                                                request.input('vPhone', db.NVarChar, req.body.vPhone);
                                                                request.input('vEmail', db.NVarChar, req.body.vEmail);
                                                                request.input('state', db.NVarChar, req.body.state);
                                                                request.input('district', db.NVarChar, req.body.district);
                                                                request.input('region', db.NVarChar, req.body.region);
                                                                request.input('storeAddress', db.NVarChar, req.body.storeAddress);
                                                                request.input('storeLat', db.NVarChar, req.body.storeLat);
                                                                request.input('storeLong', db.NVarChar, req.body.storeLong);
                                                                request.input('storephone1', db.NVarChar, req.body.storephone1);
                                                                request.input('storephone2', db.NVarChar, req.body.storephone2);
                                                                request.input('storephone3', db.NVarChar, req.body.storephone3);
                                                                request.input('validity', db.NVarChar, req.body.validity);
                                                                request.input('otp', db.NVarChar, otp);
                                                                request.input('payment_status', db.Int,  req.body.payment_status);
                                                                console.log("payment_status",req.body.payment_status);                                                  
                                                                request.input('storeType', db.NVarChar, req.body.storeType);
                                                                request.input('salesmenid', db.NVarChar, salesmanid);
                                                                request.input('storeLogo', db.NVarChar, req.file.originalname);
                                                                request.execute('prcslashVendor', (error, result) => {
                                                                    if (error) {
                                                                        console.log(error);
                                                                        res.send({//get list kaha hai
                                                                            "status": "0",
                                                                            "message": "Error occured",
                                                                            "data": {}
                                                                        });
                                                                    }
                                                                    else {
                                                                        if (result.recordset[0].accRegistered == 'Already Registered') {
                                                                            res.send({
                                                                                "status": "0",
                                                                                "message": "Already Registered",
                                                                                "data": {}
                                                                            });
                                                                        }
                                                                        else {
                                                                            res.send({
                                                                                "status": "1",
                                                                                "message": "You registered successfully",
                                                                                "data": Object.values(JSON.parse(result.recordset[0]['JSON_F52E2B61-18A1-11d1-B105-00805F49916B']))
                                                                            })
                                                                            /*msg = urlencode('Your otp is '+otp);
                                                                            var data = 'username=' + username + '&hash=' + hash + '&sender=' + sender + '&numbers=' + req.body.vPhone + '&message=' + msg;
                                                                            var options = {
                                                                                host: 'api.textlocal.in', path: '/send?' + data
                                                                            };
                                                                            http.request(options, callback).end();
                                                                            res.send({
                                                                                "status":"1",
                                                                                "message":"Vendor is added successfully",
                                                                                "data":result.recordset[0]
                                                                            });*/
                                                                            /*var message = 'Your Slash app otp is : ' + otp;
                                                                            var number = req.body.vPhone;
                                                                            http.get('http://www.teleshoppe.com/serv/BulkPush/?user=Terranoecom&pass=SlashKaBaap@20&message=' + message + '&msisdn=' + number + '&sender=SVMTPL&type=text', (response) => {
                                                                                let data = '';
                                                                                response.on('data', (chunk) => {
                                                                                    data += chunk;
                                                                                });
                                                                                response.on('end', () => {
                                                                                    
                                                                                });
                                                        
                                                                            }).on("error", (err) => {
                                                                                console.log("Error: " + err.message);
                                                                            });*/
                                                                        }
                                                                    }
                                                                });
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

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

exports.vendorLogin = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var otp = Math.floor(1000 + Math.random() * 9000);
        console.log(otp);
        var request = new db.Request();
        request.input('ActionType', db.NVarChar, 'vendorLogin');
        request.input('vPhone', db.NVarChar, req.body.vPhone);
        request.input('otp', db.NVarChar, otp);
        request.execute('prcslashVendor', (error, result) => {

            if (error) {
                res.send({
                    "status": "0",
                    "message": "Error occured",
                    "data": {}
                });
            }
            else {
                console.log("hi akshay",result.recordset.length)
                if (result.recordset.length == 0 ) {
                    console.log("hi akshay",result.recordset.length)
                    res.send({
                        "status": "0",
                        "message": "Invalid User! Please Register",
                        "data": {}
                    });
                }
                else {
                    console.log("paystatus",result)
                    if (result.recordset[0].payment_status == 1 || result.recordset[0].payment_status == null ) {
                        console.log("hi akshay",result.recordset.length)
                        res.send({
                            "status": "0",
                            "message": "Invalid User! Please Complete Payment",
                            "data": {}
                        });
                    }else{
                        
                        var message = 'Your Slash app otp is : ' + otp;
                    var number = req.body.vPhone;
                    console.log("sehbgfvhkdsfbyvhk",'http://www.teleshoppe.com/serv/BulkPush/?user=Terranoecom&pass=SlashPass1120&message=' + message + '&msisdn=' + number + '&sender=SVMTPL&type=text')
                    http.get('http://teleshoppe.co.in/serv/BulkPush/?user=Terranoecom&pass=SlashPass1120&message=' + message + '&msisdn=' + number + '&sender=SVMTPL&type=text', (response) => {
                        let data = '';
                        response.on('data', (chunk) => {
                            data += chunk;
                            
                        });
                        response.on('end', () => {
                            res.send({
                                "status": "1",
                                "message": "Otp Send to your mobile",
                                "data": result.recordsets[0][0]
                            })
                        });

                    }).on("error", (err) => {
            
                        console.log("Error: " + err.message);
                    });
                    }
                    /*msg = urlencode('Your otp is '+otp);
                    var data = 'username=' + username + '&hash=' + hash + '&sender=' + sender + '&numbers=' + req.body.vPhone + '&message=' + msg;
                    var options = {
                        host: 'api.textlocal.in', path: '/send?' + data
                    };
                    http.request(options, callback).end();
                    res.send({
                        "status":"1",
                        "message":"otp send to your mobile",
                        "data":result.recordset[0]
                    });*/
                    
                }
            }
        });
    });
}

exports.submit_otp = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var otp = Math.floor(1000 + Math.random() * 9000);
        console.log(otp);
        var request = new db.Request();
        request.input('ActionType', db.NVarChar, 'submit_otp');
        request.input('vid', db.Int, req.body.vid);
        request.input('otp', db.NVarChar, req.body.otp);
        request.execute('prcslashVendor', (error, result) => {
            if (error) {
                console.log("errorrrrrr",error)
                res.send({
                    "status": "0",
                    "message": "Error occured",
                    "data": []
                });
            }
            else {
                if (result.recordsets[0].length == 0) {
                    res.send({
                        "status": "0",
                        "message": "Incorrect otp",
                        "data": []
                    });
                }
                else {
                    console.log(result)
                    res.send({
                        "status": "1",
                        "message": "Login Successfully",
                        "data": result.recordsets[0]
                    });
                }
            }
        });
    });
}
//ye ha
exports.vendorList = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var request = new db.Request();
        request.input('ActionType', db.NVarChar, 'Select');
        request.execute('prcslashVendor', (error, result) => {
            if (error) {
                console.log(error)
                res.send({
                    "status": "0",
                    "message": "Error occured",
                    "data": []
                });
            }
            else {
                if (result.recordset == 0) {
                    res.send({
                        "status": "0",
                        "message": "no vendor",
                        "data": []
                    });
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "Vendor List",
                        "data": result.recordset
                    });
                }
            }
        });
    });
};

exports.vendorListApp = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var lat = req.body.lat;
        var long = req.body.long;
        var page = req.body.page
        var request = new db.Request();
        request.input('ActionType', db.NVarChar, 'Select');
        request.execute('prcslashVendor', (error, result) => {
            if (error) {
                console.log(error)
                res.send({
                    "status": "0",
                    "message": "Error occured",
                    "data": []
                });
            }
            else {
               
                var array = result.recordset.slice()
                
                var range = 400;
                for (var i = array.length - 1; i >= 0; i--) {
                    var slat;
                    var slong;
                    slat = array[i].storeLat;
                    slong = array[i].storeLong;
                    var dis = distance(lat, long, slat, slong, 'K')
                    array[i].distance = dis;
                    if (!(dis <= range)) {
                        array.splice(i, 1);
                    }
                }
                var jsonAsArray = array.sort(function (a, b) {
                    return parseFloat(a.distance) - parseFloat(b.distance);
                });
                
                if (result.recordset == 0) {
                    res.send({
                        "status": "0",
                        "message": "no vendor",
                        "data": [] 
                    });
                }
                else {
                    page_no(jsonAsArray,result.recordset,page,res)
                }
            }
        });
    });
};

function distance(lat1, lon1, lat2, lon2, unit) {
    if ((lat1 == lat2) && (lon1 == lon2)) {
        return 0;
    }
    else {
      
        var radlat1 = Math.PI * lat1 / 180;
        var radlat2 = Math.PI * lat2 / 180;
        var theta = lon1 - lon2;
        var radtheta = Math.PI * theta / 180;
        var dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
        if (dist > 1) {
            dist = 1;
        }
        dist = Math.acos(dist);
        dist = dist * 180 / Math.PI;
        dist = dist * 60 * 1.1515;
        if (unit == "K") { dist = dist * 1.609344 }
        if (unit == "N") { dist = dist * 0.8684 }
        return dist;
    }
}

function page_no (filterdata,fulldata,page,res){
    var count = 10
    var start_range = (page - 1) * count
    var End_range = ( page * count ) - 1
    if(filterdata.length != 0){
        console.log("filterrrrrrrrr",filterdata.length)
        res.send({
            "status": "1",
            "message": "Vendor List",
            "data": filterdata.slice(start_range,End_range)
        });
    }
     else{
        res.send({
            "status": "1",
            "message": "Vendor List",
            "data": fulldata.slice(start_range,End_range)
        });
    }
}

exports.storebyType = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var request = new db.Request();
        request.input('ActionType', db.NVarChar, 'storebyType');
        request.input('storeIds', db.NVarChar, req.body.storeIds);
        request.execute('prcslashVendor', (error, result) => {
            if (error) {
                console.log(error)
                res.send({
                    "status": "0",
                    "message": "Error occured",
                    "data": []
                });
            }
            else {
                console.log(result.recordset[0]['JSON_F52E2B61-18A1-11d1-B105-00805F49916B']);
                if (result.recordset[0]['JSON_F52E2B61-18A1-11d1-B105-00805F49916B'] == 0) {
                    res.send({
                        "status": "0",
                        "message": "no vendor",
                        "data": []
                    });
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "Vendor List",
                        "data": Object.values(JSON.parse(result.recordset[0]['JSON_F52E2B61-18A1-11d1-B105-00805F49916B']))
                    });
                }
            }
        });
    });
};

exports.editVendor = (req, res) => {
    db.close();
    db.connect(conn, () => {
        console.log(req.body.storeName)
        if (req.body.storeName == 'undefined' || req.body.storeName == null) {
            res.send({
                "status": "0",
                "message": "Please enter store name",
                "data": {}
            })
        }
        else {
            if (req.body.vName == 'undefined' || req.body.vName == null) {
                res.send({
                    "status": "0",
                    "message": "Please enter your name",
                    "data": {}
                })
            }
            else {
                if (req.body.vPhone == 'undefined' || req.body.vPhone == null) {
                    res.send({
                        "status": "0",
                        "message": "Please enter your phone",
                        "data": {}
                    })
                }
                else {
                    if (req.body.vEmail == 'undefined' || req.body.vEmail == null) {
                        res.send({
                            "status": "0",
                            "message": "Please enter your email",
                            "data": {}
                        })
                    }
                    else {
                        if (req.body.state == 'undefined' || req.body.state == null) {
                            res.send({
                                "status": "0",
                                "message": "Please enter store state",
                                "data": {}
                            })
                        }
                        else {
                            if (req.body.district == 'undefined' || req.body.district == null) {
                                res.send({
                                    "status": "0",
                                    "message": "Please enter store district",
                                    "data": {}
                                })
                            }
                            else {
                                if (req.body.region == 'undefined' || req.body.region == null) {
                                    res.send({
                                        "status": "0",
                                        "message": "Please enter store region",
                                        "data": {}
                                    })
                                }
                                else {
                                    if (req.body.storeAddress == 'undefined' || req.body.storeAddress == null) {
                                        res.send({
                                            "status": "0",
                                            "message": "Please enter store address",
                                            "data": {}
                                        })
                                    }
                                    else {
                                        // if (req.body.storeLat == 'undefined' && req.body.storeLong == 'undefined') {
                                        //     res.send({
                                        //         "status": "0",
                                        //         "message": "Please enter store location",
                                        //         "data": {}
                                        //     })
                                        // }
                                        // else {
                                        if (req.body.storephone1 == 'undefined' || req.body.storephone1 == null) {
                                            res.send({
                                                "status": "0",
                                                "message": "Please enter store first contact no",
                                                "data": {}
                                            })
                                        }
                                        else {
                                            if (req.body.storephone2 == 'undefined' || req.body.storephone2 == null) {
                                                res.send({
                                                    "status": "0",
                                                    "message": "Please enter store second contact no",
                                                    "data": {}
                                                })
                                            }
                                            else {
                                                if (req.body.validity == 'undefined' || req.body.validity == null) {
                                                    res.send({
                                                        "status": "0",
                                                        "message": "Please enter store licence validity",
                                                        "data": {}
                                                    })
                                                }
                                                else {
                                                    if (req.body.storeType == 'undefined' || req.body.storeType == null) {
                                                        res.send({
                                                            "status": "0",
                                                            "message": "Please enter store type",
                                                            "data": {}
                                                        })
                                                    }
                                                    else {
                                                        if (req.file == undefined) {
                                                            var storeLogo = 'NO';
                                                        }
                                                        else {
                                                            var storeLogo = req.file.originalname;
                                                        }
                                                        var request = new db.Request();
                                                        request.input('ActionType', db.NVarChar, 'Update');
                                                        request.input('storeName', db.NVarChar, req.body.storeName);
                                                        request.input('vName', db.NVarChar, req.body.vName);
                                                        request.input('vPhone', db.NVarChar, req.body.vPhone);
                                                        request.input('vEmail', db.NVarChar, req.body.vEmail);
                                                        request.input('state', db.NVarChar, req.body.state);
                                                        request.input('district', db.NVarChar, req.body.district);
                                                        request.input('region', db.NVarChar, req.body.region);
                                                        request.input('storeAddress', db.NVarChar, req.body.storeAddress);
                                                        request.input('storeLat', db.NVarChar, req.body.storeLat);
                                                        request.input('storeLong', db.NVarChar, req.body.storeLong);
                                                        request.input('storephone1', db.NVarChar, req.body.storephone1);
                                                        request.input('storephone2', db.NVarChar, req.body.storephone2);
                                                        request.input('storephone3', db.NVarChar, req.body.storephone3);
                                                        request.input('validity', db.NVarChar, req.body.validity);
                                                        request.input('storeType', db.NVarChar, req.body.storeType);
                                                        request.input('vid', db.NVarChar, req.body.vid);
                                                        request.input('storeLogo', db.NVarChar, storeLogo);
                                                        request.execute('prcslashVendor', (error, result) => {
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
                                                                        "message": "Error in editing vendor"
                                                                    });
                                                                }
                                                                else {
                                                                    res.send({
                                                                        "status": "1",
                                                                        "message": "Vendor is edited successfully"
                                                                    });
                                                                }
                                                            }
                                                        });
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    // }
                                }
                            }
                        }
                    }
                }
            }
        }
    });
};

exports.deleteVendor = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var request = new db.Request();
        request.input('ActionType', db.NVarChar, 'Delete');
        request.input('vid', db.NVarChar, req.body.vid);
        request.execute('prcslashVendor', (error, result) => {
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
                        "message": "Error in deleting vendor"
                    });
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "Vendor is deleted successfully"
                    });
                }
            }
        });
    });
};

exports.addProfilePic = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var profilepics = '';
        for (var i = 0; i < req.files.length; i++) {
            profilepics = profilepics + ',' + req.files[i].originalname;
        }
        console.log(profilepics);
        var request = new db.Request();
        request.input('Actiontype', db.NVarChar, 'Insert');
        request.input('vid', db.NVarChar, req.body.vid);
        request.input('Imagename', db.NVarChar, profilepics);
        request.execute('prcstoreImages', (error, result) => {
            if (error) {
                console.log(error)
                res.send({
                    "status": "0",
                    "message": "Error occured"
                })
            }
            else {
                if (result.rowsAffected == 0) {
                    res.send({
                        "status": "0",
                        "message": "Error in adding images"
                    })
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "Images added successfully"
                    })
                }
            }

        });
    })
};

exports.editProfilePic = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var request = new db.Request();
        request.input('Actiontype', db.NVarChar, 'Update');
        request.input('Id', db.NVarChar, req.body.Id);
        request.input('vid', db.NVarChar, req.body.vid);
        request.input('Imagename', db.NVarChar, req.file.originalname);
        request.execute('prcstoreImages', (error, result) => {
            if (error) {
                res.send({
                    "status": "0",
                    "message": "Error occured"
                })
            }
            else {
                if (result.rowsAffected == 0) {
                    res.send({
                        "status": "0",
                        "message": "Error in updating images"
                    })
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "Images updated successfully"
                    })
                }
            }

        });
    })
};

exports.deleteProfilePic = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var request = new db.Request();
        request.input('Actiontype', db.NVarChar, 'Delete');
        request.input('Id', db.NVarChar, req.body.Id);
        request.execute('prcstoreImages', (error, result) => {
            if (error) {
                res.send({
                    "status": "0",
                    "message": "Error occured"
                })
            }
            else {
                if (result.rowsAffected == 0) {
                    res.send({
                        "status": "0",
                        "message": "Error in deleting images"
                    })
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "Images deleted successfully"
                    })
                }
            }

        });
    })
};


exports.uploadDoc = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var docImages = '';
        for (var i = 0; i < req.files.length; i++) {
            docImages = docImages + ',' + req.files[i].originalname;
        }
        var request = new db.Request();
        request.input('Actiontype', db.NVarChar, 'Insert');
        request.input('vid', db.NVarChar, req.body.vid);
        request.input('Docname', db.NVarChar, docImages);
        request.execute('prcstoreDocument', (error, result) => {
            if (error) {
                res.send({
                    "status": "0",
                    "message": "Error occured" + error
                })
            }
            else {
                if (result.rowsAffected == 0) {
                    res.send({
                        "status": "0",
                        "message": "Error in adding documents"
                    })
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "Documents added successfully"
                    })
                }
            }

        });
    })
};

exports.editDoc = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var request = new db.Request();
        request.input('Actiontype', db.NVarChar, 'Update');
        request.input('vid', db.NVarChar, req.body.vid);
        request.input('Id', db.NVarChar, req.body.Id);
        request.input('Docname', db.NVarChar, req.file.originalname);
        request.execute('prcstoreDocument', (error, result) => {
            if (error) {
                res.send({
                    "status": "0",
                    "message": "Error occured"
                })
            }
            else {
                if (result.rowsAffected == 0) {
                    res.send({
                        "status": "0",
                        "message": "Error in editing documents"
                    })
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "Documents edited successfully"
                    })
                }
            }

        });
    })
};

exports.deleteDoc = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var request = new db.Request();
        request.input('Actiontype', db.NVarChar, 'Delete');
        request.input('Id', db.NVarChar, req.body.Id);
        request.execute('prcstoreDocument', (error, result) => {
            if (error) {
                res.send({
                    "status": "0",
                    "message": "Error occured"
                })
            }
            else {
                if (result.rowsAffected == 0) {
                    res.send({
                        "status": "0",
                        "message": "Error in deleting documents"
                    })
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "Documents deleted successfully"
                    })
                }
            }

        });
    })
};


exports.updatepayment = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var request = new db.Request();
        request.input('Actiontype', db.NVarChar, 'updatepayment');
        request.input('payment_status', db.Int, req.body.payment_status);
        request.input('vPhone', db.NVarChar, req.body.vPhone);
        request.execute('prcslashVendor', (error, result) => {
            if (error) {
                res.send({
                    "status": "0",
                    "message": "Error occured"
                })
            }
            else {
                if (result.rowsAffected == 0) {
                    res.send({
                        "status": "0",
                        "message": "Error in deleting documents"
                    })
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "Updated successfully"
                    })
                }
            }

        });
    })
};

exports.Store_By_Category = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var request = new db.Request();
        var store_Type = req.body.store_Type
        var action_type="";
        var storetype_String="";
        if(store_Type == 0){
          action_type = 'Store_By_CategoryALL'
        }else{
          action_type = 'Store_By_Category'
          for(var i =0 ; i<store_Type.length; i++){
            if(i == store_Type.length -1){
                storetype_String = storetype_String + store_Type[i];
            }else{
                console.log(store_Type[i]+",")
                storetype_String = storetype_String +  store_Type[i]+",";
            }
          }
        }
        request.input("ActionType",action_type);
        request.input("store_Type",store_Type);
        request.input("page_no",db.Int,req.body.page_no);
        request.execute('prcslashVendor', (error, result) => {
            if (error) {
                res.send({
                    "status": "0",
                    "message": "Error occured"
                })
            }
            else {
                if (result.rowsAffected == 0) {
                    res.send({
                        "status": "0",
                        "message": "Error in deleting documents"
                    })
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "Store list",
                        "data":result.recordset
                    })
                }
            }

        });
           
    })
};