<template>
  <div>
    <el-row>
      <left-nav></left-nav>
      <el-col style="padding:10px" :span="16">
        <div class="detail_box">
          <div class="img_box">
            <img-zoom
              :src="goodsInfo[0].goods_img && goodsInfo[0].goods_img||imgurl"
              width="250"
              height="250"
              :bigsrc="goodsInfo[0].goods_img && goodsInfo[0].goods_img ||imgurl"
              :configs="configs"
            ></img-zoom>
          </div>
          <div class="right_view">
            <h2>{{goodsInfo && goodsInfo[0].goods_name || '出错了'}}</h2>
            <h4>原价：￥{{goodsInfo && goodsInfo[0].price ||0}}</h4>
            <h3>现价：￥{{goodsInfo && goodsInfo[0].now_price||0}}</h3>
            <span>分类：{{goodsInfo && goodsInfo[0].sort_name || ''}}&nbsp;&nbsp;&nbsp;&nbsp;店铺：{{goodsInfo && goodsInfo[0].shop_name || ''}}</span>
            <el-input-number v-model="count" :min="1"></el-input-number>
            <h3 style="margin:10px">小计：￥{{goodsInfo && goodsInfo[0].now_price*count ||0}}</h3>
            <div>
              <el-button
                @click="buyShop"
                class="button"
                type="danger"
                icon="el-icon-coin"
                size="small"
              >立即购买</el-button>
              <el-button
                @click="addShopCart"
                class="button"
                type="success"
                icon="el-icon-plus"
                size="small"
              >加入购物车</el-button>
            </div>
          </div>
        </div>
        <el-tabs v-model="activeName" style="margin-top:20px">
          <el-tab-pane class="goods_detail" label="商品详情" name="first">
            <span style="color:#333; padding:20px;margin:20px;font-size:14px">{{goodsInfo[0].goods_info}}</span>
            <img
              width="100%"
              height="500px"
              :src="goodsInfo&& goodsInfo[0].goods_bigimg || 'http://149.129.59.121/assets/images/city.jpg'"
              class="big_img"
              alt
            />
          </el-tab-pane>
          <el-tab-pane label="商品评价" name="second">
            <img
              height="500px"
              width="100%"
              src="http://149.129.59.121/assets/images/city.jpg"
              class="big_img"
              alt
            />
          </el-tab-pane>
          <el-tab-pane label="买家问答" name="third">
            <img
              height="500px"
              width="100%"
              src="http://149.129.59.121/assets/images/city.jpg"
              class="big_img"
              alt
            />
          </el-tab-pane>
        </el-tabs>
      </el-col>
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
    </el-row>
  </div>
</template>

<script>
import LeftNav from "../components/LeftNav";
import imgZoom from "vue2.0-zoom";
import { mapState, mapActions, } from "vuex";
import {
  AddShoppingCart,

  CreateOrder
} from "../api/goods_api";
export default {
  name: "goodsdetail",
  data() {
    return {
      dialogFormVisible: false,
      id: "",
      count: 1,
      activeName: "first",
      imgurl: "http://149.129.59.121/assets/images/user.jpg",
      configs: {
        width: 300,
        height: 300,
        maskWidth: 150,
        maskHeight: 150,
        maskColor: "red",
        maskOpacity: 0.2
      },
      orderForm: {},
      loading: false,
      options: {}
    };
  },
  created() {
    this.id = this.$route.query.goods_id;
    this.getGoodsById({ goodsId: this.id });
    console.log(this.goodsInfo);
  },
  methods: {
    ...mapActions(["getGoodsById", "shoppingCartList"]),
    buyShop() {
      if (!this.userId) {
        this.$message.error("请先在左上角登录");
        return;
      } else {
        console.log(this.goodsInfo, this.userInfo);
        this.orderForm = {
          ...this.goodsInfo[0],
          goodsId: this.goodsInfo[0].id,
          sendPlace: this.goodsInfo[0].send_palce,
          achievePlace: "",
          sendId: this.goodsInfo[0].user_id,
          achieveId: this.userId,
          priceTotal: this.goodsInfo[0].now_price * this.count,
          userName: this.userInfo[0].user_name,
          phone: this.userInfo[0].phone
        };
        this.dialogFormVisible = true;
      }
    },
    createOrder() {
      this.loading = true;
      CreateOrder({ params: this.orderForm })
        .then(res => {
          console.log(res);
          setTimeout(() => {
            this.$message.success("购买成功");
            this.loading = false;
            this.dialogFormVisible = false;
          }, 2000);
        })
        .catch(err => {
          console.log(err);
          this.$message.error("服务器跑丢了");
        });
    },
    addShopCart() {
      if (!this.userId) {
        this.$message.error("请先在左上角登录");
        return;
      } else {
        AddShoppingCart({
          params: {
            userId: this.userId,
            goodsId: this.goodsInfo[0].id,
            count: this.count
          }
        })
          .then(res => {
            console.log(res);
            this.$message.success("添加成功");
            this.shoppingCartList({ userId: this.userId });
          })
          .catch(err => {
            console.log(err);
            this.$message.error("服务器跑丢了");
          });
      }
    }
  },
  components: {
    LeftNav,
    imgZoom
  },
  watch: {
    id: {
      handler(newval) {
        this.getGoodsById({ goodsId: newval });
      }
    }
  },
  computed: {
    ...mapState({
      goodsInfo: state => state.goodsInfo,
      userId: state => state.userId,
      userInfo: state => state.userInfo
    })
  }
};
</script>

<style scoped>
.detail_box {
  display: flex;
  flex-direction: row;
  align-items: center;
  padding: 5px;
  border: 1px solid #ddd;
}
.img_box {
  width: 40%;
  display: flex;
  justify-content: center;
  align-items: center;
}
.right_view {
  width: 60%;
  flex-direction: column;
  display: flex;
  align-items: center;
}
.right_view span {
  font-size: 14px;
  color: #888;
  padding: 5px 10px;
  margin: 20px 0;
}
h4 {
  color: #888;
  text-decoration-line: line-through;
}
h3 {
  color: rgb(255, 45, 45);
}
</style>