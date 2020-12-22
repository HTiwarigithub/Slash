
exports.addOffer = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var request = new db.Request();
        request.input('ActionType',db.NVarChar,'Insert');
        request.input('sid',db.NVarChar,req.body.sid);
        request.input('title',db.NVarChar,req.body.title);
        request.input('description',db.NVarChar,req.body.description);
        request.input('pids',db.NVarChar,req.body.pids);
        request.input('bids',db.NVarChar,req.body.bids);
        request.input('cids',db.NVarChar,req.body.cids);
        request.execute('prcSellerOffer',(error,result)=>{
            if(error){
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
                        "message":"Error in adding offer"
                    })
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"Offer Added successfully"
                    })
                }
            }
        });
    });
};

exports.getOfferList = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var request = new db.Request();
        request.input('ActionType',db.NVarChar,'Select')
        request.input('sid',db.NVarChar,req.body.sid);
        request.execute('prcSellerOffer',(error,result)=>{
            if(error)
            {
                res.send({
                    "status":"0",
                    "message":"Error occured",
                    "data":[]
                })
            }
            else{
                if(result.recordset[0]["JSON_F52E2B61-18A1-11d1-B105-00805F49916B"] == 0)
                {
                    res.send({
                        "status":"0",
                        "message":"No offer",
                        "data":[]
                    })
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"Offer list",
                        "data":Object.values(JSON.parse(result.recordset[0]["JSON_F52E2B61-18A1-11d1-B105-00805F49916B"]))
                    })
                }
            }
        });
    })
};

exports.editOffer = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var request = new db.Request();
        request.input('ActionType',db.NVarChar,'Update');
        request.input('id',db.NVarChar,req.body.oid);
        request.input('sid',db.NVarChar,req.body.sid);
        request.input('title',db.NVarChar,req.body.title);
        request.input('description',db.NVarChar,req.body.description);
        request.input('pids',db.NVarChar,req.body.pids);
        request.input('bids',db.NVarChar,req.body.bids);
        request.input('cids',db.NVarChar,req.body.cids);
        request.input('deletePids',db.NVarChar,req.body.deletePids);
        request.input('deleteBids',db.NVarChar,req.body.deleteBids);
        request.input('deleteCids',db.NVarChar,req.body.deleteCids);
        request.execute('prcSellerOffer',(error,result)=>{
            if(error){
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
                        "message":"Error in updating offer"
                    })
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"Offer updated successfully"
                    })
                }
            }
        });
    });
};

exports.deleteOffer = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var request = new db.Request();
        request.input('ActionType',db.NVarChar,'Delete');
        request.input('id',db.NVarChar,req.body.oid);
        request.execute('prcSellerOffer',(error,result)=>{
            if(error){
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
                        "message":"Error in deleting offer"
                    })
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"Offer deleted successfully"
                    })
                }
            }
        });
    });
}