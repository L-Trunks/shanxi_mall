import { _mysql } from "./mysql"
const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const fs = require('fs');
const formidable = require('formidable');
var multer = require('multer');
//生成的图片放入uploads文件夹下
var upload = multer({ dest: 'upload/' })
const path = require('path');
app.use('/public', express.static('public'));
app.use(bodyParser.json()); // for parsing application/json
app.use(bodyParser.urlencoded({ extended: true })); // for parsing application/x-www-form-urlencoded
//设置跨域
app.all('*', function (req, res, next) {
   res.header("Access-Control-Allow-Origin", "*");
   res.header("Access-Control-Allow-Headers", "Accept,Accept-Encoding,Accept-Language,Connection,Content-Length,Content-Type, Cookie,Host,Origin,Referer,User-Agent, Authorization,X-Requested-With");
   res.header("Access-Control-Allow-Methods", "PUT,POST,GET,DELETE,OPTIONS");
   res.header("X-Powered-By", ' 3.2.1');
   res.header("Content-Type", "application/json;charset=utf-8");
   res.header("Access-Control-Allow-Credentials", "true")
   next();
});

//登录
app.post('/api/mall/user/login', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.userLogin(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '登录失败,请检查输入格式' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "登录成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '登录成功', data: data })
      }
      mysql.close()
   })
})

//注册
app.post('/api/mall/user/register', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.addUser(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '注册失败,请检查输入格式' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "注册成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '注册成功', data: data })
      }
      mysql.close()
   })
})
//判断手机号是否存在
app.get('/api/mall/user/is_have_phone', function (req, res, next) {
   let getdata = JSON.parse(req.query.params)
   let mysql = new _mysql(getdata)
   mysql.selectUser(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '服务器跑丢了' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "获取成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '获取成功', data: data })
      }
      mysql.close()
   })
})
//开通店铺
app.post('/api/mall/user/add_shop', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.addShop(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '添加失败,请检查输入格式' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "开通店铺成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '开通店铺成功', data: data })
      }
      mysql.close()
   })
})
//获取用户信息
app.post('/api/mall/user/get_user_info', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.getUserById(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '获取失败' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "获取用户信息成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '获取用户信息成功', data: data })
      }
      mysql.close()
   })
})
//获取用户列表
app.post('/api/mall/user/get_user_list', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.getUserList(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '获取失败' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "获取用户列表成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '获取用户列表成功', data: data })
      }
      mysql.close()
   })
})
//用户permission权限，0:普通用户，１：申请成为卖家中，２：管理员，３：卖家用户，４，该用户已被封禁
//申请成为商家
app.post('/api/mall/user/user_get_shop', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.addShopUser(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "申请成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '申请成功', data: data })
      }
      mysql.close()
   })
})

//批准成为商家
app.post('/api/mall/user/user_get_shop_ask', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.addShopUserAsk(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "批准成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '批准成功', data: data })
      }
      mysql.close()
   })
})
//封禁用户
app.post('/api/mall/user/ban_user', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.banUser(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "批准成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '批准成功', data: data })
      }
      mysql.close()
   })
})
//解禁用户
app.post('/api/mall/user/un_ban_user', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.unBanUser(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "批准成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '批准成功', data: data })
      }
      mysql.close()
   })
})
//搜索
app.post('/api/mall/user/search', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.searchGoods(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "搜索成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '搜索成功', data: data })
      }
      mysql.close()
   })
})
//修改个人资料
app.post('/api/mall/user/update_user_info', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.update_user_info(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "修改个人信息成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '修改个人信息成功', data: data })
      }
      mysql.close()
   })
})
//获取所有商品列表
app.get('/api/mall/goods/get_all_goods', function (req, res, next) {
   // let getdata = JSON.parse(req.query.params);
   let mysql = new _mysql()
   mysql.getAllGoodsList(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "获取所有商品列表成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '获取所有商品列表成功', data: data })
      }
      mysql.close()
   })
})
//根据分类获取商品列表
app.get('/api/mall/goods/get_goods_by_sort', function (req, res, next) {
   let getdata = JSON.parse(req.query.params);
   let mysql = new _mysql(getdata)
   mysql.getGoodsBySort(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "获取商品列表成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '获取商品列表成功', data: data })
      }
      mysql.close()
   })
})

//根据id获取商品信息
app.get('/api/mall/goods/get_goods_by_id', function (req, res, next) {
   let getdata = JSON.parse(req.query.params);
   let mysql = new _mysql(getdata)
   mysql.getGoodsInfoById(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "获取商品信息成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '获取商品信息成功', data: data })
      }
      mysql.close()
   })
})
//根据店铺获取商品信息
app.get('/api/mall/goods/get_goods_by_shop', function (req, res, next) {
   let getdata = JSON.parse(req.query.params);
   let mysql = new _mysql(getdata)
   mysql.getGoodsInfoByShop(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "获取商品信息成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '获取商品信息成功', data: data })
      }
      mysql.close()
   })
})
//发布商品
app.post('/api/mall/goods/add_goods', function (req, res, next) {
   let getdata = req.body.params;
   let mysql = new _mysql(getdata)
   mysql.addGoods(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "发布商品成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '发布商品成功', data: data })
      }
      mysql.close()
   })
})

//商品上架
app.post('/api/mall/goods/goods_add_shop', function (req, res, next) {
   let getdata = req.body.params;
   let mysql = new _mysql(getdata)
   mysql.goodsAddShop(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "上架商品成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '上架商品成功', data: data })
      }
      mysql.close()
   })
})
//商品下架
app.post('/api/mall/goods/goods_remove_shop', function (req, res, next) {
   let getdata = req.body.params;
   let mysql = new _mysql(getdata)
   mysql.goodsRemoveShop(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "下架商品成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '下架商品成功', data: data })
      }
      mysql.close()
   })
})

//修改农产品价格
app.post('/api/mall/goods/update_goods_price', function (req, res, next) {
   let getdata = req.body.params;
   let mysql = new _mysql(getdata)
   mysql.updateGoodsPrice(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "价格修改成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '价格修改成功', data: data })
      }
      mysql.close()
   })
})

//修改农产品信息
app.post('/api/mall/goods/update_goods_info', function (req, res, next) {
   let getdata = req.body.params;
   let mysql = new _mysql(getdata)
   mysql.updateGoodsInfo(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "信息修改成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '信息修改成功', data: data })
      }
      mysql.close()
   })
})

//获取购物车信息
app.get('/api/mall/goods/shopping_cart_list', function (req, res, next) {
   let getdata = JSON.parse(req.query.params)
   let mysql = new _mysql(getdata)
   mysql.getShoppingCartInfo(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         console.log("log:" + "购物车信息请求成功");
         res.status(200)
         res.json({ res: 0, message: '购物车信息请求成功', data: data })
      }
      mysql.close()
   })
})

//加入购物车
app.post('/api/mall/goods/add_shopping_cart', function (req, res, next) {
   let getdata = req.body.params;
   let mysql = new _mysql(getdata)
   mysql.addShoppingCart(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "添加购物车成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '添加购物车成功', data: data })
      }
      mysql.close()
   })
})
//修改购物车商品数量
app.post('/api/mall/goods/update_shopping_cart_goods_count', function (req, res, next) {
   let getdata = req.body.params;
   let mysql = new _mysql(getdata)
   mysql.updateShoppingCartCount(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "修改数量成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '修改数量成功', data: data })
      }
      mysql.close()
   })
})

//移除购物车商品
app.post('/api/mall/goods/remove_shopping_cart_goods', function (req, res, next) {
   let getdata = req.body.params;
   let mysql = new _mysql(getdata)
   mysql.deleteShoppingCartCount(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "移除购物车商品成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '移除购物车商品成功', data: data })
      }
      mysql.close()
   })
})
//
app.get('/api/mall/goods/goods_count', function (req, res, next) {
   // let getdata = req.body.params;
   let mysql = new _mysql()
   mysql.getGoodsCount(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let team = []
         let obj = {}
         for (var i = 0; i < data.length; i++) {
            if (!obj[data[i].id]) {
               team.push(data[i]);
               obj[data[i].id] = true;
            }
         }
         let date = new Date()
         console.log("log:" + "商品销量统计成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '商品销量统计成功', data: team })
      }
      mysql.close()
   })
})
//商品结算
app.post('/api/mall/goods/create_order', function (req, res, next) {
   let getdata = req.body.params;
   let mysql = new _mysql(getdata)
   mysql.addOrder(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "创建成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '创建成功', data: data })
      }
      mysql.close()
   })
})
//查询订单
app.post('/api/mall/goods/select_order_info', function (req, res, next) {
   let getdata = req.body.params;
   let mysql = new _mysql(getdata)
   mysql.selectOrderInfo(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "查询成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '查询成功', data: data })
      }
      mysql.close()
   })
})
//查询一级分类
app.get('/api/mall/goods/get_first_sort', function (req, res, next) {
   // let getdata = JSON.parse(req.query.params)
   let mysql = new _mysql()
   mysql.selectFirstSort(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "获取一级分类成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '获取一级分类成功', data: data })
      }
      mysql.close()
   })
})

//查询二级分类
app.get('/api/mall/goods/get_second_sort', function (req, res, next) {
   // let getdata = JSON.parse(req.query.params)
   let mysql = new _mysql()
   mysql.selectSecondSort(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "获取二级分类成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '获取二级分类成功', data: data })
      }
      mysql.close()
   })
})

//查询三级分类
app.get('/api/mall/goods/get_third_sort', function (req, res, next) {
   // let getdata = JSON.parse(req.query.params)
   let mysql = new _mysql()
   mysql.selectThirdSort(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "获取三级分类成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '获取三级分类成功', data: data })
      }
      mysql.close()
   })
})
//添加分类
app.post('/api/mall/goods/add_sort', function (req, res, next) {
   let getdata = req.body.params;
   let mysql = new _mysql(getdata)
   mysql.addSort(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "创建分类成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '创建分类成功', data: data })
      }
      mysql.close()
   })
})
//修改分类
app.post('/api/mall/goods/update_sort', function (req, res, next) {
   let getdata = req.body.params;
   let mysql = new _mysql(getdata)
   mysql.updateSort(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "修改分类成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '修改分类成功', data: data })
      }
      mysql.close()
   })
})
//删除分类
app.post('/api/mall/goods/delete_sort', function (req, res, next) {
   let getdata = req.body.params;
   let mysql = new _mysql(getdata)
   mysql.deleteSort(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "删除分类成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '删除分类成功', data: data })
      }
      mysql.close()
   })
})

//查询店铺列表
app.get('/api/mall/goods/get_shop_list', function (req, res, next) {
   let getdata = JSON.parse(req.query.params)
   let mysql = new _mysql(getdata)
   mysql.selectShopList(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "获取店铺列表成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '获取店铺列表成功', data: data })
      }
      mysql.close()
   })
})
//封禁店铺
app.post('/api/mall/goods/ban_shop', function (req, res, next) {
   let getdata = req.body.params;
   let mysql = new _mysql(getdata)
   mysql.banShop(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "封禁店铺成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '封禁店铺成功', data: data })
      }
      mysql.close()
   })
})
//解禁店铺
app.post('/api/mall/goods/unban_shop', function (req, res, next) {
   let getdata = req.body.params;
   let mysql = new _mysql(getdata)
   mysql.unBanShop(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "解禁店铺成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '解禁店铺成功', data: data })
      }
      mysql.close()
   })
})
//根据id获取地址列表
app.get('/api/mall/goods/get_address_by_id', function (req, res, next) {
   let getdata = JSON.parse(req.query.params)
   let mysql = new _mysql(getdata)
   mysql.getAddressList(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "获取地址列表成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '获取地址列表成功', data: data })
      }
      mysql.close()
   })
})
//修改地址
app.post('/api/mall/goods/update_address', function (req, res, next) {
   let getdata = req.body.params;
   let mysql = new _mysql(getdata)
   mysql.updateAddress(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "地址修改成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '地址修改成功', data: data })
      }
      mysql.close()
   })
})
//新增地址
app.post('/api/mall/goods/add_address', function (req, res, next) {
   let getdata = req.body.params;
   let mysql = new _mysql(getdata)
   mysql.addAddress(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '出现错误', error: error })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "新增地址成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '新增地址成功', data: data })
      }
      mysql.close()
   })
})
//删除地址
app.get('/api/mall/goods/delete_address', function (req, res, next) {
   let getdata = JSON.parse(req.query.params)
   let mysql = new _mysql(getdata)

   mysql.deleteAddress(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '请求失败' })
         next(error);
      } else {
         console.log("log:" + "地址删除成功");
         res.status(200)
         res.json({ res: 0, message: '地址删除成功', data: data })
      }
      mysql.close()
   })
})
//图片上传
app.post('/api/mall/upload/img', upload.single('image'), (req, res) => {
   //读取文件路径
   fs.readFile(req.file.path, (err, data) => {
      //如果读取失败
      if (err) { return res.send('上传失败') }
      //如果读取成功
      //声明图片名字为时间戳和随机数拼接成的，尽量确保唯一性
      let time = Date.now() + parseInt(Math.random() * 999) + parseInt(Math.random() * 2222);
      //拓展名
      let extname = req.file.mimetype.split('/')[1]
      //拼接成图片名
      let keepname = time + '.' + extname
      //三个参数
      //1.图片的绝对路径
      //2.写入的内容
      //3.回调函数
      fs.writeFile(path.join(__dirname, './public/images/' + keepname), data, (err) => {
         if (err) { return res.send('写入失败') }
         res.send({ err: 0, msg: '上传ok', data: { name: keepname, url: 'http://localhost:3000/public/images/' + keepname } })
      });
   });
})


//配置服务端口
const server = app.listen(3000, function () {

   const host = server.address().address;

   const port = server.address().port;

   console.log('Example app listening at http://%s:%s', host, port);
})