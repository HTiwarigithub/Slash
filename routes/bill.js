exports.addBill = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var request = new db.Request();
        request.input('ActionType',db.NVarChar,'Insert');
        request.input('shop_id',db.NVarChar,req.body.shop_id);
        request.input('customer_name',db.NVarChar,req.body.customer_name);
        request.input('bill_number',db.NVarChar,req.body.bill_number);
        request.input('bill_amount',db.NVarChar,req.body.bill_amount);
        request.execute('prcbill',(error,result)=>{
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
                        "message":"Error in adding bill"
                    })
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"Bill added successfully"
                    })
                }
            }
        });
    });
};

exports.shopBillList = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var request = new db.Request();
        request.input('ActionType',db.NVarChar,'SelectByShop');
        request.input('shop_id',db.NVarChar,req.body.shop_id);
        request.execute('prcbill',(error,result)=>{
            if(error)
            {
                res.send({
                    "status":"0",
                    "message":"Error Occured",
                    "data":[]
                })
            }
            else{
                if(result.recordset == 0)
                {
                    res.send({
                        "status":"0",
                        "message":"No bill",
                        "data":[]
                    })
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"Bill list",
                        "data":result.recordset
                    })
                }
            }
        });
    });
};
