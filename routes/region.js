exports.addRegion = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var request = new db.Request();
        request.input('ActionType',db.NVarChar,'Insert');
        request.input('RName',db.NVarChar,req.body.RName);
        request.input('did',db.NVarChar,req.body.did);
        request.execute('prcregionmaster',(error,result)=>{
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
                        "message":"Error in adding region"
                    });
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"Region is added successfully"
                    });
                }
            }
        });
    });
};
exports.regionList = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var request = new db.Request();
        request.input('ActionType',db.NVarChar,'Select');
        request.input('did',db.NVarChar,req.body.did);
        request.execute('prcregionmaster',(error,result)=>{
            if(error)
            {
                res.send({
                    "status":"0",
                    "message":"Error occured",
                    "data":[]
                });
            }
            else{
                if(result.recordset == 0)
                {
                    res.send({
                        "status":"0",
                        "message":"no region in district",
                        "data":[]
                    });
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"Region List",
                        "data":result.recordset
                    });
                }
            }
        });
    });
};
exports.editRegion = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var request = new db.Request();
        request.input('ActionType',db.NVarChar,'Update');
        request.input('RName',db.NVarChar,req.body.RName);
        request.input('did',db.NVarChar,req.body.did);
        request.input('rid',db.NVarChar,req.body.rid);
        request.execute('prcregionmaster',(error,result)=>{
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
                        "message":"Error in updating region"
                    });
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"Region is updated successfully"
                    });
                }
            }
        });
    });
};
exports.deleteRegion = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var request = new db.Request();
        request.input('ActionType',db.NVarChar,'Delete');
        request.input('rid',db.NVarChar,req.body.rid);
        request.execute('prcregionmaster',(error,result)=>{
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
                        "message":"Error in deleting region"
                    });
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"Region is deleted successfully"
                    });
                }
            }
        });
    });
};