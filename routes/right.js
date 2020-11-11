// 控制层/路由处理层代码，解析request请求的参数，做一些合法性的校验，如果参数不合法，直接向表示层响应异常状态码。如果参数合法，异步调用Service业务层
var express = require('express');
var router = express.Router();
const rightService = require("../service/rightService");

// 添加角色
router.post('/addRight', async function (req, res) {
  const {parent_right_id, name, description} = req.body
  const data = await rightService.addRight(parent_right_id, name, description);
  res.send(data);
})

// 获取所有用户列表
router.get('/getAllRights', async function (req, res) {
  const data = await rightService.getAllRights();
  res.send(data);
});

// 更新用户
router.post('/updateRight', async function (req, res) {
  const {name, description, pk_right_id} = req.body
  const data = await rightService.updateRight(name, description, pk_right_id);
  res.send(data);
})

// 删除用户
router.post('/deleteRight', async function (req, res) {
  const {pk_right_id} = req.body
  const data = await rightService.deleteRight(pk_right_id);
  res.send(data);
})

module.exports = router;