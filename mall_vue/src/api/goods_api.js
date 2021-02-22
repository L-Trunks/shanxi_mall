import { get, post } from './http'


/**
 * 所有商品列表
 */
export const GetAllGoodsList = () => {
    return get('/goods/get_all_goods')
}
/**
 * 根据分类获取商品列表
 */
export const GetGoodsBySort = (params) => {
    return get('/goods/get_goods_by_sort', params)
}
/**
 * 根据id获取商品信息
 */
export const GetGoodsById = (params) => {
    return get('/goods/get_goods_by_id', params)
}
/**
 * 商品销量统计
 */
export const GetGoodsCount = (params) => {
    return get('/goods/goods_count', params)
}
/**
 * 根据店铺获取商品信息
 */
export const GetGoodsByShop = (params) => {
    return get('/goods/get_goods_by_shop', params)
}
/**
 * 发布商品
 */
export const AddGoods = (params) => {
    return post('/goods/add_goods', params)
}
/**
 * 商品上架
 */
export const GoodsAddShop = (params) => {
    return post('/goods/goods_add_shop', params)
}
/**
 * 商品下架
 */
export const GoodsRemoveShop = (params) => {
    return post('/goods/goods_remove_shop', params)
}

/**
 * 修改农产品价格
 */
export const UpdateGoodsPrice = (params) => {
    return post('/goods/update_goods_price', params)
}

/**
 * 修改农产品信息
 */
export const UpdateGoodsInfo = (params) => {
    return get('/goods/update_goods_info', params)
}

/**
 * 获取购物车信息
 */
export const ShoppingCartList = (params) => {
    return get('/goods/shopping_cart_list', params)
}
/**
 * 加入购物车
 */
export const AddShoppingCart = (params) => {
    return post('/goods/add_shopping_cart', params)
}

/**
 * 修改购物车商品数量
 */
export const UpdateShoppingCartGoodsCount = (params) => {
    return post('/goods/update_shopping_cart_goods_count', params)
}

/**
 * 移除购物车商品
 */
export const RemoveShoppingCartGoods = (params) => {
    return post('/goods/remove_shopping_cart_goods', params)
}

/**
 * 商品结算
 */
export const CreateOrder = (params) => {
    return post('/goods/create_order', params)
}

/**
 * 查询订单列表
 */
export const SelectOrderInfo = (params) => {
    return post('/goods/select_order_info', params)
}
/**
 * 查询一级分类
 */
export const GetFirstSort = (params) => {
    return get('/goods/get_first_sort', params)
}

/**
 * 查询二级分类
 */
export const GetSecondSort = (params) => {
    return get('/goods/get_second_sort', params)
}

/**
 * 查询三级分类
 */
export const GetThirdSort = (params) => {
    return get('/goods/get_third_sort', params)
}

/**
 * 添加分类
 */
export const AddSort = (params) => {
    return post('/goods/add_sort', params)
}
/**
 * 修改分类
 */
export const UpdateSort = (params) => {
    return post('/goods/update_sort', params)
}

/**
 * 删除分类
 */
export const DeleteSort = (params) => {
    return post('/goods/delete_sort', params)
}

/**
 * 查询店铺列表
 */
export const GetShopList = (params) => {
    return post('/goods/get_shop_list', params)
}
/**
 * 封禁店铺
 */
export const BanShop = (params) => {
    return post('/goods/ban_shop', params)
}

/**
 * 解禁店铺
 */
export const UnbanShop = (params) => {
    return post('/goods/unban_shop', params)
}

/**
 * 根据id获取地址列表
 */
export const GetAddressById = (params) => {
    return post('/goods/get_address_by_id', params)
}
/**
 * 修改地址
 */
export const UpdateAddress = (params) => {
    return post('/goods/update_address', params)
}

/**
 * 新增地址
 */
export const AddAddress = (params) => {
    return post('/goods/add_address', params)
}

/**
 * 删除地址
 */
export const DeleteAddress = (params) => {
    return post('/goods/delete_address', params)
}