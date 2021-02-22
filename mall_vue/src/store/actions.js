import {
    GetGoodsBySort,//根据分类获取商品列表
    GetGoodsById,//根据id获取商品信息
    GetAllGoodsList,//所有商品列表
    ShoppingCartList,//获取购物车信息
    GetFirstSort,//查询一级分类
    GetSecondSort,//查询二级分类
    GetThirdSort,//查询三级分类
    GetAddressById,//根据id获取地址列表
    SelectOrderInfo

} from '../api/goods_api'
import {
    // IsHasPhone, //判断手机号是否存在
    // UserLogin, //登录
    // UserRegister, //注册
    GetUserInfo, //获取用户信息
    // GetUserList, //获取用户列表
} from '../api/user_api'

const actions = {
    //改变用户信息actions
    getUserInfo(context, params) {
        GetUserInfo({ params: params }).then(res => {
            context.commit('changeUserInfo', res.data);
        }).catch(err => {
            this.$message.error(err.message && err.message || '服务器跑丢了')
        })
    },
    //所有商品
    getAllGoodsList(context, params) {
        GetAllGoodsList({ params: params }).then(res => {
            context.commit('changeAllGoodsList', res.data);
        }).catch(err => {
            this.$message.error(err.message && err.message || '服务器跑丢了')
        })
    },
    //根据分类获取商品
    getGoodsBySort(context, params) {
        GetGoodsBySort({ params: params }).then(res => {
            context.commit('changeGoodsList', res.data);
        }).catch(err => {
            this.$message.error(err.message && err.message || '服务器跑丢了')
        })
    },
    //根据id获取商品信息
    getGoodsById(context, params) {
        GetGoodsById({ params: params }).then(res => {
            context.commit('changeGoodsInfo', res.data);
        }).catch(err => {
            this.$message.error(err.message && err.message || '服务器跑丢了')
        })
    },
    //一级分类
    getFirstSort(context, params) {
        GetFirstSort({ params: params }).then(res => {
            context.commit('changeFirstSortList', res.data);
        }).catch(err => {
            this.$message.error(err.message && err.message || '服务器跑丢了')
        })
    },
    //二级分类
    getSecondSort(context, params) {
        GetSecondSort({ params: params }).then(res => {
            context.commit('changeSecondSortList', res.data);
        }).catch(err => {
            this.$message.error(err.message && err.message || '服务器跑丢了')
        })
    },
    //三级分类
    getThirdSort(context, params) {
        GetThirdSort({ params: params }).then(res => {
            context.commit('changeThirdSortList', res.data);
        }).catch(err => {
            this.$message.error(err.message && err.message || '服务器跑丢了')
        })
    },
    //购物车列表
    shoppingCartList(context, params) {
        ShoppingCartList({ params: params }).then(res => {
            context.commit('changeShoppingCartInfo', res.data);
        }).catch(err => {
            this.$message.error(err.message && err.message || '服务器跑丢了')
        })
    },
    //地址列表
    getAddressById(context, params) {
        GetAddressById({ params: params }).then(res => {
            context.commit('changeAddressList', res.data);
        }).catch(err => {
            this.$message.error(err.message && err.message || '服务器跑丢了')
        })
    },
    //订单列表
    getOrderInfo(context, params) {
        SelectOrderInfo({ params: params }).then(res => {
            context.commit('changeOrderInfo', res.data);
        }).catch(err => {
            this.$message.error(err.message && err.message || '服务器跑丢了')
        })
    },

}

export default actions;