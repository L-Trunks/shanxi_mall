<template>
  <div>
    <el-row class="box_view">
      <!-- 左边导航 -->

      <left-nav></left-nav>
      <el-col class="goods_box_view" :span="16">
        <el-col v-loading="loading" :span="6" v-for="(item, index) in goodsList" :key="index">
          <el-card class="card" shadow="hover">
            <img
              @click="goGoodsDetails(item)"
              :src="item.goods_img"
              class="image"
            />
            <div class="card_box">
              <span style="color:#333;font-size:18px">{{item.goods_name}}</span>
              <div style="margin-top:10px">
                分类：
                <el-button class="button" size="mini">{{item.sort_name}}</el-button>
              </div>
              <div style="color:#888;font-size:14px;margin-top:5px">
                <el-button @click="goShop(item)" class="button" size="mini">{{item.shop_name}}</el-button>
              </div>
            </div>
          </el-card>
        </el-col>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import LeftNav from "../components/LeftNav";
// import GoodsList from "../components/GoodsList";
import { GetGoodsBySort } from "../api/goods_api";
import { mapState, mapMutations } from "vuex";
export default {
  name: "goodsView",
  data() {
    return {
      loading: false,
      sort_id: null,
      goodsList: []
    };
  },
  components: {
    LeftNav,
    
  },
  created() {
    // this.sort_id = this.$route.query.sort_id;
    this.getGoodsList();
  },
  methods: {
    ...mapMutations(["changeSortId"]),
    goGoodsDetails(data) {
      this.$router.push({
        path: "/goods_detail",
        query: { goods_id: data.id }
      });
    },
    getGoodsList() {
      this.loading = true;
      GetGoodsBySort({ params: { sortId: this.sortId } })
        .then(res => {
          this.goodsList = (res.data && res.data) || [];
          console.log(res);
          this.loading = false;
        })
        .catch(err => {
          console.log(err);
          this.loading = false;
        });
    }
  },
  computed: {
    ...mapState({
      sortId: state => state.sortId
    })
  },
  watch: {
    sortId: {
      handler() {
        this.getGoodsList();
      },
      deep: true
    }
  }
};
</script>

<style scoped>
.box_view {
  display: flex;
  flex-direction: row;
}
.goods_list_view {
  border: 1px solid #ddd;
}
.image{
  width:200px;
  height: 200px;
}
</style>