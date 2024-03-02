import { createRouter, createWebHistory } from 'vue-router'
import { ElMessage } from 'element-plus';
import HomePage from '@/views/HomeView/index.vue'
import { useUserStore } from '@/stores/user';

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomePage
    },
    {
      path: '/login',
      name: 'login',
      component: () => import('@/views/LoginView/index.vue')
    }
  ]
});

// router.beforeEach((to)=>{
//   const useUser = useUserStore();
//   const token = useUser.token;
//   if(to.name === 'login'){
//     if(token){
//       ElMessage('登录有效，请勿重新登录！')
//     }
//     return '/'
//   }
//   // if(to.name !== 'login' && !token){
//   //   ElMessage('登录超时，请重新登录！');
//   //   return '/login'
//   // }
// })

export default router
