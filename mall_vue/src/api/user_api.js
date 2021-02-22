import { get, post } from './http'


/**
 * 登录
 */
export const UserLogin = (params) => {
    return post('/user/login', params)
}

/**
 * 注册
 */
export const UserRegister = (params) => {
    return post('/user/register', params)
}
/**
 * 判断手机号是否存在
 */
export const IsHasPhone = (params) => {
    return get('/user/is_have_phone', params)
}

/**
 * 开通店铺
 */
export const UserAddShop = (params) => {
    return post('/user/add_shop', params)
}

/**
 * 获取用户信息
 */
export const GetUserInfo = (params) => {
    return post('/user/get_user_info', params)
}
/**
 * 获取用户列表
 */
export const GetUserList = (params) => {
    return post('/user/get_user_list', params)
}

/**
 * 申请成为商家
 */
export const UserGetShop = (params) => {
    return post('/user/user_get_shop', params)
}

/**
 * 批准成为商家
 */
export const UserGetShopAsk = (params) => {
    return post('/user/user_get_shop_ask', params)
}

/**
 * 封禁用户
 */
export const BanUser = (params) => {
    return post('/user/ban_user', params)
}

/**
 * 解禁用户
 */
export const UnBanUser = (params) => {
    return post('/user/un_ban_user', params)
}
/**
 * 搜索
 */
export const UserSearch = (params) => {
    return post('/user/search', params)
}

/**
 * 修改个人资料
 */
export const UpdateUserInfo = (params) => {
    return post('/user/update_user_info', params)
}
