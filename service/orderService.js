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
const updateOrder = async (categoryName, categoryDescription, categoryId) => {
  let data = await orderDao.updateOrder(categoryName, categoryDescription, categoryId)
  return data
}

// 删除订单
const deleteOrder = async (pk_category_id) => {
  let data = await orderDao.deleteOrder(pk_category_id)
  return data
}

module.exports = {
  addOrder,
  getAllOrders,
  updateOrder,
  deleteOrder,
}