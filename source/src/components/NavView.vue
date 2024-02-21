<template>
  <div class="header-nav">
    <div class="header-left-logo">
      <a href=""><img src="" alt="" /></a>
    </div>
    <div class="header-list">
      <ul>
        <li><a href="">首页</a></li>
        <li><a href="">职位</a></li>
        <li><a href="">公司</a></li>
      </ul>
    </div>
    <div class="header-right-login">
      <span><a href="">个人版登录</a></span> / <span><a href="">企业版登录</a></span>
    </div>
  </div>
</template>

<script lang="ts" setup></script>
<style lang="less" scoped>
li {
  list-style: none;
}
a {
  text-decoration: none;
}
.header-nav {
  overflow: hidden;
  div {
    float: left;
    ul {
      li {
        float: left;
      }
    }
  }
}
</style>
