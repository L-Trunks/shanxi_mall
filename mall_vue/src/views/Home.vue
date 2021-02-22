<template>
  <div class="home">
    <el-row class="top_box">
      <el-col class="top" :span="20" :offset="2">
        <el-form
          v-if="!loginState"
          ref="loginForm"
          :rules="loginRules"
          :inline="true"
          :model="loginForm"
          class="demo-form-inline login"
        >
          <el-form-item label="您好，请登录！"></el-form-item>
          <el-form-item label="手机号:" prop="phone">
            <el-input size="mini" v-model="loginForm.phone" maxlength="11" placeholder="11位手机号码"></el-input>
          </el-form-item>
          <el-form-item label="密码:" prop="passWord">
            <el-input type="password" size="mini" v-model="loginForm.passWord" placeholder="请输入密码"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button size="mini" type="info" @click="userLogin('loginForm')">登录</el-button>
          </el-form-item>
          <el-form-item>
            <el-button size="mini" type="info" @click="dialogFormVisible = true">注册</el-button>
          </el-form-item>
        </el-form>
        <div class="is_login" v-else>{{userInfo[0].user_name}}您好，欢迎来到XXX山西美食地图</div>
      </el-col>
    </el-row>
    <el-row :span="20" :offset="2">
      <search-box></search-box>
    </el-row>

    <el-dialog title="用户注册" :visible.sync="dialogFormVisible">
      <el-form :model="registerForm" :rules="registerRules" ref="registerForm">
        <el-form-item label="手机号：" :label-width="formLabelWidth" prop="phone">
          <el-input maxlength="11" v-model="registerForm.phone"></el-input>
        </el-form-item>
        <el-form-item label="昵称：" :label-width="formLabelWidth" prop="userName">
          <el-input v-model="registerForm.userName"></el-input>
        </el-form-item>
        <el-form-item label="密码：" :label-width="formLabelWidth" prop="passWord">
          <el-input type="password" v-model="registerForm.passWord"></el-input>
        </el-form-item>
        <el-form-item label="确认密码" :label-width="formLabelWidth" prop="confirmPassWord">
          <el-input type="password" v-model="registerForm.confirmPassWord"></el-input>
        </el-form-item>
        <el-form-item label="邮箱：" :label-width="formLabelWidth" prop="email">
          <el-input type="email" v-model="registerForm.email"></el-input>
        </el-form-item>
        <el-form-item label="个人简介：" :label-width="formLabelWidth" prop="introduce">
          <el-input type="textarea" v-model="registerForm.introduce"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="userRegister('registerForm')">提交</el-button>
      </div>
    </el-dialog>
    <router-view></router-view>
    <el-row :span="24">
      <el-col :span="24">
        <m-footer></m-footer>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import MFooter from "../components/Mfooter";
import {
  UserLogin,
  UserRegister,
  IsHasPhone,
  UserAddShop, //开通店铺
  GetUserInfo //获取用户信息
} from "../api/user_api";
import SearchBox from "../components/SearchBox";
import { mapState, mapActions, mapMutations } from "vuex";
export default {
  name: "home",
  data() {
    let checkphone = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入昵称"));
      } else {
        IsHasPhone({ params: { phone: value } })
          .then(res => {
            console.log(res);
            if (res.data.length > 0) {
              callback(new Error("该手机号已被注册"));
            } else {
              callback();
            }
          })
          .catch(err => {
            this.$message.error("服务器跑丢了");
            console.log(err);
          });
      }
    };
    let checkpassWord = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入密码"));
      } else {
        if (this.registerForm.confirmPassWord !== "") {
          this.$refs.registerForm.validateField("checkconfirmPassWord");
        }
        callback();
      }
    };
    let checkconfirmPassWord = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请再次输入密码"));
      } else if (value !== this.registerForm.passWord) {
        callback(new Error("两次输入密码不一致!"));
      } else {
        callback();
      }
    };
    function checkEmail(text) {
      if (text.match(/qq\.com$/)) {
        return -1;
      }
      if (!text.match(/^\w+([._-]\w+)*@(\w+\.)+\w+$/)) {
        return false;
      }
      return true;
    }
    let emailCheck = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入邮箱"));
      } else {
        let check = checkEmail(value);
        if (check) {
          callback();
        } else {
          callback(new Error("请输入正确的邮箱格式!"));
        }
      }
    };
    return {
      dialogFormVisible: false, //是否打开弹出框
      formLabelWidth: "120px",
      loginForm: {
        phone: null,
        passWord: null
      }, //登录表单数据
      registerForm: {
        userName: "",
        phone: "",
        passWord: "",
        email: "",
        introduce: "",
        confirmPassWord: ""
      }, //注册表单数据

      loginRules: {
        phone: [
          { required: true, message: "请输入手机号", trigger: "blur" },
          { min: 11, max: 11, message: "请输入正确的手机号码", trigger: "blur" }
        ],
        passWord: [{ required: true, message: "请输入密码", trigger: "blur" }]
      },
      registerRules: {
        phone: [
          { required: true, message: "请输入手机号", trigger: "blur" },
          {
            min: 11,
            max: 11,
            message: "请输入正确的手机号码",
            trigger: "blur"
          },
          { validator: checkphone, trigger: "blur" }
        ],
        userName: [
          { required: true, message: "请输入用户名", trigger: "blur" }
        ],
        passWord: [{ validator: checkpassWord, trigger: "blur" }],
        confirmPassWord: [{ validator: checkconfirmPassWord, trigger: "blur" }],
        email: [{ validator: emailCheck, trigger: "blur" }]
      }
    };
  },
  methods: {
    ...mapMutations(["changeUserId", "changeLoginState", "changeUserInfo"]),
    ...mapActions(["getGoodsById", "shoppingCartList"]),
    //登录
    userLogin(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          UserLogin({ params: this.loginForm })
            .then(res => {
              console.log(res);
              if (res.data.length > 0) {
                let _this = this;
                this.$message.success(res.message || "登录成功");
                this.changeLoginState(true);
                this.changeUserId(res.data[0].user_id); //设置vuex里的userId
                this.changeUserInfo(res.data);
                this.shoppingCartList({ userId: this.userId });
                console.log(this.userInfo);
              } else {
                this.$message.error("用户名或密码错误");
                return;
              }
            })
            .catch(err => {
              console.log(err);
              this.$message.error("服务器跑丢了");
            });
        } else {
          return false;
        }
      });
    },
    //注册
    userRegister(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          UserRegister({ params: this.registerForm })
            .then(res => {
              console.log(res);
              //注册成功，添加默认店铺，店铺状态未开通
              let userId = res.data.insertId;
              this.changeUserId(userId);
              UserAddShop({
                params: {
                  shopName: this.registerForm.userName + "的店铺",
                  shopIntroduce: "暂无",
                  state: 2,
                  userId: userId
                }
              }).then(res => {
                console.log(res);
                //查询用户信息，并自动登录
                GetUserInfo({ params: { userId: userId } }).then(res => {
                  console.log(res);
                  this.changeUserInfo(res.data); //设置vuex里userInfo
                  this.changeLoginState(true);
                  this.$message.success("注册成功,已自动登录");
                  this.dialogFormVisible = false;
                });
              });
            })
            .catch(err => {
              this.$message.error("服务器跑丢了");
              console.log(err);
            });
        } else {
          return false;
        }
      });
    }
  },
  computed: {
    ...mapState({
      loginState: state => state.loginState,
      userId: state => state.userId,
      userInfo: state => state.userInfo,
      shoppingCartInfo: state => state.shoppingCartInfo
    })
  },
  components: { SearchBox, MFooter }
};
</script>
<style scoped>
.top_box {
  background: #f2f2f2;
}
.top {
  /* padding: 2px 5px; */
  display: flex;
  justify-content: flex-start;
  flex-direction: row;
}
.is_login {
  color: #606266;
  font-size: 14px;
  padding: 5px;
}
.top_span {
  font-size: 14px;
  height: 14px;
}
</style>
