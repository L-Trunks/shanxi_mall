<template>
  <div>
    <el-col class="search" :span="20" :offset="2">
      <router-link to="/">
        <div class="search_left">
          <h2>山西美食地图</h2>
          <span>Agricultural Products Mall</span>
        </div>
      </router-link>
      <div class="search_center">
        <el-input placeholder="在此搜索" clearable v-model="searchs" style="width:280px"></el-input>
        <el-button type="success" @click="goSearchResult" icon="el-icon-search">搜索</el-button>
      </div>
      <el-badge :value="shoppingCartInfo&&shoppingCartInfo.length || 0" class="search_right">
        <el-button size="small" @click="goShopCart" icon="el-icon-shopping-cart-2">购物车</el-button>
      </el-badge>
    </el-col>
    <el-dialog title="购物车" :visible.sync="drawer" :fullscreen='true'>
      <el-table
        ref="multipleTable"
        :data="shoppingCartInfo"
        tooltip-effect="dark"
        style="width: 100%;margin-top:-30px"
        v-model="checkedGoods"
        @selection-change="handleCheckedCitiesChange"
      >
        <el-table-column type="selection" width="240"></el-table-column>
        <el-table-column width="240" label="商品图片">
          <template slot-scope="scope">
            <img width="240px" height="240px" :src="scope.row.goods_img" alt="..." />
          </template>
        </el-table-column>
        <el-table-column width="240" label="商品名">
          <template slot-scope="scope">
            <el-input style="width:240px" v-model="scope.row.goods_name" disabled></el-input>
          </template>
        </el-table-column>
        <el-table-column width="240" label="数量">
          <template slot-scope="scope">
            <el-input-number style="width:240px" disabled v-model="scope.row.count" :min="1"></el-input-number>
          </template>
        </el-table-column>
        <el-table-column width="240" label="单价">
          <template slot-scope="scope">
            <el-input style="width:80px" v-model="scope.row.now_price" disabled></el-input>
          </template>
        </el-table-column>
        <el-table-column width="240" label="总计">
          <template slot-scope="scope">
            <el-input style="width:80px" :value="scope.row.now_price*scope.row.count" disabled></el-input>
          </template>
        </el-table-column>
      </el-table>

      <div class="cart_btn">
        合计：{{totalMoney}}
        <el-button size="small" @click="buyShopCart" type="danger" icon>立即结算</el-button>
        <el-button size="small" @click="drawer = false" type="info">退出</el-button>
      </div>
    </el-dialog>
    <el-dialog title="确认订单" :visible.sync="dialogFormVisible">
      <el-form v-loading="loading" :model="orderForm">
        <el-form-item label="商品名称：">
          <el-input v-model="orderForm.goods_name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="发货地：">
          <el-input v-model="orderForm.sendPlace" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item required label="收货地：">
          <el-input v-model="orderForm.achievePlace" autocomplete="off"></el-input>
          <!-- <el-cascader v-model="orderForm.achievePlace" :options="options"></el-cascader> -->
        </el-form-item>
        <el-form-item label="收货人：">
          <el-input v-model="orderForm.userName" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="手机号：">
          <el-input v-model="orderForm.phone" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="总价">
          <el-input v-model="orderForm.priceTotal" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="danger" @click="createOrder">结算</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { mapState, mapActions, mapMutations } from "vuex";
import {
  // ShoppingCartList,
  CreateOrder,
  RemoveShoppingCartGoods
} from "../api/goods_api";
export default {
  name: "searchBox",
  data() {
    return {
      dialogFormVisible: false,
      drawer: false,
      searchs: "",
      totalMoney: 0,
      orderForm: {},
      checkedGoods: [],
      loading: false,
      cartArr: [] //结算商品购物车id
    };
  },
  methods: {
    ...mapActions(["getGoodsById", "shoppingCartList"]),
    ...mapMutations(["changeSearch"]),
    goSearchResult() {
      this.changeSearch(this.searchs);
      this.$router.push({
        path: "/search_result",
        query: { search: this.searchs }
      });
    },
    handleClose(done) {
      this.$confirm("确认关闭？")
        .then(_ => {
          console.log(_)
          done();
        })
        .catch(_ => {
           console.log(_)
        });
    },
    //复选框改变事件
    handleCheckedCitiesChange(val) {
      console.log(val);
      this.checkedGoods = val;
      console.log(this.checkedGoods);
      let total = 0;
      this.checkedGoods.map(k => {
        total += k.count * k.now_price;
      });
      this.totalMoney = total;
      this.getGoodsById({
        goodsId:
          (this.checkedGoods &&this.checkedGoods.length&&
            this.checkedGoods[this.checkedGoods.length - 1].goods_id) ||
          null
      });
    },
    handleChange() {},
    buyShopCart() {
      console.log(this.goodsInfo, this.userInfo);
      if (this.totalMoney == 0) {
        this.$message.error("请选择商品");
        return;
      } else {
        this.orderForm = {
          goods_name: this.goodsInfo[0].goods_name,
          goodsId: this.goodsInfo[0].id,
          sendPlace: this.goodsInfo[0].send_palce,
          achievePlace: "",
          sendId: this.goodsInfo[0].user_id,
          achieveId: this.userId,
          priceTotal: this.totalMoney,
          userName: this.userInfo[0].user_name,
          phone: this.userInfo[0].phone
        };
        this.dialogFormVisible = true;
        this.drawer = false;
      }
    },
    goShopCart() {
      if (!this.loginState) {
        this.$message.error("请在左上角登录");
        return;
      } else {
        this.drawer = true;
        console.log(this.shoppingCartInfo);
        this.shoppingCartInfo.map(v => {
          v.total = v.count * v.now_price;
        });
      }
    },
    createOrder() {
      this.loading = true;
      console.log(this.checkedGoods);
      //移除购物车商品
      let cartArr = [];
      this.checkedGoods.map(v => {
        this.shoppingCartInfo.map(k => {
          if (k.goods_id === v.goods_id) {
            cartArr.push(k.id);
          }
        });
      });
      this.cartArr = cartArr;
      this.cartArr.map(v => {
        RemoveShoppingCartGoods({ params: { cartGoodsId: v } })
          .then(res => {
            console.log(res);
          })
          .catch(err => {
            console.log(err);
          });
      });
      this.checkedGoods.map(v => {
        this.orderForm.goodsId = v.goods_id;
        CreateOrder({ params: this.orderForm })
          .then(res => {
            console.log(res);
            setTimeout(() => {
              this.$message.success("购买成功");
              this.loading = false;
              this.dialogFormVisible = false;
              this.shoppingCartList({ userId: this.userId });
            }, 2000);
          })
          .catch(err => {
            console.log(err);
            this.$message.error("服务器跑丢了");
          });
      });
    }
  },
  computed: {
    ...mapState({
      goodsInfo: state => state.goodsInfo,
      loginState: state => state.loginState,
      userId: state => state.userId,
      userInfo: state => state.userInfo,
      shoppingCartInfo: state => state.shoppingCartInfo
    })
  },
  watch: {
    shoppingCartInfo: {
      handler(newval) {
        newval.map(v => {
          v.total = v.count * v.now_price;
        });
      }
    }
  }
};
</script>

<style scoped>
.search_box {
  background: #fff;
}
.search {
  display: flex;
  flex-direction: row;
  justify-content: space-around;
  align-items: center;
  padding: 20px;
  border-bottom: 2px solid #67c23a;
}
.search_left {
  color: #67c23a;
}
.cart_list {
  display: flex;
  flex-direction: column;
  padding-left: 50px;
  overflow-y: scroll;
}
.cart_btn {
  position: fixed;
  bottom: 10px;
  right: 20px;
}
.cart_item {
  display: flex;
  width: 80%;
  flex-direction: row;
  justify-content: space-between;
}
</style>