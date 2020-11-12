// 控制层/路由处理层代码，解析request请求的参数，做一些合法性的校验，如果参数不合法，直接向表示层响应异常状态码。如果参数合法，异步调用Service业务层
let express = require('express');
let router = express.Router();
const rightService = require("../service/rightService");
const roleService = require("../service/roleService");

// 添加权限
router.post('/addRight', async function (req, res) {
  const {parent_right_id, name, description} = req.body
  const data = await rightService.addRight(parent_right_id, name, description);
  res.send(data);
})

// 获取所有权限列表
router.get('/getAllRights', async function (req, res) {
  const data = await rightService.getAllRights();
  res.send(data);
})

// 更新权限
router.post('/updateRight', async function (req, res) {
  const {name, description, pk_right_id} = req.body
  const data = await rightService.updateRight(name, description, pk_right_id);
  res.send(data);
})

// 删除权限
router.post('/deleteRight', async function (req, res) {
  const {pk_right_id} = req.body
  const data = await rightService.deleteRight(pk_right_id);
  res.send(data);
})

/*
* 获取当前登录用户权限列表
* 1.根据pk_user_id获取用户角色
* 2.根据用户角色获取相应权限
* 3.返回获取到的权限
* */
router.get('/getRightsByUserId', async function (req, res) {
  const {pk_user_id} = req.query
  const role = await roleService.getRoleByUserId(pk_user_id)
  const roleId = role[0].fk_role_id
  const rights = await rightService.getRightsByRoleId(roleId)
  res.send(rights)
})

module.exports = router;