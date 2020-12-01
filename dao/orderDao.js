// 订单DAO，只负责数据库操作
let db = require('../dao/db');

// 添加订单
const addOrder = async (parent_category_id, name, description) => {
  let sql = 'INSERT INTO t_category(parent_category_id,name,description) VALUES (?,?,?)'
  let sqlParams = [parent_category_id, name, description]
  return new Promise((resolve, reject) => {
    db.connection.query(sql, sqlParams, (error, result) => {
      if (error) {
        console.error('添加订单异常')
        reject(error)
      } else {
        console.error('添加订单正常')
        resolve(result)
      }
    })
  })
}

// 获取所有订单列表
const getAllOrders = async () => {
  let sql = 'SELECT pk_order_id,fk_user_id,name,phone,address,payment,status,order_time,gmt_create,gmt_modified FROM t_order WHERE is_delete = 0'
  return new Promise((resolve, reject) => {
    db.connection.query(sql, (error, result) => {
      if (error) {
        console.log('获取所有订单列表异常')
        reject(error)
      } else {
        console.log('获取所有订单列表正常')
        resolve(result)
      }
    })
  })
}

// 更新订单
const updateOrder = async (categoryName, categoryDescription, categoryId) => {
  let sql = 'UPDATE t_category SET name = ?,description = ?,gmt_modified = NOW() WHERE is_delete = 0 AND pk_category_id = ?'
  let sqlParams = [categoryName, categoryDescription, categoryId]
  return new Promise((resolve, reject) => {
    db.connection.query(sql, sqlParams, (error, result) => {
      if (error) {
        console.error('更新订单异常')
        reject(error)
      } else {
        console.error('更新订单正常')
        resolve(result)
      }
    })
  })
}

// 删除订单
const deleteOrder = async (pk_category_id) => {
  let sql = 'UPDATE t_category SET is_delete = 0,gmt_modified = NOW() WHERE pk_category_id = ?'
  return new Promise((resolve, reject) => {
    db.connection.query(sql, pk_category_id, (error, result) => {
      if (error) {
        console.error('删除订单异常')
        reject(error)
      } else {
        console.error('删除订单正常')
        resolve(result)
      }
    })
  })
}

// 根据订单id获取订单列表
const getOrderById = async (pk_order_id) => {
  let sql = 'SELECT pk_order_id,fk_user_id,name,phone,address,payment,status,order_time,gmt_create,gmt_modified FROM t_order WHERE is_delete = 0 AND pk_order_id = ?'
  return new Promise((resolve, reject) => {
    db.connection.query(sql, pk_order_id, (error, result) => {
      if (error) {
        console.log('根据订单id获取订单列表异常')
        reject(error)
      } else {
        console.log('根据订单id获取订单列表正常')
        resolve(result)
      }
    })
  })
}

// 根据用户id获取订单列表
const getOrdersByUserId = async (fk_user_id) => {
  let sql = 'SELECT pk_order_id,fk_user_id,name,phone,address,payment,status,order_time,gmt_create,gmt_modified FROM t_order WHERE is_delete = 0 AND fk_user_id = ?'
  return new Promise((resolve, reject) => {
    db.connection.query(sql, fk_user_id, (error, result) => {
      if (error) {
        console.log('根据用户id获取订单列表异常')
        reject(error)
      } else {
        console.log('根据用户id获取订单列表正常')
        resolve(result)
      }
    })
  })
}

module.exports = {
  addOrder,
  getAllOrders,
  updateOrder,
  deleteOrder,
  getOrderById,
  getOrdersByUserId,
}