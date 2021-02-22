<template>
  <el-col :key="menuKey" :span="4" :offset="2">
    <h5>全部分类</h5>
    <div class="first_sort" v-for="(item,index) in options" :key="index">
      <span @click="goGoodsList(item)">{{item.sort_name}}</span>
      <!-- <el-breadcrumb class="first_sort_child" separator-class="el-icon-arrow-right"> -->
      <div class="first_sort_child">
         <span
       
        @click="goGoodsList(i)"
        v-for="(i,k) in item.children"
      >{{i.sort_name}}></span>
      </div>
     
      <!-- </el-breadcrumb> -->
    </div>
  </el-col>
</template>

<script>
import { mapState, mapMutations, mapActions } from "vuex";
export default {
  name: "leftNav",
  data() {
    return {
      loading: false,
      menuKey: 0
    };
  },
  created() {
    this.getFirstSort();
    this.getSecondSort();
    this.getThirdSort();
    this.setOptions();
  },
  methods: {
    ...mapMutations([
      "changeUserId",
      "changeLoginState",
      "changeUserInfo",
      "changeSortId"
    ]),
    ...mapActions([
      "getAllGoodsList",
      "getGoodsBySort",
      "getGoodsById",
      "getFirstSort",
      "getSecondSort",
      "getThirdSort",
      "shoppingCartList"
    ]),
    setOptions() {
      this.loading = true;
      this.options = this.firstSortList;
      this.options &&
        this.options.map(v => {
          v.children = [];
          v.isEdit = false;
          this.secondSortList && this.secondSortList.length > 0
            ? this.secondSortList.map(k => {
                if (k.parents_id === v.id) {
                  v.children.push(k);
                }
              })
            : "";
        });
      this.options &&
        this.options.map(v => {
          v.children.length > 0
            ? v.children.map(k => {
                k.children = [];
                k.isEdit = false;
                this.thirdSortList && this.thirdSortList.length > 0
                  ? this.thirdSortList.map(i => {
                      i.isEdit = false;
                      if (i.parents_id === k.id) {
                        k.children.push(i);
                      }
                    })
                  : "";
              })
            : "";
        });
      this.loading = false;
      console.log(this.options);
    },
    goGoodsList(data) {
      this.changeSortId(data.id);
      console.log(this.sortId);
      this.$router.push({ path: "/goods_list", query: { sort_id: data.id } });
    }
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
      sortId: state => state.sortId,
      isNav: state => state.isNav
    })
  },
  watch: {
    firstSortList: {
      handler(val) {
        this.setOptions();
        this.menuKey++;
      },
      deep: true
    },
    secondSortList: {
      handler(val) {
        this.setOptions();
        this.menuKey++;
      },
      deep: true
    },
    thirdSortList: {
      handler(val) {
        this.setOptions();
        this.menuKey++;
      },
      deep: true
    }
  }
};
</script>

<style scoped>
h5 {
  padding: 10px;
  text-align: center;
  font-size: 24px;
  font-weight: 100;
  background: #4a9126;
  color: #fff;
  transition: all 0.5s;
}
h5:hover {
  background: #67c23a;
  transition: all 0.5s;
}
.first_sort {
  padding: 10px;
  font-size: 20px;
  text-align: center;
  color: #fff;
  background: #67c23a;
  transition: all 0.5s;
  cursor: pointer;
}
.first_sort:hover {
  background: #333;
  color: #fff;
  border-left: 5px solid #4a9126;
  transition: all 0.5s;
}
.first_sort_child {
  display: flex;
  flex-direction: row;
  justify-content: space-around;
  color: #fff;
  cursor: pointer;
  margin-top: 10px;
  font-size: 12px;
  transition: all 0.5s;
}
</style>