// 控制层/路由处理层代码，解析request请求的参数，做一些合法性的校验，如果参数不合法，直接向表示层响应异常状态码。如果参数合法，异步调用Service业务层
const express = require('express');
const router = express.Router();
const validator = require('validator');
const adminService = require("../service/adminService");
const logService = require("../service/logService");
// 引入jwt token工具
let JwtUtil = require('../public/utils/jwtUtils');

// 添加用户
router.post('/addAdmin', async function (req, res) {
  // 读取请求参数数据
  const {username, password} = req.body
  const data = await adminService.addAdmin(username, password);
  res.send(data);
})

// 获取所有用户列表
router.get('/getAllAdmins', async function (req, res) {
  const data = await adminService.getAllAdmins();
  res.send(data);
});

// 更新用户
router.post('/updateAdmin', async function (req, res) {
  const {username, password} = req.body
  const data = await adminService.updateAdmin(username, password);
  res.send(data);
})

// 删除用户
router.post('/deleteAdmin', async function (req, res) {
  const {username} = req.body
  const data = await adminService.deleteAdmin(username);
  res.send(data);
})

/*
* 登录(可使用用户名/手机号/邮箱登录)
* 1.获取用户输入的用户名/手机号/邮箱和密码与数据库中数据比对，不匹配则返回错误提示
* 2.数据匹配则说明登录成功，保存该用户到cookie中
* 3.更新该用户登录时间、上次登录时间、登录次数三项数据
* 4.创建该用户的登录日志
* */
router.post('/adminLogin', async function (req, res) {
  const {username, password} = req.body
  // 验证获取到的数据是否符合规范
  if (!validator.matches(username, /^[a-zA-Z0-9_]{3,12}$/)) { // 通过matches进行正则验证
    res.send({status: 1, msg: '用户名格式不正确，请检查后重新输入'})
  } else if (!validator.matches(password, /^[a-zA-Z0-9_]{3,12}$/)) {
    res.send({status: 1, msg: '密码格式不正确，请检查后重新输入'})
  } else { // 所有数据验证通过才进行数据库操作
    const user = await adminService.adminLogin(username, password);
    console.log(user)
    if (user[0]) {// 登录成功
      // 获取用户上次登录时间和次数
      const adminLastLoginInfo = await adminService.getAdminLastLoginInfo(user[0].username)
      // console.log(adminLastLoginInfo[0].login_time, adminLastLoginInfo[0].login_count)
      // 更新用户登录时间、上次登录时间、登录次数
      await adminService.updateAdminLoginInfo(adminLastLoginInfo[0].login_time, adminLastLoginInfo[0].login_count, user[0].username)
      // 添加登录日志
      await logService.addLog(4, user[0].pk_user_id)
      // 生成token
      let jwtUtil = new JwtUtil(user[0].pk_user_id, user[0].username)
      let token = jwtUtil.generateToken()
      console.log(token)
      // 将token返回给客户端
      res.send({status: 0, data: user[0], token: token});
    } else {// 登录失败
      res.send({status: 1, msg: '用户名或密码不正确'})
    }
  }
})

module.exports = router;