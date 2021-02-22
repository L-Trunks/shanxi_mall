<template>
  <div>
    <el-col :span="6" v-for="(item, index) in data" :key="index">
      <el-card class="card" shadow="hover">
        <img
          @click="goGoodsDetails(item)"
          :src="item.goods_img"
          class="image"
        />
        <div class="card_box">
          <span style="color: #333; font-size: 18px">{{
            item.goods_name
          }}</span>
          <div style="margin-top: 10px">
            分类：
            <el-button class="button" @click="goGoodsList(item)" size="mini">{{
              item.sort_name
            }}</el-button>
          </div>
          <div style="color: #888; font-size: 14px; margin-top: 5px">
            <el-button class="button" size="mini">{{
              item.shop_name
            }}</el-button>
          </div>
        </div>
      </el-card>
    </el-col>
  </div>
</template>

<script>
import { mapState, mapMutations, mapActions } from "vuex";
export default {
  name: "goodsList",
  props: {
    data: {
      type: Array,
      default: () => {
        return [];
      },
    },
  },
  data() {
    return {};
  },
  methods: {
        ...mapMutations([
      "changeUserId",
      "changeLoginState",
      "changeUserInfo",
      "changeSortId"
    ]),
    goGoodsDetails(data) {
      this.$router.push({
        path: "/goods_detail",
        query: { goods_id: data.id },
      });
    },
    goShop() {
      // this.$router.push({
      //   path: "/shop_info",
      //   query: { shop_id: data.shop_id }
      // });
    },
    goGoodsList(data) {
      this.changeSortId(data.sort_id);
      console.log(this.sortId);
      this.$router.push({ path: "/goods_list", query: { sort_id: data.sort_id } });
    },
  },
};
</script>

<style scoped>
.card_box {
  display: flex;
  flex-direction: column;
  align-items: center;
}
.card {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin: 20px;
}
.image {
  width: 200px;
  height: 200px;
}
</style>