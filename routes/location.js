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