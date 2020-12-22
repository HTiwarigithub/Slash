exports.addStore = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var request = new db.Request();
        request.input('ActionType',db.NVarChar,'Insert');
        request.input('storeName',db.NVarChar,req.body.storeName);
        request.input('salesmenid',db.NVarChar,req.query.salesmenid);
        request.input('vName',db.NVarChar,req.body.vName);
        request.input('vPhone',db.NVarChar,req.body.vPhone);
        request.input('vEmail',db.NVarChar,req.body.vEmail);
        request.input('state',db.NVarChar,req.body.state);
        request.input('district',db.NVarChar,req.body.district);
        request.input('region',db.NVarChar,req.body.region);
        request.input('storeAddress',db.NVarChar,req.body.storeAddress);
        request.input('storeLat',db.NVarChar,req.body.storeLat);
        request.input('storeLong',db.NVarChar,req.body.storeLong);
        request.input('storephone1',db.NVarChar,req.body.storephone1);
        request.input('storephone2',db.NVarChar,req.body.storephone2);
        request.input('storephone3',db.NVarChar,req.body.storephone3);
        request.input('validity',db.NVarChar,req.body.validity);
        request.execute('prcslashStore',(error,result)=>{
            if(error)
            {
                res.send({
                    "status":"0",
                    "message":"Error occured",
                    "data":{}
                });
            }
            else{
                if(result.rowsAffected == 0)
                {
                    res.send({
                        "status":"0",
                        "message":"Error in adding store",
                        "data":{}
                    });
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"Store is added successfully",
                        "data":result.recordset[0]
                    });
                }
            }
        });
    });
};

exports.StoreList = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var request = new db.Request();
        request.input('ActionType',db.NVarChar,'Select');
        request.execute('prcslashStore',(error,result)=>{
            console.log(result);
            if(error)
            {
                console.log(error)
                res.send({
                    "status":"0",
                    "message":"Error occured",
                    "data":[]
                });
            }
            else{
                console.log(result.recordset[0]['JSON_F52E2B61-18A1-11d1-B105-00805F49916B']);
                if(result.recordset[0]['JSON_F52E2B61-18A1-11d1-B105-00805F49916B'] == 0)
                {
                    res.send({
                        "status":"0",
                        "message":"no store",
                        "data":[]
                    });
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"Store List",
                        "data":Object.values(JSON.parse(result.recordset[0]['JSON_F52E2B61-18A1-11d1-B105-00805F49916B']))
                    });
                }
            }
        });
    });
};

exports.editStore = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var request = new db.Request();
        request.input('ActionType',db.NVarChar,'Update');
        request.input('storeName',db.NVarChar,req.body.storeName);
        request.input('vName',db.NVarChar,req.body.vName);
        request.input('vPhone',db.NVarChar,req.body.vPhone);
        request.input('vEmail',db.NVarChar,req.body.vEmail);
        request.input('state',db.NVarChar,req.body.state);
        request.input('district',db.NVarChar,req.body.district);
        request.input('region',db.NVarChar,req.body.region);
        request.input('storeAddress',db.NVarChar,req.body.storeAddress);
        request.input('storeLat',db.NVarChar,req.body.storeLat);
        request.input('storeLong',db.NVarChar,req.body.storeLong);
        request.input('storephone1',db.NVarChar,req.body.storephone1);
        request.input('storephone2',db.NVarChar,req.body.storephone2);
        request.input('storephone3',db.NVarChar,req.body.storephone3);
        request.input('validity',db.NVarChar,req.body.validity);
        request.input('sid',db.NVarChar,req.body.sid);
        request.execute('prcslashStore',(error,result)=>{
            if(error)
            {
                res.send({
                    "status":"0",
                    "message":"Error occured"
                });
            }
            else{
                if(result.rowsAffected == 0)
                {
                    res.send({
                        "status":"0",
                        "message":"Error in editing Store"
                    });
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"Store is edited successfully"
                    });
                }
            }
        });
    });
};

exports.deleteStore = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var request = new db.Request();
        request.input('ActionType',db.NVarChar,'Delete');
        request.input('sid',db.NVarChar,req.body.sid);
        request.execute('prcslashStore',(error,result)=>{
            if(error)
            {
                res.send({
                    "status":"0",
                    "message":"Error occured"
                });
            }
            else{
                if(result.rowsAffected == 0)
                {
                    res.send({
                        "status":"0",
                        "message":"Error in deleting store"
                    });
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"Store is deleted successfully"
                    });
                }
            }
        });
    });
};

exports.addStorePic = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var profilepics='';
        for(var i=0;i<req.files.length;i++)
        {
            profilepics = profilepics+','+ req.files[i].originalname;
        }
        console.log(profilepics);
        var request = new db.Request();
        request.input('Actiontype',db.NVarChar,'Insert');
        request.input('sid',db.NVarChar,req.body.sid);
        request.input('Imagename',db.NVarChar,profilepics);
        request.execute('prcsellerImages',(error,result)=>{
            if(error)
            {
                console.log(error)
                res.send({
                    "status":"0",
                    "message":"Error occured"
                })
            }
            else{
                if(result.rowsAffected == 0)
                {
                    res.send({
                        "status":"0",
                        "message":"Error in adding images"
                    })
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"Images added successfully"
                    })
                }
            }

        });
    })
};

exports.editStorePic = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var request = new db.Request();
        request.input('Actiontype',db.NVarChar,'Update');
        request.input('Id',db.NVarChar,req.body.Id);
        request.input('sid',db.NVarChar,req.body.sid);
        request.input('Imagename',db.NVarChar,req.file.originalname);
        request.execute('prcsellerImages',(error,result)=>{
            if(error)
            {
                res.send({
                    "status":"0",
                    "message":"Error occured"
                })
            }
            else{
                if(result.rowsAffected == 0)
                {
                    res.send({
                        "status":"0",
                        "message":"Error in updating images"
                    })
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"Images updated successfully"
                    })
                }
            }

        });
    })
};

exports.deleteStorePic = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var request = new db.Request();
        request.input('Actiontype',db.NVarChar,'Delete');
        request.input('Id',db.NVarChar,req.body.Id);
        request.execute('prcstoreImages',(error,result)=>{
            if(error)
            {
                res.send({
                    "status":"0",
                    "message":"Error occured"
                })
            }
            else{
                if(result.rowsAffected == 0)
                {
                    res.send({
                        "status":"0",
                        "message":"Error in deleting images"
                    })
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"Images deleted successfully"
                    })
                }
            }

        });
    })
};


exports.uploadStoreDoc = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var docImages = '';
        for(var i=0;i<req.files.length;i++)
        {
            docImages = docImages+','+ req.files[i].originalname;
        }
        var request = new db.Request();
        request.input('Actiontype',db.NVarChar,'Insert');
        request.input('sid',db.NVarChar,req.body.sid);
        request.input('Docname',db.NVarChar,docImages);
        request.execute('prcstoreDocument',(error,result)=>{
            if(error)
            {
                res.send({
                    "status":"0",
                    "message":"Error occured"+error
                })
            }
            else{
                if(result.rowsAffected == 0)
                {
                    res.send({
                        "status":"0",
                        "message":"Error in adding documents"
                    })
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"Documents added successfully"
                    })
                }
            }

        });
    })
};

exports.editStoreDoc = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var request = new db.Request();
        request.input('Actiontype',db.NVarChar,'Update');
        request.input('sid',db.NVarChar,req.body.sid);
        request.input('Id',db.NVarChar,req.body.Id);
        request.input('Docname',db.NVarChar,req.file.originalname);
        request.execute('prcstoreDocument',(error,result)=>{
            if(error)
            {
                res.send({
                    "status":"0",
                    "message":"Error occured"
                })
            }
            else{
                if(result.rowsAffected == 0)
                {
                    res.send({
                        "status":"0",
                        "message":"Error in editing documents"
                    })
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"Documents edited successfully"
                    })
                }
            }

        });
    })
};

exports.deleteStoreDoc = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var request = new db.Request();
        request.input('Actiontype',db.NVarChar,'Delete');
        request.input('Id',db.NVarChar,req.body.Id);
        request.execute('prcstoreDocument',(error,result)=>{
            if(error)
            {
                res.send({
                    "status":"0",
                    "message":"Error occured"
                })
            }
            else{
                if(result.rowsAffected == 0)
                {
                    res.send({
                        "status":"0",
                        "message":"Error in deleting documents"
                    })
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"Documents deleted successfully"
                    })
                }
            }

        });
    })
};