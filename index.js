var express = require('express')
// var fcm = require('fcm-notification');
// var FCM = new fcm('./fcmkey/fcmActivationKey.json');
var http = require('http');
var path = require('path');
var app = express();
var bodyParser=require("body-parser");
var multer = require('multer');
var vendor = require('./routes/vendor');
var state = require('./routes/state');
var district = require('./routes/district');
var region = require('./routes/region');
var product = require('./routes/product');
var offer = require('./routes/offer');
var bill = require('./routes/bill');
var banner = require('./routes/banner');
var store = require('./routes/store');
var user = require('./routes/user');
var brands = require('./routes/brand');
var category = require('./routes/category');
var userBill = require('./routes/userBill');
var storeMaster = require('./routes/storemaster');
var search = require('./routes/search')
var pay = require('./routes/payment');
const DIR = './uploads';
const DIR1 = './documents';


let storage = multer.diskStorage({
  destination: function (req, file, callback) {
    callback(null, DIR);
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname );
  }
});
  
let storage1 = multer.diskStorage({
  destination: function (req, file, callback) {
    callback(null, DIR1);
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname );
  }
});
  
  let upload = multer({storage: storage});
  let upload1 = multer({storage: storage1});

var mssql    = require('mssql');
const { request } = require('express');
var connection = {
    server: 'slashdatabase.c9upxxk6xutb.us-east-2.rds.amazonaws.com',
    user: 'slashDatabase',
    password: 'slashDatabase',
    database : 'slash',
    options: {
        enableArithAbort: false
      }
};


mssql.connect(connection,function(err,result) {
if(err)
console.log(err);
else
console.log("result");
});
// global.Fcm = FCM;
global.db = mssql;
global.conn = connection;


app.set('hostname', process.env.Host );
app.set('port', process.env.PORT || 4500);
app.set('views', __dirname + '/views');
app.use('/Image/resources',express.static(__dirname + '/uploads'));
app.use('/Doc/resources',express.static(__dirname + '/documents'));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
	  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
	  next();
});

http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port '+ app.get('port'));
});

var router = express.Router();
app.get('/', function (req, res) {
    res.send('this is the main Page Slash');
});

app.use('/api', router);
router.get('', function(req, res) {
  res.send("This is testing api urls");
});

router.post('/Vendor/addVendor',upload.single('file'),vendor.addVendor);
router.get('/Vendor/vendorList',vendor.vendorList);
router.post('/Vendor/vendorListApp',vendor.vendorListApp);  
router.post('/Vendor/vendorPaymentUpdate',vendor.updatepayment);
router.post('/Vendor/editVendor',upload.single('file'),vendor.editVendor);
router.post('/Vendor/deleteVendor',vendor.deleteVendor);
router.post('/Vendor/vendorLogin',vendor.vendorLogin);
router.post('/Vendor/submitOtp',vendor.submit_otp);
router.post('/Vendor/storebyType',vendor.storebyType);

router.post('/Vendor/profilePic',upload.array('file'),vendor.addProfilePic)
router.post('/Vendor/editProfilePic',upload.single('file'),vendor.editProfilePic)
router.post('/Vendor/deleteProfilePic',vendor.deleteProfilePic);
router.post('/Vendor/uploadDoc',upload1.array('doc'),vendor.uploadDoc)
router.post('/Vendor/editDoc',upload1.single('doc'),vendor.editDoc)
router.post('/Vendor/deleteDoc',vendor.deleteDoc);



router.post('/Store/addStore',store.addStore);
router.get('/Store/StoreList',store.StoreList);
router.post('/Store/editStore',store.editStore);
router.post('/Store/deleteStore',store.deleteStore);

router.post('/Store/addStorePic',upload.array('file'),store.addStorePic)
router.post('/Store/editStorePic',upload.single('file'),store.editStorePic)
router.post('/Store/deleteStorePic',store.deleteStorePic);
router.post('/Store/uploadStoreDoc',upload1.array('doc'),store.uploadStoreDoc)
router.post('/Store/editStoreDoc',upload1.single('doc'),store.editStoreDoc)
router.post('/Store/deleteStoreDoc',store.deleteStoreDoc);


router.post('/State/addState',state.addState);
router.get('/State/stateList',state.stateList);
router.post('/State/editState',state.editState);
router.post('/State/deleteState',state.deleteState);


router.post('/District/addDistrict',district.addDistrict);
router.post('/District/districtList',district.districtList);
router.post('/District/editDistrict',district.editDistrict);
router.post('/District/deleteDistrict',district.deleteDistrict);


router.post('/Region/addRegion',region.addRegion);
router.post('/Region/regionList',region.regionList);
router.post('/Region/editRegion',region.editRegion);
router.post('/Region/deleteRegion',region.deleteRegion);

router.post('/Product/addProduct',upload.single('file'),product.addProduct);
router.post('/Product/editProduct',upload.single('file'),product.editProduct);
router.post('/Product/productList',product.productList);
router.post('/Product/deleteProduct',product.deleteProduct);
router.post('/Product/addBrand',product.addBrand);
router.get('/Product/AllBrand',product.selectBrand);
router.post('/Product/EditBrand',product.editBrand);

router.post('/Offer/addOffer',offer.addOffer);
router.post('/Offer/getOfferList',offer.getOfferList);
router.post('/Offer/editOffer',offer.editOffer);
router.post('/Offer/deleteOffer',offer.deleteOffer);

router.post('/Bill/addBill',bill.addBill);  
router.post('/Bill/shopBillList',bill.shopBillList);

router.post('/Userbill/addBill',userBill.addBill)
//select Bill amount
router.post('/Userbill/Selectbill',userBill.Selectbill)

router.post('/Userbill/uploadbillImage',userBill.uploadbillImage)
router.post('/Userbill/getBillList',userBill.getBillList)
router.post('/Userbill/getBillListShop',userBill.getBillListShop)

router.post('/Banner/addbanner',upload.single('file'),banner.addbanner);
router.get('/Banner/bannerList',banner.bannerList);
router.post('/Banner/shopBannerList',banner.shopBannerList);
router.post('/Banner/editbanner',upload.single('file'),banner.editbanner);
router.post('/Banner/deletebanner',banner.deletebanner);


router.post('/User/userSignup',user.userSignup);
router.post('/User/login',user.login);
router.post('/User/socialLogin',user.socialLogin);
router.post('/User/submitOtp',user.submitOtp);
router.post('/User/resendOtp',user.resendOtp);
router.post('/User/editProfile',user.editProfile);
router.post('/User/deleteProfile',user.deleteProfile);
router.get('/User/allList',user.allList);
router.get('/User/AllUser',user.getAll);
// update image of user
router.post('/User/UpdateImage',user.UpdateImage);
//name update
router.post('/User/UpdateName',user.UpdateName);

router.get('/Brand/getBrandList',brands.getBrandList);
router.get('/category/getCategoryList',category.getCategoryList);
router.post('/category/SelectBystoretype',category.SelectBystoretype);
router.post('/category/addCategory',category.addCategory);
router.post('/category/editCategory',category.editCategory);
router.post('/StoreMaster/addStoreType',storeMaster.addStoreType);
router.post('/StoreMaster/editStoreType',storeMaster.editStoreType);
router.post('/StoreMaster/deleteStoreType',storeMaster.deleteStoreType);
router.get('/StoreMaster/getStoreTypeList',storeMaster.getStoreTypeList);
router.post('/Payment/createPayment',pay.createPayment);
router.post('/Payment/paymentTransaction',pay.paymentTransaction);

//Search
router.post('/search/Search',search.Search);



router.post('/Admin/adminLogin',(req,res)=>{
  db.close();
  db.connect(conn,()=>{
    var request = new db.Request();
    request.input('ActionType',db.NVarChar,'Login');
    request.input('email',db.NVarChar,req.body.email);
    request.input('password',db.NVarChar,req.body.password);
    request.execute('prcadmin',(error,result)=>{
      if(error)
      {
        res.send({
          "status":"0",
          "message":"Error occured"
        })
      }
      else{
        if(result.recordset == 0)
        {
          res.send({
            "status":"0",
            "message":"Incorrect email or password"
          })
        }
        else
        {
          res.send({
            "status":"1",
            "message":"Login successful"
          })
        }
      }
    });
  });
})


