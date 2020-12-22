const Razorpay = require('razorpay');
var instance = new Razorpay({
    key_id: 'rzp_live_wNEdJ9euRUjy7e',
    key_secret: 'PkHAfGFPvEsFR2kopQZvW5B1'
  })
module.exports.createPayment = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var amount = req.body.amount;
        var paymode = req.body.paymode;
        var datetime = new Date().toLocaleString();
        var vid = req.body.vid;
        var request = new db.Request();
        request.input('ActionType', db.NVarChar(50), 'insert');
        request.input('orderamount', db.NVarChar(255), amount);
        request.input('paymode', db.NVarChar(255), paymode);
        request.input('datetime', db.NVarChar(255), datetime);
        request.input('vid', db.NVarChar(255), vid);
        request.execute('prcvendorPayment', function (error, results) {
            if (error) {
                console.log(error)
                res.send({
                    "status": "0",
                    "message": "Error Ocurred",
                    "data":{}
                })

            }
            else {
                if (results.rowsAffected == 0) {
                    res.send({
                        "status": "0",
                        "message": "Error in payment",
                        "data":{}
                    })
                }
                else {
                    var options = {
                        amount: parseInt(req.body.amount),  // amount in the smallest currency unit
                        currency: "INR",
                        receipt: results.recordset[0].orderId,
                        payment_capture: '1'
                      };
                      instance.orders.create(options, function(err, order) {
                          if(err)
                          {
                            console.log(err);
                            res.send({
                                "status": "0",
                                "message": "Error occured",
                                "data":{},
                                "razorpayRes":err
                            })
                          }
                          else{
                            console.log(order);
                            res.send({
                                "status": "1",
                                "message": "pay your registration fee",
                                "data":results.recordset[0],
                                "razorpayRes":order
                            })
                          }
                      });
                    
                }
            }
        });
    });
};


module.exports.paymentTransaction = (req, res) => {
    db.close();
    db.connect(conn, () => {
        var transactionId = req.body.transactionId;
        var orderstatus = req.body.orderstatus;
        var orderId = req.body.orderId;
        var request = new db.Request();
        request.input('ActionType', db.NVarChar(50), 'ordertransaction');
        request.input('transactionId', db.NVarChar(255), transactionId);
        request.input('orderstatus', db.NVarChar(255), orderstatus);
        request.input('orderId', db.NVarChar(255), orderId);
        request.execute('prcvendorPayment', function (error, results) {
            if (error) {
                console.log(error)
                res.send({
                    "status": "0",
                    "message": "Error Ocurred"
                })

            }
            else {
                if (results.rowsAffected == 0) {
                    res.send({
                        "status": "0",
                        "message": "Error in paying registration fee"
                    })
                }
                else {
                    res.send({
                        "status": "1",
                        "message": "registration fee paid successfully"
                    })
                }
            }
        });
    });
};