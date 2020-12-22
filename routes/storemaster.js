exports.addStoreType = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var request = new db.Request();
        request.input('ActionType',db.NVarChar,'Insert');
        request.input('storeType',db.NVarChar,req.body.storeType);
        request.execute('prcStoreType',(error,result)=>{
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
                        "message":"Error in adding store type"
                    })
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"New Store type added successfully"
                    })
                }
            }
        })
    })
}
exports.getStoreTypeList = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var request = new db.Request();
        request.query('SELECT * FROM storeMaster',(error,result)=>{
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
                        "message":"no store type",
                        "data":[]
                    })
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"Store type List",
                        "data":result.recordset
                    })
                }
            }
        });
    })
}
exports.editStoreType = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var request = new db.Request();
        request.input('ActionType',db.NVarChar,'Update');
        request.input('storeType',db.NVarChar,req.body.storeType);
        request.input('id',db.NVarChar,req.body.id);
        request.execute('prcStoreType',(error,result)=>{
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
                        "message":"Error in updating store type"
                    })
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"Store type updated successfully"
                    })
                }
            }
        })
    })
}

exports.deleteStoreType = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var request = new db.Request();
        request.input('ActionType',db.NVarChar,'Delete');
        request.input('id',db.NVarChar,req.body.id);
        request.execute('prcStoreType',(error,result)=>{
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
                        "message":"Error in deleting store type"
                    })
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"Store type deleted successfully"
                    })
                }
            }
        })
    })
}