// 活动DAO，只负责数据库操作
let db = require('../dao/db');

// 添加活动
const addPromotion = async (name, description, discount, start_time, end_time) => {
  let sql = 'INSERT INTO t_promotion(name,description,discount,start_time,end_time) VALUES (?,?,?,?,?)'
  let sqlParams = [name, description, discount, start_time, end_time]
  return new Promise((resolve, reject) => {
    db.connection.query(sql, sqlParams, (error, result) => {
      if (error) {
        console.error('添加活动异常')
        reject(error)
      } else {
        console.error('添加活动正常')
        resolve(result)
      }
    })
  })
}

// 获取所有活动列表
const getAllPromotions = async () => {
  let sql = 'SELECT pk_promotion_id,name,description,discount,start_time,end_time,gmt_create,gmt_modified FROM t_promotion WHERE is_delete = 0'
  return new Promise((resolve, reject) => {
    db.connection.query(sql, (error, result) => {
      if (error) {
        console.log('获取活动列表异常')
        reject(error)
      } else {
        console.log('获取活动列表正常')
        resolve(result)
      }
    })
  })
}

// 更新活动
const updatePromotion = async (name, description, discount, start_time, end_time, pk_promotion_id) => {
  let sql = 'UPDATE t_promotion SET name = ?,description = ?,discount = ?,start_time = ?,end_time = ?,gmt_modified = NOW() WHERE is_delete = 0 AND pk_promotion_id = ?'
  let sqlParams = [name, description, discount, start_time, end_time, pk_promotion_id]
  return new Promise((resolve, reject) => {
    db.connection.query(sql, sqlParams, (error, result) => {
      if (error) {
        console.error('更新活动异常')
        reject(error)
      } else {
        console.error('更新活动正常')
        resolve(result)
      }
    })
  })
}

// 删除活动
const deletePromotion = async (pk_promotion_id) => {
  let sql = 'UPDATE t_promotion SET is_delete = 1,gmt_modified = NOW() WHERE is_delete = 0 AND pk_promotion_id = ?'
  return new Promise((resolve, reject) => {
    db.connection.query(sql, pk_promotion_id, (error, result) => {
      if (error) {
        console.error('删除活动异常')
        reject(error)
      } else {
        console.error('删除活动正常')
        resolve(result)
      }
    })
  })
}

module.exports = {
  addPromotion,
  getAllPromotions,
  updatePromotion,
  deletePromotion,
}