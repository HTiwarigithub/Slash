exports.addProduct = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var pro_image = '';
        if(req.file == undefined)
        {
            pro_image = '';
        }
        else
        {
            pro_image = req.file.originalname
        }
        var request = new db.Request();
        request.input('ActionType', db.NVarChar, 'Insert');
        request.input('catid', db.NVarChar, req.body.catid);
        request.input('sub_catid', db.NVarChar, req.body.sub_catid);
        request.input('seller_id', db.NVarChar, req.body.seller_id);
        request.input('name', db.NVarChar, req.body.name);
        request.input('pro_image', db.NVarChar, pro_image);
        request.input('description', db.NVarChar, req.body.description);
        request.input('price', db.NVarChar, req.body.price);
        request.input('startRangePrice', db.NVarChar, req.body.startRangePrice);
        request.input('endRangePrice', db.NVarChar, req.body.endRangePrice);
        request.input('brand_id', db.NVarChar, req.body.brand_id);
        request.execute('prcsellerProduct', (error, result) => {
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
                        "message": "Error in adding product"
                    })
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "Product added successfully"
                    })
                }
            }
        });
    });
};

exports.productList = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var request = new db.Request();
        request.input('ActionType', db.NVarChar, 'Select');
        request.input('seller_id', db.NVarChar, req.body.seller_id);
        request.execute('prcsellerProduct', (error, result) => {
            if (error) {
                console.log(error)
                res.send({
                    "status": "0",
                    "message": "Error Occured",
                    "data":[]
                })
            }
            else {
                console.log(result);
                if (result.recordset == 0) {
                    res.send({
                        "status": "0",
                        "message": "no product in list",
                        "data":[]
                    })
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "Product list",
                        "data":result.recordset
                    })
                }
            }
        });
    });
};

exports.editProduct = (req, res) => {
    db.close();
    db.connect(conn, () => {
        if(req.file == undefined)
        {
            var pro_image = 'No'
        }
        else{
            var pro_image = req.file.originalname
        }
        var request = new db.Request();
        request.input('ActionType', db.NVarChar, 'Update');
        request.input('catid', db.NVarChar, req.body.catid);
        request.input('sub_catid', db.NVarChar, req.body.sub_catid);
        request.input('seller_id', db.NVarChar, req.body.seller_id);
        request.input('name', db.NVarChar, req.body.name);
        request.input('pro_image', db.NVarChar, pro_image);
        request.input('description', db.NVarChar, req.body.description);
        request.input('price', db.NVarChar, req.body.price);
        request.input('startRangePrice', db.NVarChar, req.body.startRangePrice);
        request.input('endRangePrice', db.NVarChar, req.body.endRangePrice);
        request.input('brand_id', db.NVarChar, req.body.brand_id);
        request.input('pid', db.NVarChar, req.body.pid);
        request.execute('prcsellerProduct', (error, result) => {
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
                        "message": "Error in updating product detail"
                    })
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "Product updated successfully"
                    })
                }
            }
        });
    });
};

exports.deleteProduct = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var request = new db.Request();
        request.input('ActionType', db.NVarChar, 'Delete');
        request.input('pid', db.NVarChar, req.body.pid);
        request.execute('prcsellerProduct', (error, result) => {
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
                        "message": "Error in deleting product"
                    })
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "Product deleted successfully"
                    })
                }
            }
        });
    });
};


exports.addBrand = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var request = new db.Request();
        request.input('name', db.NVarChar, req.body.name);
        request.input('ActionType',db.NVarChar,'Add');
        request.execute('prcslashBrand', (error, result) => {
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
                        "message": "Error in adding brand"
                    })
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "Brand added successfully"
                    })
                }
            }
        });
    });
};


exports.selectBrand = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var request = new db.Request();
        request.input('ActionType',db.NVarChar,'Select');
        request.execute('prcslashBrand', (error, result) => {
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
                        "message": "Error in adding brand"
                    })
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "Brand added successfully",
                        "data":result.recordset
                    })
                }
            }
        });
    });
};



exports.editBrand = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var request = new db.Request();
        request.input('ActionType',db.NVarChar,'Edit');
        request.input('brand_id',db.NVarChar, req.body.brand_id);
        request.input('brand_name',db.NVarChar, req.body.brand_name);
        request.execute('prcslashBrand', (error, result) => {
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
                        "message": "Error in adding brand"
                    })
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "Brand Edited successfully",
                        "data":result
                    })
                }
            }
        });
    });
};