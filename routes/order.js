// 控制层/路由处理层代码，解析request请求的参数，做一些合法性的校验，如果参数不合法，直接向表示层响应异常状态码。如果参数合法，异步调用Service业务层
let express = require('express');
let router = express.Router();
const validator = require('validator');
const orderService = require("../service/orderService");

// 添加订单
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
  const data = await orderService.updateOrder(name, phone, address, payment, pk_order_id);
  res.send({status: 0, data: data});
})

// 删除订单
router.post('/deleteOrder', async function (req, res) {
  const {pk_order_id} = req.body
  const data = await orderService.deleteOrder(pk_order_id);
  res.send({status: 0, data: data});
})

// 获取所有订单列表
router.get('/searchOrders', async function (req, res) {
  const {searchName, searchType} = req.query
  console.log(searchName, searchType)
  let data
  if (searchType === 'productId') {
    data = await orderService.getOrderById(searchName);
  } else if (searchType === 'userId') {
    data = await orderService.getOrdersByUserId(searchName);
  }
  res.send({status: 0, data: data});
})

module.exports = router;