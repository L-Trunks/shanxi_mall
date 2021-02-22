<template>
  <div>
    <el-row>
    
    <left-nav></left-nav>
    <el-col style="padding:10px" :span="16">
      <el-tabs tab-position="right" style="padding:10px">
        <el-tab-pane label="用户信息管理">
          <el-table type="card" :data="userTableData" stripe style="width: 100%">
            <el-table-column prop="user_name" label="用户名" width="180"></el-table-column>
            <el-table-column prop="introduce" label="介绍" width="180"></el-table-column>
            <el-table-column label="状态">
              <template slot-scope="scope">
                <el-button size="small">{{userStateMap[scope.row.permission]}}</el-button>
              </template>
            </el-table-column>
            <el-table-column label="操作">
              <template slot-scope="scope">
                <el-button
                  v-if="scope.row.permission === 3"
                  @click="allowShop(scope.row)"
                  type="success"
                  size="small"
                >批准</el-button>
                <el-button
                  v-if="scope.row.permission !== 4"
                  @click="banUser(scope.row)"
                  type="danger"
                  size="small"
                >封禁</el-button>
                <el-button
                  v-if="scope.row.permission === 4"
                  @click="unBanUser(scope.row)"
                  type="success"
                  size="small"
                >解禁</el-button>
                <el-button @click="showUser(scope.row)" type="primary" size="small">查看</el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-tab-pane>
        <el-tab-pane label="商家管理">
          <el-table type="card" :data="userShopTableData" stripe style="width: 100%">
            <el-table-column prop="user_name" label="用户名" width="180"></el-table-column>
            <el-table-column prop="shop_name" label="店铺名" width="180"></el-table-column>
            <el-table-column label="状态">
              <template slot-scope="scope">
                <el-button size="small">{{shopStateMap[scope.row.shop_state]}}</el-button>
              </template>
            </el-table-column>
            <el-table-column label="操作">
              <template slot-scope="scope">
                <el-button
                  v-if="scope.row.shop_state !== 0"
                  @click="banShop(scope.row)"
                  type="danger"
                  size="small"
                >封禁</el-button>
                <el-button
                  v-if="scope.row.permission == 0"
                  @click="unBanShop(scope.row)"
                  type="success"
                  size="small"
                >解禁</el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-tab-pane>
        <el-tab-pane label="农产品分类管理">
          <el-button @click="addFirstSort" type="success" size="small">添加一级分类</el-button>
          <el-collapse @change="showLevel = 2" style="margin-top:20px" accordion>
            <el-collapse-item v-for="(item,index) in sortData" :key="index">
              <template slot="title">
                <el-button type="info" size="mini">{{item.sort_name}}</el-button>
                <el-button
                  style="margin-left:70%"
                  @click="updateFirstSort(item)"
                  type="primary"
                  size="mini"
                >编辑</el-button>
                <el-button @click="deleteSort(item)" type="danger" size="mini">删除</el-button>
              </template>
              <div v-if="showLevel == 2">
                <el-button @click="addSecondSort(item.id)" type="success" size="small">添加</el-button>
                <el-table
                  v-loading="loading"
                  type="card"
                  :data="item.children"
                  stripe
                  style="width: 100%"
                >
                  <el-table-column prop="sort_name" label="分类名" width="180"></el-table-column>
                  <el-table-column prop="user_name" label="添加该分类用户" width="180"></el-table-column>
                  <el-table-column label="操作">
                    <template slot-scope="scope">
                      <el-button @click="updateSecondSort(scope.row)" type="primary" size="small">编辑</el-button>
                      <el-button @click="deleteSort(scope.row)" type="danger" size="small">删除</el-button>
                      <el-button @click="showNextSort(scope.row)" type="info" size="small">查看下级</el-button>
                    </template>
                  </el-table-column>
                </el-table>
              </div>
              <div v-if="showLevel == 3">
                <el-button @click="addThirdSort" type="success" size="small">添加</el-button>
                <el-table
                  v-loading="loading"
                  　type="card"
                  :data="thirdData"
                  stripe
                  style="width: 100%"
                >
                  <el-table-column prop="sort_name" label="分类名" width="180"></el-table-column>
                  <el-table-column prop="user_name" label="添加该分类用户" width="180"></el-table-column>
                  <el-table-column label="操作">
                    <template slot-scope="scope">
                      <el-button
                        v-if="scope.row.id"
                        @click="updateThirdSort(scope.row)"
                        type="primary"
                        size="small"
                      >编辑</el-button>
                      <el-button
                        v-if="scope.row.id"
                        @click="deleteSort(scope.row)"
                        type="danger"
                        size="small"
                      >删除</el-button>
                      <el-button @click="showLevel = 2" type="info" size="small">查看上级</el-button>
                    </template>
                  </el-table-column>
                </el-table>
              </div>
            </el-collapse-item>
          </el-collapse>
        </el-tab-pane>
        <el-tab-pane label="销售统计">
          <div id="myChart" :style="{width: '900px', height: '600px'}"></div>
        </el-tab-pane>
      </el-tabs>
    </el-col>
    <el-dialog title="用户信息" :visible.sync="dialogFormVisible">
      <el-form :model="dialogData">
        <el-form-item label="用户名：" :label-width="formLabelWidth">
          <el-input v-model="dialogData.user_name" disabled></el-input>
        </el-form-item>
        <el-form-item label="用户简介：" :label-width="formLabelWidth">
          <el-input v-model="dialogData.introduce" disabled></el-input>
        </el-form-item>
        <el-form-item label="邮箱：" :label-width="formLabelWidth">
          <el-input v-model="dialogData.email" disabled></el-input>
        </el-form-item>
        <el-form-item label="权限：" :label-width="formLabelWidth">
          <el-input :placeholder="userStateMap[dialogData.permission]" disabled></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="dialogFormVisible = false">确 定</el-button>
      </div>
    </el-dialog>
    <el-dialog v-loading="loading" title="添加分类" :visible.sync="sortDialogFormVisible">
      <el-form :model="dialogData">
        <el-form-item label="分类名">
          <el-input v-model="sortForm.sortName"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="sortDialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="addSort">确 定</el-button>
      </div>
    </el-dialog>
    <el-dialog v-loading="loading" title="编辑分类" :visible.sync="updateSortDialogFormVisible">
      <el-form :model="dialogData">
        <el-form-item label="分类名">
          <el-input v-model="updateSortForm.sortName"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="updateSortDialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="updateSort">确 定</el-button>
      </div>
    </el-dialog>
      
    </el-row>
  </div>
</template>

<script>
import echarts from "echarts";
import {
  GetUserList,
  UserGetShopAsk, //批准成为商家
  BanUser, //封禁用户
  UnBanUser //解禁用户
} from "../api/user_api";
import {
  banShop,
  GetGoodsCount, //商品销量统计
  unBanShop,
  DeleteSort, //删除分类
  UpdateSort, //编辑分类
  AddSort, //添加分类
  GetShopList //获取店铺列表
} from "../api/goods_api";
import { mapState, mapMutations, mapActions } from "vuex";
import LeftNav from "../components/LeftNav";
export default {
  name: "setting",
  components: {
    LeftNav
  },
  data() {
    return {
      thirdData: [], //三级分类表格渲染数据
      updateSortDialogFormVisible: false,
      sortDialogFormVisible: false,
      dialogFormVisible: false,
      userTableData: [],
      dialogData: {},
      formLabelWidth: "120px",
      showLevel: 2,
      loading: false,
      //用户权限map对象
      userStateMap: {
        0: "普通用户",
        1: "申请成为商家中",
        2: "管理员",
        3: "商家",
        4: "封禁中"
      },
      shopStateMap: {
        0: "封禁中",
        1: "已开通",
        2: "未开通"
      },
      userShopTableData: [],
      sortData: [],
      sortForm: {
        sortName: "",
        userId: null,
        sortLevel: null,
        parentsId: ""
      },
      updateSortForm: {
        sortName: "",
        userId: null,
        sortId: null
      },
      showThirdData: [],
      echartsData: {
        xAxis: [],
        data: []
      }
    };
  },
  created() {
    //未登录跳转到首页
    if (!this.loginState) {
      this.$message.error("请登录");
      this.$router.push("/");
    } else {
      this.getUserTableData();
      this.getFirstSort();
      this.getSecondSort();
      this.getThirdSort();
      this.getSortList();
      this.drawLine();
    }
  },
  methods: {
    ...mapMutations([
      "changeUserId",
      "changeLoginState",
      "changeUserInfo",
      "changeSortList"
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
    //统计销量
    setGoodsCount() {
      this.echartsData.xAxis = this.firstSortList.map(v => {
        return v.sort_name;
      });
      GetGoodsCount().then(res => {
        let xAxis = [],data = []
        res.data && res.data.map(v => {
          xAxis.push(v.sort_name);
          data.push(v.sales_volume);
        });
        this.echartsData.xAxis = xAxis
        this.echartsData.data = data
        this.drawLine(this.echartsData);
        console.log(this.echartsData);
      });
    },
    //设置图表数据
    drawLine(data) {
      let myChart = echarts.init(document.getElementById("myChart"));
      // 绘制图表
      myChart.setOption({
        title: { text: "各分类销量展示" },
        tooltip: {},
        xAxis: {
          data: (this.echartsData && this.echartsData.xAxis) || []
        },
        yAxis: {},
        series: [
          {
            name: "销量",
            type: "bar",
            data: (this.echartsData && this.echartsData.data) || []
          }
        ]
      });
      console.log(data);
    },
    //获取分类列表
    getSortList() {
      this.loading = true;
      this.sortData = this.firstSortList;
      console.log(this.sortData);
      this.sortData.map(v => {
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
      this.sortData.map(v => {
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
      console.log(this.sortData);
      this.changeSortList(this.sortData);
    },
    //编辑分类
    updateSort() {
      UpdateSort({ params: this.updateSortForm })
        .then(res => {
          console.log(res);
          this.$message.success("修改成功");
          this.getFirstSort();
          this.getSecondSort();
          this.getThirdSort();
          this.updateSortDialogFormVisible = false;
          this.getSortList();
          if (this.showLevel === 3) {
            this.showThirdData = this.thirdSortList.filter(v => {
              v.parents_id == this.updateSortForm.parentsId;
            });
            this.showNextSort(this.showThirdData);
          }
        })
        .catch(err => {
          console.log(err);
          this.$message.error("服务器跑丢了");
        });
    },
    updateFirstSort(data) {
      this.updateSortForm = {
        sortName: data.sort_name,
        userId: this.userId,
        sortId: data.id
      };
      this.updateSortDialogFormVisible = true;
    },
    updateSecondSort(data) {
      this.updateSortForm = {
        sortName: data.sort_name,
        userId: this.userId,
        sortId: data.id
      };
      this.updateSortDialogFormVisible = true;
    },
    updateThirdSort(data) {
      this.updateSortForm = {
        sortName: data.sort_name,
        userId: this.userId,
        sortId: data.id
      };
      this.updateSortDialogFormVisible = true;
    },
    deleteSort(data) {
      if (data.level !== 2 && data.children && data.children.length > 0) {
        this.$message.error("该分类下存在子分类，不可删除");
        return;
      }
      this.$confirm("确定删除该分类吗", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          DeleteSort({ params: { sortId: data.id } })
            .then(res => {
              this.$message.success("已删除");
              this.getFirstSort();
              this.getSecondSort();
              this.getThirdSort();
              this.getSortList();
              if (this.showLevel === 3) {
                this.showThirdData = this.thirdSortList.filter(v => {
                  v.parents_id == this.sortForm.parentsId;
                });
                this.showNextSort(this.showThirdData);
              }
            })
            .catch(err => {
              console.log(err);
              this.$message.error("服务器跑丢了");
            });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "操作已取消"
          });
        });
    },
    //查看下级分类列表
    showNextSort(data) {
      console.log(data);
      this.loading = true;
      this.sortForm = {
        sortName: "",
        userId: this.userId,
        sortLevel: 2,
        parentsId: data.id
      };
      this.thirdData = data.children || [{}];
      this.showLevel = 3;
      this.loading = false;
    },
    //添加分类
    addSort() {
      AddSort({ params: this.sortForm })
        .then(res => {
          console.log(res);
          this.$message.success("添加成功");
          this.getFirstSort();
          this.getSecondSort();
          this.getThirdSort();
          this.sortDialogFormVisible = false;
          this.getSortList();
          if (this.showLevel === 3) {
            this.showThirdData = this.thirdSortList.filter(v => {
              v.parents_id == this.sortForm.parentsId;
            });
            this.showNextSort(this.showThirdData);
          }
        })
        .catch(err => {
          console.log(err);
          this.$message.error("服务器跑丢了");
        });
    },
    //一级分类弹出框
    addFirstSort() {
      this.sortForm = {
        sortName: "",
        userId: this.userId,
        sortLevel: 0,
        parentsId: "0"
      };
      this.sortDialogFormVisible = true;
    },
    //二级分类弹出框
    addSecondSort(id) {
      this.sortForm = {
        sortName: "",
        userId: this.userId,
        sortLevel: 1,
        parentsId: id
      };
      this.sortDialogFormVisible = true;
    },
    //三级分类弹出框
    addThirdSort() {
      this.sortDialogFormVisible = true;
    },
    getUserTableData() {
      GetUserList()
        .then(res => {
          this.userTableData = res.data;
          this.userShopTableData = this.userTableData;
          console.log(res);
        })
        .catch(err => {
          console.log(err);
        });
    },
    //批准成为商家
    allowShop(data) {
      this.$confirm("确定批准该申请吗", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          UserGetShopAsk({ params: { userId: data.user_id } })
            .then(res => {
              this.$message.success("已批准");
              this.getUserTableData();
            })
            .catch(err => {
              this.$message.error("服务器跑丢了");
            });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "操作已取消"
          });
        });
    },
    //封禁用户
    banUser(data) {
      if (data.permission == 2) {
        this.$message.error("管理员不可封禁");
        return;
      }
      this.$confirm("确定封禁该用户吗", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          BanUser({ params: { userId: data.user_id } })
            .then(res => {
              this.$message.success("已封禁");
              this.getUserTableData();
            })
            .catch(err => {
              this.$message.error("服务器跑丢了");
            });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "操作已取消"
          });
        });
    },
    //解禁用户
    unBanUser(data) {
      this.$confirm("确定解禁该用户吗", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          UnBanUser({ params: { userId: data.user_id } })
            .then(res => {
              this.$message.success("已解禁");
              this.getUserTableData();
            })
            .catch(err => {
              this.$message.error("服务器跑丢了");
            });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "操作已取消"
          });
        });
    },
    //查看用户
    showUser(data) {
      this.dialogData = data;
      this.dialogFormVisible = true;
    },
    //封禁店铺
    banShop(data) {
      if (data.permission == 2) {
        this.$message.error("管理员不可封禁");
        return;
      }
      this.$confirm("确定封禁该店铺吗", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          UnBanUser({ params: { id: data.id } })
            .then(res => {
              this.$message.success("已封禁");
              this.getUserTableData();
            })
            .catch(err => {
              this.$message.error("服务器跑丢了");
            });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "操作已取消"
          });
        });
    },
    //解禁店铺
    unBanShop(data) {
      this.$confirm("确定解禁该店铺吗", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          UnBanUser({ params: { id: data.id } })
            .then(res => {
              this.$message.success("已解禁");
              this.getUserTableData();
            })
            .catch(err => {
              this.$message.error("服务器跑丢了");
            });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "操作已取消"
          });
        });
    }
  },
  computed: {
    ...mapState({
      loginState: state => state.loginState,
      userId: state => state.userId,
      userInfo: state => state.userInfo,
      goodsList: state => state.goodsList,
      allGoodsList: state => state.allGoodsList,
      firstSortList: state => state.firstSortList,
      secondSortList: state => state.secondSortList,
      thirdSortList: state => state.thirdSortList,
      shoppingCartInfo: state => state.shoppingCartInfo
    })
  },
  watch: {
    showThirdData: {
      handler(newval) {
        this.showNextSort(newval);
      },
      deep: true
    },
    firstSortList() {
      //   this.$nextTick(function() {
      this.getSortList();
      this.setGoodsCount();
      //   });
    },
    secondSortList() {
      //   this.$nextTick(function() {
      this.getSortList();
      this.setGoodsCount();
      //   });
    },
    thirdSortList() {
      //   this.$nextTick(function() {
      this.getSortList();
      this.setGoodsCount();
      //   });
    }
  }
};
</script>

<style scoped>
</style>