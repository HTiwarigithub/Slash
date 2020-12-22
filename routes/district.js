exports.addDistrict = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var request = new db.Request();
        request.input('ActionType',db.NVarChar,'Insert');
        request.input('DName',db.NVarChar,req.body.DName);
        request.input('sid',db.NVarChar,req.body.sid);
        request.execute('prcdistrictmaster',(error,result)=>{
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
                        "message":"Error in adding district"
                    });
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"District is added successfully"
                    });
                }
            }
        });
    });
};
exports.districtList = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var request = new db.Request();
        request.input('ActionType',db.NVarChar,'Select');
        request.input('sid',db.NVarChar,req.body.sid);
        request.execute('prcdistrictmaster',(error,result)=>{
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
                        "message":"no district in state",
                        "data":[]
                    });
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"District List",
                        "data":result.recordset
                    });
                }
            }
        });
    });
};
exports.editDistrict = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var request = new db.Request();
        request.input('ActionType',db.NVarChar,'Update');
        request.input('DName',db.NVarChar,req.body.DName);
        request.input('sid',db.NVarChar,req.body.sid);
        request.input('did',db.NVarChar,req.body.did);
        request.execute('prcdistrictmaster',(error,result)=>{
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
                        "message":"Error in updating district"
                    });
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"District is updated successfully"
                    });
                }
            }
        });
    });
};
exports.deleteDistrict = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var request = new db.Request();
        request.input('ActionType',db.NVarChar,'Delete');
        request.input('did',db.NVarChar,req.body.did);
        request.execute('prcdistrictmaster',(error,result)=>{
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
                        "message":"Error in deleting district"
                    });
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"District is deleted successfully"
                    });
                }
            }
        });
    });
};