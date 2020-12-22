exports.addBill = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var request = new db.Request();
        request.input('ActionType',db.NVarChar,'Insert');
        request.input('uid',db.NVarChar,req.body.uid);
        request.input('sid',db.NVarChar,req.body.sid);
        request.input('bill_amount',db.NVarChar,req.body.bill_amount);
        request.input('bill_pic',db.VarChar,req.body.file);
        request.execute('prcUserBill',(error,result)=>{
            if(error)
            {
                res.send({
                    "status":"0",
                    "message":"Error Occured",
                    "data":{}
                })
            }
            else{
                if(result.rowsAffected == 0)
                {
                    res.send({
                        "status":"0",
                        "message":"Error in adding bill",
                        "data":{}
                    })
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"Bill added successfully",
                        "daat":result.recordset[0]
                    })
                }
            }
        });
    });
};

exports.uploadbillImage = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var billpics = req.body.file;
        var request = new db.Request();
        request.input('ActionType',db.NVarChar,'Insert');
        request.input('bill_id',db.NVarChar,req.body.bill_id);
        request.input('bill_pic',db.VarChar,req.body.bill_pic);
        request.execute('prcUserBill',(error,result)=>{
            if(error)
            {
                res.send({
                    "status":"0",
                    "message":"Error Occured"
                })
            }
            else{
                if(result.rowsAffected == 0)
                {
                    res.send({
                        "status":"0",
                        "message":"Error in adding bill image"
                    })
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"Bill image added successfully"
                    })
                }
            }
        });
    });
};

exports.getBillList = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var request = new db.Request();
        request.input('ActionType',db.NVarChar,'Select');
        request.input('uid',db.NVarChar,req.body.uid);
        request.execute('prcUserBill',(error,result)=>{
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
                        "message":"no bill",
                        "data":[]
                    });
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"Bill List",
                        "data":Object.values(JSON.parse(result.recordset[0]['JSON_F52E2B61-18A1-11d1-B105-00805F49916B']))
                    });
                }
            }
        });
    });
};

exports.getBillListShop = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var request = new db.Request();
        request.input('ActionType',db.NVarChar,'BillShop');
        request.input('sid',db.NVarChar,req.body.sid);
        request.execute('prcUserBill',(error,result)=>{
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
                        "message":"no bill",
                        "data":[]
                    });
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"Bill List",
                        "data":Object.values(JSON.parse(result.recordset[0]['JSON_F52E2B61-18A1-11d1-B105-00805F49916B']))
                    });
                }
            }
        });
    });
};


exports.Selectbill = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var request = new db.Request();
        request.input('ActionType',db.NVarChar,'Select_amount');
        request.input('uid',db.NVarChar,req.body.uid);
        request.execute('prcUserBill',(error,result)=>{
            if(error)
            {
                res.send({
                    "status":"0",
                    "message":"Error Occured",
                    "data":{}
                })
            }
            else{
                if(result.rowsAffected == 0)
                {
                    res.send({
                        "status":"0",
                        "message":"Cannot Add Amount.",
                        "data":{}
                    })
                }
                else{
                  var tempsum = 0
                  result.recordset.forEach(function(amount) { 

                      if (isInt(parseInt(amount.bill_amount))!== false){

                        tempsum = parseInt(amount.bill_amount) + tempsum 
                    }  
                });
                tempsum = tempsum/100
                {
                    res.send({
                        "status":"1",
                        "message":"Redeem",
                        "data":tempsum
                    })
                }

                }
            }
        });
    });
};

function isInt(value) {
    return !isNaN(value) && 
           parseInt(Number(value)) == value && 
           !isNaN(parseInt(value, 10));
  }