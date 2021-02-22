<template>
  <div id="app">
    <router-view></router-view>
   
  </div>
</template>

<script>

export default {
  name: 'app',
  components: {
    
  }
}
</script>

<style>
*{
  margin: 0;
  padding: 0
}
#app {
  min-width: 1400px;
  overflow-x: auto;
}
.login .el-form-item{
  margin-bottom: 0px
}
.router-link {
  text-decoration: none;
}
.router-link-active {
  text-decoration: none;
}
a {
  text-decoration: none;
}
</style>
