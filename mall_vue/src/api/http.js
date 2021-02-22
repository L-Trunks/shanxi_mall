import QS from 'qs'; 
import axios from 'axios';

axios.defaults.baseURL = '/api';//本地
axios.defaults.timeout = 5000 // 请求超时
axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=UTF-8'; //配置请求头
axios.defaults.withCredentials = true 
/**
 * get方法，对应get请求
 * @param {String} url [url地址]
 * @param {Object} params [参数]
 */
export function get(url, params) {
    return new Promise((resolve, reject) => {
        axios.get(url, {
            params:params
        }).then(res => {
            resolve(res.data);
        }).catch(err => {
            reject(err.data)
        })
    });
}

/** 
 * post方法，对应post请求 
 * @param {String} url [url地址] 
 * @param {Object} params [参数] 
 */
export function post(url, params) {
    return new Promise((resolve, reject) => {
        console.log(params)
         axios.post(url, QS.stringify(params))
        .then(res => {
            resolve(res.data);
        })
        .catch(err =>{
            reject(err.data)
        })
    });
}