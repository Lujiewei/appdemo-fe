import { defineStore } from 'pinia';
import { ref } from 'vue';
import {LoginApi} from '@/api/user'

export const useUserStore = defineStore('user',()=>{
  const userInfo = ref({})
  const token = ref('')
  const Login = async (data)=>{
    const res = await LoginApi(data);
    token.value = res.data.user_login_token;
  }
  return{
    token,
    userInfo,
    Login
  }
},{
  persist: true
})