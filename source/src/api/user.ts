import request from '@/utils/request'


export const LoginApi = (data) =>{
  return request({
    url: '/user/login',
    method: 'POST',
    data,
  })
}

// 获取用户信息
// export function getUserInfo (){
//   return request({
//     url: '/admin/acl/info',
//   });
// }
// // 注销用户登录信息
// export function delUserInfo () {
//   return request({
//     url: '/admin/acl/logout',
//     method: 'post',
//   });
// }