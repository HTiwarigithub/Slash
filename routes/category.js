exports.getCategoryList = (req,res)=>{
    db.close();
    db.connect(conn,()=>{
        var request = new db.Request();
        request.query('select slashCategoryMaster.id as cid , slashCategoryMaster.Category_name,slashCategoryMaster.storeType, storeMaster.id as sid,storeMaster.storeType_name  from slashCategoryMaster left join storeMaster on slashCategoryMaster.StoreType = storeMaster.id  ORDER BY slashCategoryMaster.id DESC',(error,result)=>{
            console.log(error)
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
                        "message":"no category",
                        "data":[]
                    })
                }
                else{
                    res.send({
                        "status":"1",
                        "message":"Category List",
                        "data":result.recordset
                    })
                }
            }
        });
    })
}


exports.addCategory = (req, res) => {
    console.log("helllo db");
    db.close();
    db.connect(conn, () => {
        var request = new db.Request();
        request.input('ActionType',db.NVarChar,'Add');
        request.input('store_type',db.NVarChar, req.body.store_type);
        request.input('category_name',db.NVarChar, req.body.category_name);
        request.execute('prcslashcategory', (error, result) => {
            console.log()
            if (error) {
                res.send({
                    "status": "0",
                    "message": "Error Occured"
                })
            }
            else {
                if (result.rowsAffected == 0) {
                    res.send({
                        "status": "0",
                        "message": "Error in adding Category"
                    })
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "Category Added successfully",
                    })
                }
            }
        });
    });
};

exports.editCategory = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var request = new db.Request();
        request.input('ActionType',db.NVarChar,'Edit');
        request.input('store_type',db.NVarChar, req.body.store_type);
        request.input('category_name',db.NVarChar, req.body.category_name);
        request.input('id',db.NVarChar, req.body.id);
        request.execute('prcslashcategory', (error, result) => {
            console.log()
            if (error) {
                res.send({
                    "status": "0",
                    "message": "Error Occured"
                })
            }
            else {
                if (result.rowsAffected == 0) {
                    res.send({
                        "status": "0",
                        "message": "Error in adding Category"
                    })
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "Category Edited successfully"
                    })
                }
            }
        });
    });
};

exports.SelectBystoretype = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var request = new db.Request();
        request.input('ActionType',db.NVarChar,'Store_By_Category');
        request.input('storeType',db.NVarChar, req.body.storeType);
        request.execute('prcslashcategory', (error, result) => {
            console.log(error)
            if (error) {
                res.send({
                    "status": "0",
                    "message": "Error Occured"
                })
            }
            else {
                    res.send({
                        "status": "1",
                        "message": "Category Edited successfully",
                        "data":result.recordset
                    })
            }
        });
    });
};