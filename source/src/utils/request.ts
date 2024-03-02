import axios from "axios";
import { useUserStore } from "@/stores/user";
import router from "@/router/index";


const request = axios.create({
  baseURL: "http://8.137.112.190:9102/",        
  timeout: 5000,
});

request.interceptors.request.use((config) => {
  const useUser = useUserStore();
  const token = useUser.token;
  if(token){
    config.headers.token = token;
  }
  return config;
},(error) =>{
  return Promise.reject(error);
});
request.interceptors.response.use(
  (res) => {
    if(res.status === 200){
      router.replace('/')
    }
    return res;
  },
  (error) => {
    return Promise.reject(new Error(error));
  }
);

export default request;
