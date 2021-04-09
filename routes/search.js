exports.Search = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var request = new db.Request();
        request.input('ActionType', db.NVarChar, 'Search_list');
        request.input('store_Name', db.NVarChar, req.body.storeName);
        request.input('brand_Name', db.NVarChar, req.body.brand_name);
        request.input('prodcut_Name', db.NVarChar, req.body.name);
        request.execute('prc_Search', (error, result) => {
            if (error) {
                console.log("heyyyyyyyyyyyyy",error)
                res.send({
                    "status": "0",
                    "message": "Error occured",
                    "data": {}
                });
            }
            else {
                if (result.recordset == 0) {
                    res.send({
                        "status": "0",
                        "message": "No Result",
                        "data": {}
                    });
                }
                else {
                    var list1 = [];
                    var list2 = [];
                    count = result.recordset.length;
                    result.recordset.forEach(element => {
                        
                        if (!contains(list1,element.vid)){
                            list1.push(element.vid)
                            list2.push(element)
                        }
                    });
                    
                    res.send({
                        "status": "1",
                        "message": "Search Result",
                        "data": list2
                    });
                }
            }
        });
    });
};

function contains(a, obj) {
    var i = a.length;
    while (i--) {
       if (a[i] === obj) {
           return true;
       }
    }
    return false;
}

exports.Searchphone = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var request = new db.Request();
        request.input('ActionType', db.NVarChar, 'Search');
        request.input('store_Name', db.NVarChar, req.body.storeName);
        request.execute('prc_Search', (error, result) => {
            if (error) {
                res.send({
                    "status": "0",
                    "message": "Error occured",
                    "data": {}
                });
            }
            else {
                if (result.recordset[0]['JSON_F52E2B61-18A1-11d1-B105-00805F49916B'] == 0) {
                    res.send({
                        "status": "0",
                        "message": "No Result",
                        "data": {}
                    });
                }
                else {
                    console.log("hiiiiiiii",result.recordset[0])
                    res.send({
                        "status": "1",
                        "message": "Search Result",
                        "data": Object.values(JSON.parse(result.recordset[0]['JSON_F52E2B61-18A1-11d1-B105-00805F49916B']))
                    });
                }
            }
        });
    });
};

exports.Select = (req, res) => {
    
    db.close();
    db.connect(conn, () => {
        var request = new db.Request();
        request.input('ActionType', db.NVarChar, 'Select_data');
        request.input('page_no',db.Int,req.body.page_no);
        request.execute('prc_Search', (error, result) => {
            if (error) {
                res.send({
                    "status": "0", 
                    "message": "Error occured",
                    "data": {}
                });
            }
            else {
                if (result.recordset[0]['JSON_F52E2B61-18A1-11d1-B105-00805F49916B'] == 0) {
                    res.send({
                        "status": "0",
                        "message": "No Result",
                        "data": {}
                    });
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "Search Result",
                        "data": Object.values(JSON.parse(result.recordset[0]['JSON_F52E2B61-18A1-11d1-B105-00805F49916B']))
                    });
                }
            }
        });
    });
};