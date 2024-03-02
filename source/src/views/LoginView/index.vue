<template>
  <div class="body">
      <el-form :rules="rules" ref="rulesLoginForm" :model="loginForm" class="loginContainer">
          <h3 class="loginTitle">
          欢迎登录
          </h3>
          <el-form-item prop="username">
              <el-input type="text" v-model="loginForm.username" placeholder="请输入用户名" >
              </el-input>
          </el-form-item>
          <el-form-item prop="password">
              <el-input type="password" v-model="loginForm.password" placeholder="请输入密码" >
              </el-input>
          </el-form-item>
          <!-- <el-form-item prop="code">
              <el-input type="text" auto-complete="false" v-model="loginForm.code" placeholder="点击图片更换验证码" style="width: 250px;margin-right: 5px">
              </el-input>
              <img :src="captchaUrl">

          </el-form-item> -->
          <el-checkbox v-model="checked" class="loginRemember">记住我</el-checkbox>
          <el-button type="primary" style="width:100%" @click="submitLogin(rulesLoginForm)">登录</el-button>
      </el-form>
  </div>
</template>

<script setup>
import { ref } from "vue";
import { useRoute } from "vue-router";
import { useUserStore } from '@/stores/user'

const router = useRoute();
const {Login} = useUserStore();

const loginForm = ref({
  username: "",
  password: "",
  // code: ''
});

const rulesLoginForm = ref();

const checked = ref(false);

const rules = {
  username: [{required:true,message:"请输入用户名",trigger:"blur"},{ min: 5, max: 14, message: '长度在 5 到 14 个字符', trigger: 'blur' }],
  password: [{required:true, message:"请输入密码", trigger:"blur"},{ min: 4, max: 12, message: '密码长度要在4到12之间', trigger: 'blur' }],
  // code:[{required:true,message:"请输入验证码",trigger:"blur"}]
}
const submitLogin = (rulesLoginForm) => {
  rulesLoginForm.validate((validate)=>{
    if(validate){
      Login({
        username: loginForm.value.username,
        password: loginForm.value.password
      });
    }else{
      return false;
    }
  })
  // console.log(rulesLoginForm.v.validate);
  // this.$refs.loginForm.validate((valid) => {
  //   console.log(valid);
  //   //   if (valid) { 

  //   // console.log(this.loginForm);
  //   //     this.$message({
  //   //     showClose: true,
  //   //     message: '登录成功！',
  //   //     type: 'success'
  //   //     });
  //   //     this.$router.push('/home')
  //   //   } else {
  //   //       this.$message.error('登录出错请重新输入');
  //   //       return false;
  //   //   }
  // });
  // console.log(loginForm.value)
}
</script>

<style lang="less" scoped>
  .loginContainer{
      border-radius: 15px;
      background-clip: padding-box;
      text-align: left;
      margin: auto;
      margin-top: 180px;
      width: 350px;
      padding: 15px 35px 15px 35px;
      background: aliceblue;
      border:1px solid blueviolet;
      box-shadow: 0 0 25px #f885ff;
  }
  .loginTitle{
      margin: 0px auto 48px auto;
      text-align: center;
      font-size: 40px;
  }
  .loginRemember{
      text-align: left;
      margin: 0px 0px 15px 0px;
  }
  .body{
      width: 100vw;
      height: 100vh;
      background-image: url("../assets/background.png") ;
      background-size:100%;
     overflow: hidden;
  }
</style>


