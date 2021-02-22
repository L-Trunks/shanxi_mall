//数据库类
export class _mysql {
    constructor(getdata) {
        this.mysql = require('mysql');
        this.getData = getdata;
        this.connection = this.mysql.createConnection({
            host: 'localhost',
            user: 'root',  //用户名
            password: 'toot',   //密码
            database: 'mall',
            port: '3306'     //端口号
        });


    }
    connect() {
        this.connection.connect(function (err) {
            if (err) {
                console.log('---:' + err);
                return;
            }
            console.log('连接succeed');
        });
    }
    //注册
    addUser(callback) {
        this.connection.query('insert into t_user (user_name,phone,pass_word,email,permission,introduce) value(?,?,?,?,0,?)',
            [this.getData.userName, this.getData.phone, this.getData.passWord, this.getData.email, this.getData.introduce],
            function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //开通店铺
    addShop(callback) {
        this.connection.query('insert into t_shop_info (shop_name,shop_introduce,shop_state,user_id) value(?,?,?,?)',
            [this.getData.shopName, this.getData.shopIntroduce, this.getData.state, this.getData.userId],
            function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //登录
    userLogin(callback) {
        this.connection.query('select u.*,p.* from t_user u,t_shop_info p where u.phone=? and u.pass_word = ? and u.id = p.user_id',
            [this.getData.phone, this.getData.passWord],
            function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //判断手机号是否存在
    selectUser(callback) {
        this.connection.query('select * from t_user where phone=?', [this.getData.phone], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //根据id查询用户信息
    getUserById(callback) {
        this.connection.query('select u.*,p.* from t_user u,t_shop_info p where u.id=? and u.id = p.user_id', [this.getData.userId], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //获取用户列表
    getUserList(callback) {
        this.connection.query('select u.*,p.* from t_user u,t_shop_info p where u.id = p.user_id', [], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //申请成为商家
    addShopUser(callback) {
        this.connection.query('update t_user set permission = 1 where id = ?', [this.getData.userId], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //批准成为商家
    addShopUserAsk(callback) {
        this.connection.query('update t_user set permission = 3 where id = ?', [this.getData.userId], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //封禁用户
    banUser(callback) {
        this.connection.query('update t_user set permission = 4 where id = ?', [this.getData.userId], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //解禁用户
    unBanUser(callback) {
        this.connection.query('update t_user set permission = 0 where id = ?', [this.getData.userId], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //修改个人信息
    update_user_info(callback) {
        this.connection.query('update t_user set user_name = ?,introduce = ?,email =? where id = ?',
            [this.getData.userName, this.getData.introduce, this.getData.email, this.getData.userId], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //农产品模糊查询
    searchGoods(callback) {
        this.connection.query("select g.*,s.sort_name,p.shop_name from t_goods_info g,t_sort s,t_shop_info p where g.goods_name like '%" + this.getData.search + "%' and g.is_shop = 1 and g.sort_id = s.id and g.shop_id = p.id",
             function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //获取所有商品列表
    getAllGoodsList(callback) {
        this.connection.query('select g.*,s.sort_name,p.shop_name from t_goods_info g,t_sort s,t_shop_info p where g.sort_id = s.id and g.shop_id = p.id and g.is_shop= 1',
            [], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //根据分类获取商品列表
    getGoodsBySort(callback) {
        this.connection.query('select g.*,s.sort_name,p.shop_name from t_goods_info g,t_sort s,t_shop_info p where g.sort_id = s.id and g.sort_id = ? and g.shop_id = p.id and g.is_shop= 1',
            [this.getData.sortId], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //根据id获取商品信息
    getGoodsInfoById(callback) {
        this.connection.query('select g.*,s.sort_name,p.shop_name from t_goods_info g,t_sort s,t_shop_info p where g.sort_id = s.id and g.shop_id = p.id and g.id = ? ',
            [this.getData.goodsId], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //根据店铺查询商品列表
    getGoodsInfoByShop(callback) {
        this.connection.query('select g.*,s.sort_name,p.shop_name from t_goods_info g,t_sort s,t_shop_info p where g.shop_id = ? and g.sort_id = s.id and p.id = ? ',
            [this.getData.shopId,this.getData.shopId], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //商品销量统计
    getGoodsCount(callback) {
        this.connection.query('select s.*,g.sales_volume from t_sort s,t_goods_info g where s.id = g.sort_id and s.level = 0 ',
            [], function (err, rs, fields) {
            
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //发布商品
    addGoods(callback) {
        this.connection.query('insert into t_goods_info (goods_name,goods_info,goods_img,goods_bigimg,price,user_id,sort_id,send_palce,shop_id,is_shop,shipping,now_price) value (?,?,?,?,?,?,?,?,?,?,?,?)',
            [this.getData.goodsName, this.getData.goodsInfo, this.getData.goodsImg, this.getData.goodsBigImg, this.getData.price,
            this.getData.userId, this.getData.sortId, this.getData.sendPlace, this.getData.shopId, this.getData.isShop, this.getData.shipping,this.getData.nowPrice], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //商品上架
    goodsAddShop(callback) {
        this.connection.query('update t_goods_info set is_shop = 1 where id = ?', [this.getData.goodsId], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //商品下架
    goodsRemoveShop(callback) {
        this.connection.query('update t_goods_info set is_shop = 0 where id = ?', [this.getData.goodsId], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }

    //修改农产品价格
    updateGoodsPrice(callback) {
        this.connection.query('update t_goods_info set now_price = ? where id = ?', [this.getData.nowPrice, this.getData.goodsId], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //修改农产品信息
    updateGoodsInfo(callback) {
        this.connection.query('update t_goods_info set goods_name=?,goods_info=?,goods_img=?,goods_bigimg=?,price=?,sort_id=?,send_palce=?,shipping=? where id = ?',
            [this.getData.goodsName, this.getData.goodsInfo, this.getData.goodsImg, this.getData.goodsBigImg, this.getData.price,
            this.getData.sortId, this.getData.sendPlace, this.getData.shipping], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //获取购物车信息
    getShoppingCartInfo(callback) {
        this.connection.query('select c.*,u.user_name,g.goods_img,g.goods_name,g.now_price from t_shoppingcart_info c,t_goods_info g,t_user u where c.user_id = u.id and c.goods_id = g.id and c.user_id = ?',
            [this.getData.userId], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //加入购物车
    addShoppingCart(callback) {
        this.connection.query('insert into t_shoppingcart_info (user_id,goods_id,count) value (?,?,?)',
            [this.getData.userId, this.getData.goodsId, this.getData.count], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //修改购物车商品数量
    updateShoppingCartCount(callback) {
        this.connection.query('update t_shoppingcart_info set count = ?', [this.getData.count], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //移除购物车商品
    deleteShoppingCartCount(callback) {
        this.connection.query('delete from t_shoppingcart_info where id = ?', [this.getData.cartGoodsId], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //商品结算
    addOrder(callback) {
        let time = new Date()
        this.connection.query('insert into t_order_info (order_number,send_place,achieve_place,send_id,achieve_id,price_total,goods_id) value (?,?,?,?,?,?,?)',
            [time.getTime(), this.getData.sendPlace, this.getData.achievePlace, this.getData.sendId, this.getData.achieveId, this.getData.priceTotal, this.getData.goodsId], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //订单列表
    selectOrderInfo(callback) {
        this.connection.query('select o.*,g.* from t_order_info o,t_goods_info g where o.goods_id = g.id and o.achieve_id = ?',
            [this.getData.userId, this.getData.userId], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //查询一级分类
    selectFirstSort(callback) {
        this.connection.query('select s.*,f.user_name from t_sort s,t_user f where s.user_id = f.id and s.level = 0', [], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //查询二级分类
    selectSecondSort(callback) {

        this.connection.query('select s.*,f.user_name from t_sort s,t_user f where s.user_id = f.id and s.level = 1',
            [], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }//查询三级分类
    selectThirdSort(callback) {
        this.connection.query('select s.*,f.user_name from t_sort s,t_user f where s.user_id = f.id and s.level = 2',
            [], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //添加分类
    addSort(callback) {
        this.connection.query('insert into t_sort (sort_name,user_id,level,parents_id) value (?,?,?,?)',
            [this.getData.sortName, this.getData.userId, this.getData.sortLevel, this.getData.parentsId], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //修改分类
    updateSort(callback) {
        this.connection.query('update t_sort set sort_name =?,user_id =? where id =?',
            [this.getData.sortName, this.getData.userId, this.getData.sortId], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //删除分类
    deleteSort(callback) {
        this.connection.query('delete from t_sort where id =?',
            [this.getData.sortId], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //查询店铺列表
    selectShopList(callback) {
        this.connection.query('select s.*,u.user_name.u.introduce,u.fans_count,u.phone,u.email from t_shop_info s,t_user u where s.user_id = u.id',
            [], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //封禁店铺
    banShop(callback) {
        this.connection.query('update t_shop_info set shop_state = 0 where id = ?',
            [this.getData.shopId], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //解禁店铺
    unBanShop(callback) {
        this.connection.query('update t_shop_info set shop_state = 1 where id = ?',
            [this.getData.shopId], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //根据id获取地址列表
    getAddressList(callback) {
        this.connection.query('select * from t_address where user_id = ?',
            [this.getData.userId], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //修改地址
    updateAddress(callback) {
        this.connection.query('update t_address set province =?,city =?,area =?,streets =?,village=?,detail =?,achieve_name =?,phone=? where user_id = ?',
            [this.getData.province, this.getData.city, this.getData.area, this.getData.streets, this.getData.village, this.getData.detail,
            this.getData.achieveName, this.getData.phone, this.getData.userId,], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //删除地址
    deleteAddress(callback) {
        this.connection.query('delete from t_address where id = ?',
            [this.getData.userId], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //新增地址
    addAddress(callback) {
        this.connection.query('insert into t_address (province,city,area,streets,village,detail,achieve_name,phone) value (?,?,?,?,?,?,?,?) where user_id = ?',
            [this.getData.province, this.getData.city, this.getData.area, this.getData.streets, this.getData.village, this.getData.detail,
            this.getData.achieveName, this.getData.phone, this.getData.userId,], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //关闭数据库
    close() {
        this.connection.end(function (err) {
            if (err) {
                console.log('---:' + err);
                return;
            }
            console.log('关闭succeed');
        });
    }
}