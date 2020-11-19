// 控制层/路由处理层代码，解析request请求的参数，做一些合法性的校验，如果参数不合法，直接向表示层响应异常状态码。如果参数合法，异步调用Service业务层
const express = require('express');
const router = express.Router();
const validator = require('validator');
const userService = require("../service/userService");
const logService = require("../service/logService");
const roleService = require("../service/roleService");
// 引入jwt token工具
let JwtUtil = require('../public/utils/jwtUtils');

/*
* 添加用户
* 1.获取用户名、密码、电话号码、邮箱
* 2.分别验证用户名、电话号码、邮箱是否已存在，若存在则返回提示
* 3.添加用户信息到数据库
* 4.添加注册日志
* */
router.post('/addUser', async function (req, res) {
  const {username, password, phone, email} = req.body
  // 验证获取到的数据是否符合规范
  if (!validator.matches(username, /^[a-zA-Z0-9_]{3,12}$/)) { // 通过matches进行正则验证
    res.send({status: 1, msg: '用户名格式不正确，请检查后重新输入'})
  } else if (!validator.matches(password, /^[a-zA-Z0-9_]{3,12}$/)) {
    res.send({status: 1, msg: '密码格式不正确，请检查后重新输入'})
  } else if (!validator.matches(phone, /^1[3456789]\d{9}$/)) {
    res.send({status: 1, msg: '手机号格式不正确，请检查后重新输入'})
  } else if (!validator.isEmail(email)) { // 通过isEmail进行邮箱验证
    res.send({status: 1, msg: '邮箱格式不正确，请检查后重新输入'})
  } else { // 所有数据验证通过才进行数据库操作
    const user = await userService.getUserByUsernameAndPhoneAndEmail(username, phone, email)
    if (user[0]) {
      // console.log(user[0])
      res.send({status: 1, msg: '用户信息已存在'})
    } else {
      const data = await userService.addUser(username, password, phone, email);
      await logService.addLog(5, username)
      res.send({status: 0, data: data});
    }
  }
})

// 获取所有用户列表
router.get('/getAllUsers', async function (req, res) {
  const data = await userService.getAllUsers();
  res.send({status: 0, data: data});
});

// 更新用户
router.post('/updateUser', async function (req, res) {
  const {pk_user_id, username, password, phone, email, role_id} = req.body
  console.log(pk_user_id, username, password, phone, email, role_id)

  // 验证获取到的数据是否符合规范
  if (!validator.isInt(pk_user_id)) {
    res.send({status: 1, msg: '用户id格式不正确，请检查后重新输入'})
  } else if (!validator.matches(username, /^[a-zA-Z0-9_]{3,12}$/)) { // 通过matches进行正则验证
    res.send({status: 1, msg: '用户名格式不正确，请检查后重新输入'})
  } else if (!validator.matches(password, /^[a-zA-Z0-9_]{3,12}$/)) {
    res.send({status: 1, msg: '密码格式不正确，请检查后重新输入'})
  } else if (!validator.matches(phone, /^1[3456789]\d{9}$/)) {
    res.send({status: 1, msg: '手机号格式不正确，请检查后重新输入'})
  } else if (!validator.isEmail(email)) { // 通过isEmail进行邮箱验证
    res.send({status: 1, msg: '邮箱格式不正确，请检查后重新输入'})
  } else if (!validator.isInt(role_id)) {
    res.send({status: 1, msg: '角色id格式不正确，请检查后重新输入'})
  } else { // 所有数据验证通过才进行数据库操作
    // 判断用户类型为普通用户还是管理员
    let type = 0
    if (role_id != 6) {
      type = 1
    }
    const data = await userService.updateUser(pk_user_id, username, password, phone, email, type);
    const result = await roleService.updateRoleByUserId(pk_user_id, role_id);
    res.send({status: 0});
  }
})

// 删除用户
router.post('/deleteUser', async function (req, res) {
  const {pk_user_id} = req.body
  if (!validator.isInt(pk_user_id)) {
    res.send({status: 1, msg: '用户id格式不正确，请检查后重新输入'})
  } else {
    const data = await userService.deleteUser(pk_user_id);
    res.send({status: 0, data: data});
  }
})

/*
* 登录(可使用用户名/手机号/邮箱登录)
* 1.获取用户输入的用户名/手机号/邮箱和密码与数据库中数据比对，不匹配则返回错误提示
* 2.数据匹配则说明登录成功，保存该用户到cookie中
* 3.更新该用户登录时间、上次登录时间、登录次数三项数据
* 4.创建该用户的登录日志
* */
router.post('/userLogin', async function (req, res) {
  const {username, password} = req.body
  // 验证获取到的数据是否符合规范
  if (!validator.matches(username, /^[a-zA-Z0-9_]{3,12}$/)) { // 通过matches进行正则验证
    res.send({status: 1, msg: '用户名格式不正确，请检查后重新输入'})
  } else if (!validator.matches(password, /^[a-zA-Z0-9_]{3,12}$/)) {
    res.send({status: 1, msg: '密码格式不正确，请检查后重新输入'})
  } else { // 所有数据验证通过才进行数据库操作
    const user = await userService.userLogin(username, password);
    if (user[0]) {// 登录成功
      // 获取用户上次登录时间和次数
      const userLastLoginInfo = await userService.getUserLastLoginInfo(user[0].username)
      // console.log(userLastLoginInfo[0].login_time, userLastLoginInfo[0].login_count)
      // 更新用户登录时间、上次登录时间、登录次数
      await userService.updateUserLoginInfo(userLastLoginInfo[0].login_time, userLastLoginInfo[0].login_count, user[0].username)
      // 添加登录日志
      await logService.addLog(4, user[0].username)
      // 生成token
      let jwtUtil = new JwtUtil(user[0].pk_user_id, user[0].username)
      let token = jwtUtil.generateToken()
      console.log(token)
      // 将token返回给客户端
      res.send({status: 0, data: user, token: token});
    } else {// 登录失败
      res.send({status: 1, msg: '用户名或密码不正确'})
    }
  }
})

module.exports = router;