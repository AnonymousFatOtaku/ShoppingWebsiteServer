// 控制层/路由处理层代码，解析request请求的参数，做一些合法性的校验，如果参数不合法，直接向表示层响应异常状态码。如果参数合法，异步调用Service业务层
var express = require('express');
var router = express.Router();
const validator = require('validator');
const roleService = require("../service/roleService");

// 添加角色
router.post('/addRole', async function (req, res) {
  const {parent_role_id, name, description} = req.body
  console.log(parent_role_id, name, description)
  if (!validator.isInt(parent_role_id)) {
    res.send({status: 1, msg: '父级角色ID不符合规范'})
  } else if (name === null || name === undefined || name.indexOf(' ') === 0 || name === "" || name.length > 15) {
    res.send({status: 1, msg: '角色名不符合规范'})
  } else if (description === null || description === undefined || description.indexOf(' ') === 0 || description === "" || description.length > 100) {
    res.send({status: 1, msg: '角色描述不符合规范'})
  } else {
    const data = await roleService.addRole(parent_role_id, name, description);
    res.send({status: 0, data: data});
  }
})

// 获取所有角色列表
router.get('/getAllRoles', async function (req, res) {
  const data = await roleService.getAllRoles();
  res.send({status: 0, data: data});
});

// 更新角色
router.post('/updateRole', async function (req, res) {
  const {name, description, pk_role_id} = req.body
  const data = await roleService.updateRole(name, description, pk_role_id);
  res.send(data);
})

// 删除角色
router.post('/deleteRole', async function (req, res) {
  const {pk_role_id} = req.body
  const data = await roleService.deleteRole(pk_role_id);
  res.send(data);
})

// 根据用户id获取用户角色
router.get('/getRoleByUserId', async function (req, res) {
  const {pk_user_id} = req.query
  const data = await roleService.getRoleByUserId(pk_user_id);
  res.send({status: 0, data: data});
});

module.exports = router;