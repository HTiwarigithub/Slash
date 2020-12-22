exports.addbanner = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var request = new db.Request();
        request.input('ActionType', db.NVarChar, 'Insert');
        request.input('shop_id', db.NVarChar, req.body.shop_id);
        request.input('shop_name', db.NVarChar, req.body.shop_name);
        request.input('title', db.NVarChar, req.body.title);
        request.input('banner_image', db.NVarChar, req.file.originalname);
        request.input('valid_till', db.NVarChar, req.body.valid_till);
        request.input('region', db.NVarChar, req.body.region);
        request.execute('prcbanner', (error, result) => {
            if (error) {
                res.send({
                    "status": "0",
                    "message": "Error Occured"
                });
            }
            else {
                if (result.rowsAffected == 0) {
                    res.send({
                        "status": "0",
                        "message": "Error in adding banner"
                    });
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "Banner added successfully"
                    });
                }
            }
        });
    });
};

exports.bannerList = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var request = new db.Request();
        request.input('ActionType', db.NVarChar, 'Select');
        request.execute('prcbanner', (error, result) => {
            if (error) {
                res.send({
                    "status": "0",
                    "message": "Error Occured",
                    "data": []
                });
            }
            else {
                if (result.recordset == 0) {
                    res.send({
                        "status": "0",
                        "message": "no banner",
                        "data": []
                    });
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "Banner list",
                        "data": result.recordset
                    });
                }
            }
        });
    });
};

exports.shopBannerList = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var request = new db.Request();
        request.input('ActionType', db.NVarChar, 'SelectByShop');
        request.input('shop_id', db.NVarChar, req.body.shop_id);
        request.execute('prcbanner', (error, result) => {
            if (error) {
                res.send({
                    "status": "0",
                    "message": "Error Occured",
                    "data": []
                });
            }
            else {
                if (result.recordset == 0) {
                    res.send({
                        "status": "0",
                        "message": "no banner",
                        "data": []
                    });
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "Banner list",
                        "data": result.recordset
                    });
                }
            }
        });
    });
};
exports.editbanner = (req, res) => {
    db.close();
    db.connect(conn, () => {
        if (req.file == undefined) {
            var banner_image = 'NO'
        }
        else {
            var banner_image = req.file.originalname;
        }
        var request = new db.Request();
        request.input('ActionType', db.NVarChar, 'Update');
        request.input('banner_id', db.NVarChar, req.body.banner_id);
        request.input('shop_id', db.NVarChar, req.body.shop_id);
        request.input('shop_name', db.NVarChar, req.body.shop_name);
        request.input('title', db.NVarChar, req.body.title);
        request.input('banner_image', db.NVarChar, banner_image);
        request.input('valid_till', db.NVarChar, req.body.valid_till);
        request.input('region', db.NVarChar, req.body.region);
        request.execute('prcbanner', (error, result) => {
            if (error) {
                res.send({
                    "status": "0",
                    "message": "Error Occured"
                });
            }
            else {
                if (result.rowsAffected == 0) {
                    res.send({
                        "status": "0",
                        "message": "Error in updating banner"
                    });
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "Banner updated successfully"
                    });
                }
            }
        });
    });
};

exports.deletebanner = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var request = new db.Request();
        request.input('ActionType', db.NVarChar, 'Delete');
        request.input('banner_id', db.NVarChar, req.body.banner_id);
        request.execute('prcbanner', (error, result) => {
            if (error) {
                res.send({
                    "status": "0",
                    "message": "Error Occured"
                });
            }
            else {
                if (result.rowsAffected == 0) {
                    res.send({
                        "status": "0",
                        "message": "Error in deleting banner"
                    });
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "Banner deleted successfully"
                    });
                }
            }
        });
    });
};
