// 订单Service层，对Dao层发起异步DML操作
const orderDao = require("../dao/orderDao");

// 添加订单
const addOrder = async (parent_category_id, name, description) => {
  let data = await orderDao.addOrder(parent_category_id, name, description)
  return data
}

// 获取所有订单列表
const getAllOrders = async () => {
  let data = await orderDao.getAllOrders()
  return data
}

// 更新订单
const updateOrder = async (name, phone, address, payment, pk_order_id) => {
  let data = await orderDao.updateOrder(name, phone, address, payment, pk_order_id)
  return data
}

// 删除订单
const deleteOrder = async (pk_order_id) => {
  let data = await orderDao.deleteOrder(pk_order_id)
  return data
}

// 根据订单id获取订单详情
const getOrderInfoByOrderId = async (fk_order_id) => {
  let data = await orderDao.getOrderInfoByOrderId(fk_order_id)
  return data
}

// 根据条件搜索订单
const searchOrders = async (searchName, searchType) => {
  let data = await orderDao.searchOrders(searchName, searchType)
  return data
}

module.exports = {
  addOrder,
  getAllOrders,
  updateOrder,
  deleteOrder,
  getOrderInfoByOrderId,
  searchOrders,
}