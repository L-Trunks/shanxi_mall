
const mutations = {
    changeUserId(state, params) {
        state.userId = params;
    },
    changeLoginState(state, params) {
        state.loginState = params
    },
    changeUserInfo(state, params) {
        state.userInfo = params;
    },
    changeGoodsList(state, params) {
        state.goodsList = params;
    },
    changeGoodsInfo(state, params) {
        state.goodsInfo = params;

    },
    changeAllGoodsList(state, params) {
        state.allGoodsList = params;

    },
    changeFirstSortList(state, params) {
        state.firstSortList = params;

    },
    changeSecondSortList(state, params) {
        state.secondSortList = params;

    },
    changeThirdSortList(state, params) {
        state.thirdSortList = params;

    },
    changeShoppingCartInfo(state, params) {
        state.shoppingCartInfo = params;

    },
    changeAddressList(state, params) {
        state.addressList = params;

    },
    changeIsNav(state, params) {
        state.isNav = params;

    },
    changeSortList(state, params) {
        state.sortList = params;

    },
    changeOrderInfo(state, params) {
        state.orderInfo = params;

    },
    changeSortId(state, params) {
        state.sortId = params;

    },
    changeSearch(state, params) {
        state.search = params;

    }

}

export default mutations