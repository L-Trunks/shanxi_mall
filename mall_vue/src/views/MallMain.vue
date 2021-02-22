<template>
  <div class="home">
    <el-row>
      <!-- 左边导航 -->
      <left-nav></left-nav>
      <right-view></right-view>
      <el-col class="goods_box" style="margin-top: -200px;" :span="16" :offset="6">
        <h1>热销商品</h1>
        <goods-list class="goods_list" :data="allGoodsList && allGoodsList.slice(0,12) || []"></goods-list>
      </el-col>
      <el-col class="goods_box" :span="16" :offset="6">
        <h1>推荐商品</h1>
        <goods-list class="goods_list" :data="allGoodsList && allGoodsList.slice(12,20) ||[]"></goods-list>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import {
  UserLogin,
  UserRegister,
  IsHasPhone,
  UserAddShop, //开通店铺
  GetUserInfo //获取用户信息
} from "../api/user_api";
import { mapState, mapMutations, mapActions } from "vuex";
import LeftNav from "../components/LeftNav";
import RightView from "../components/RightView";
import GoodsList from "../components/GoodsList";
export default {
  name: "mallMain",
  data() {
    return {};
  },
  created() {
    //所有商品列表
    this.getAllGoodsList();
  },
  methods: {
    ...mapMutations(["changeUserId", "changeLoginState", "changeUserInfo"]),
    ...mapActions([
      "getAllGoodsList",
      "getGoodsBySort",
      "getGoodsById",
      "getFirstSort",
      "getSecondSort",
      "getThirdSort",
      "shoppingCartList"
    ])
  },
  computed: {
    ...mapState({
      loginState: state => state.loginState,
      userId: state => state.userId,
      userInfo: state => state.userInfo,
      goodsList: state => state.goodsList,
      goodsInfo: state => state.goodsInfo,
      allGoodsList: state => state.allGoodsList,
      firstSortList: state => state.firstSortList,
      secondSortList: state => state.secondSortList,
      thirdSortList: state => state.thirdSortList,
      shoppingCartInfo: state => state.shoppingCartInfo,
      isNav: state => state.isNav
    })
  },
  components: {
    LeftNav,
    RightView,
    GoodsList
  }
};
</script>
<style scoped>
.goods_box {
  display: flex;
  flex-direction: column;
  /* justify-content: space-around; */
  align-items: center;
  
}
h1 {
  text-align: center;
  padding: 20px 0;
  font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande",
    "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
  font-size: 30px;
  font-weight: 300;
  color: #777;
  transition: all 3s;
}
h1:hover {
  color: #519230;
  transition: all 0.5s;
}
.goods_list {
  border: 1px solid #ddd;
}
</style>
