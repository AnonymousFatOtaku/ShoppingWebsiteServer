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
const updateOrder = async (name, phone, address, payment, pk_order_id) => {
  let sql = 'UPDATE t_order SET name = ?,phone = ?,address = ?,payment = ?,gmt_modified = NOW() WHERE is_delete = 0 AND pk_order_id = ?'
  let sqlParams = [name, phone, address, payment, pk_order_id]
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
const deleteOrder = async (pk_order_id) => {
  let sql = 'UPDATE t_order SET is_delete = 1,gmt_modified = NOW() WHERE is_delete = 0 AND pk_order_id = ?'
  return new Promise((resolve, reject) => {
    db.connection.query(sql, pk_order_id, (error, result) => {
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

// 根据订单id获取订单详情
const getOrderInfoByOrderId = async (fk_order_id) => {
  let sql = 'SELECT pk_order_detail_id,fk_order_id,fk_product_id,name,price,quantity,total_price,gmt_create,gmt_modified FROM t_order_detail WHERE is_delete = 0 AND fk_order_id = ?'
  return new Promise((resolve, reject) => {
    db.connection.query(sql, fk_order_id, (error, result) => {
      if (error) {
        console.log('根据订单id获取订单详情异常')
        reject(error)
      } else {
        console.log('根据订单id获取订单详情正常')
        resolve(result)
      }
    })
  })
}

// 根据条件搜索订单
const searchOrders = async (searchName, searchType) => {
  let sql
  if (searchType === 'orderId') {
    sql = 'SELECT pk_order_id,fk_user_id,name,phone,address,payment,status,order_time,gmt_create,gmt_modified FROM t_order WHERE is_delete = 0 AND pk_order_id = ?'
  } else if (searchType === 'userId') {
    sql = 'SELECT pk_order_id,fk_user_id,name,phone,address,payment,status,order_time,gmt_create,gmt_modified FROM t_order WHERE is_delete = 0 AND fk_user_id = ?'
  }
  return new Promise((resolve, reject) => {
    db.connection.query(sql, searchName, (error, result) => {
      if (error) {
        console.log('根据条件搜索订单异常')
        reject(error)
      } else {
        console.log('根据条件搜索订单正常')
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
  getOrderInfoByOrderId,
  searchOrders,
}