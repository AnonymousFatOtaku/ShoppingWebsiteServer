// 控制层/路由处理层代码，解析request请求的参数，做一些合法性的校验，如果参数不合法，直接向表示层响应异常状态码。如果参数合法，异步调用Service业务层
let express = require('express');
let router = express.Router();
const validator = require('validator');
const orderService = require("../service/orderService");

// 添加订单(未使用)
router.post('/addOrder', async function (req, res) {
  const {parent_category_id, name, description} = req.body
  console.log(parent_category_id, name, description)
  const data = await orderService.addOrder(parent_category_id, name, description);
  res.send({status: 0, data: data});
})

// 获取所有订单列表
router.get('/getAllOrders', async function (req, res) {
  const data = await orderService.getAllOrders();
  res.send({status: 0, data: data});
})

// 更新订单
router.post('/updateOrder', async function (req, res) {
  const {name, phone, address, payment, pk_order_id} = req.body
  console.log(name, phone, address, payment, pk_order_id)
  if (!validator.isInt(pk_order_id.toString())) { // 通过matches进行正则验证
    res.send({status: 1, msg: '订单id长度不正确，请检查后重新输入'})
  } else { // 所有数据验证通过才进行数据库操作
    const data = await orderService.updateOrder(name, phone, address, payment, pk_order_id);
    res.send({status: 0, data: data});
  }
})

// 删除订单
router.post('/deleteOrder', async function (req, res) {
  const {pk_order_id} = req.body
  if (!validator.isInt(pk_order_id.toString())) { // 通过matches进行正则验证
    res.send({status: 1, msg: '订单id长度不正确，请检查后重新输入'})
  } else { // 所有数据验证通过才进行数据库操作
    const data = await orderService.deleteOrder(pk_order_id);
    res.send({status: 0, data: data});
  }
})

// 根据条件搜索订单
router.get('/searchOrders', async function (req, res) {
  const {searchName, searchType} = req.query
  console.log(searchName, searchType)
  let data = await orderService.searchOrders(searchName, searchType);
  res.send({status: 0, data: data});
})

// 根据订单id获取订单详情
router.get('/getOrderInfoByOrderId', async function (req, res) {
  const {fk_order_id} = req.query
  console.log(fk_order_id)
  if (!validator.isInt(fk_order_id.toString())) { // 通过matches进行正则验证
    res.send({status: 1, msg: '订单id长度不正确，请检查后重新输入'})
  } else { // 所有数据验证通过才进行数据库操作
    const data = await orderService.getOrderInfoByOrderId(fk_order_id);
    res.send({status: 0, data: data});
  }
})

module.exports = router;