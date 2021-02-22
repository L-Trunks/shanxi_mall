import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import MallMain from '../views/MallMain.vue'
// import RightView from '../components/RightView.vue'
import GoodsView from '../components/GoodsView.vue'
import Setting from '../components/Setting.vue'
import GoodsDetail from '../components/GoodsDetail.vue'
import SearchResult from '../components/SearchResult.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: Home,
    children: [
      {
        path: '',
        component: MallMain,
        children: []
      },
      {
        path: '/setting',
        component: Setting
      },
      {
        path: '/goods_detail',
        component: GoodsDetail
      },
      {
        path: '/goods_list',
        component: GoodsView
      },
      {
        path: '/search_result',
        component: SearchResult
      }
    ]
  }
]

const originalPush = VueRouter.prototype.push;
VueRouter.prototype.push = function push(location) {
  return originalPush.call(this, location).catch(err => err)
};
const router = new VueRouter({
  routes
})

export default router
