// 品类DAO，只负责数据库操作
let db = require('../dao/db');

// 添加品类
const addCategory = async (parent_category_id, name, description) => {
  let sql = 'INSERT INTO t_category(parent_category_id,name,description) VALUES (?,?,?)'
  let sqlParams = [parent_category_id, name, description]
  return new Promise((resolve, reject) => {
    db.connection.query(sql, sqlParams, (error, result) => {
      if (error) {
        console.error('添加品类异常')
        reject(error)
      } else {
        console.error('添加品类正常')
        resolve(result)
      }
    })
  })
}

// 获取所有品类列表
const getAllCategories = async () => {
  let sql = 'SELECT pk_category_id,parent_category_id,name,description,gmt_create,gmt_modified FROM t_category WHERE is_delete = 0'
  return new Promise((resolve, reject) => {
    db.connection.query(sql, (error, result) => {
      if (error) {
        console.log('获取品类列表异常')
        reject(error)
      } else {
        console.log('获取品类列表正常')
        resolve(result)
      }
    })
  })
}

// 更新品类
const updateCategory = async (categoryName, categoryDescription, categoryId) => {
  let sql = 'UPDATE t_category SET name = ?,description = ?,gmt_modified = NOW() WHERE is_delete = 0 AND pk_category_id = ?'
  let sqlParams = [categoryName, categoryDescription, categoryId]
  return new Promise((resolve, reject) => {
    db.connection.query(sql, sqlParams, (error, result) => {
      if (error) {
        console.error('更新品类异常')
        reject(error)
      } else {
        console.error('更新品类正常')
        resolve(result)
      }
    })
  })
}

// 删除品类
const deleteCategory = async (pk_category_id) => {
  let sql = 'UPDATE t_category SET is_delete = 0,gmt_modified = NOW() WHERE pk_category_id = ?'
  return new Promise((resolve, reject) => {
    db.connection.query(sql, pk_category_id, (error, result) => {
      if (error) {
        console.error('删除品类异常')
        reject(error)
      } else {
        console.error('删除品类正常')
        resolve(result)
      }
    })
  })
}

// 获取一/二级品类列表
const getCategoriesByParentId = async (parent_category_id) => {
  let sql = 'SELECT pk_category_id,name,description,gmt_create,gmt_modified FROM t_category WHERE is_delete = 0 AND parent_category_id = ?'
  return new Promise((resolve, reject) => {
    db.connection.query(sql, parent_category_id, (error, result) => {
      if (error) {
        console.log('获取一/二级品类列表异常')
        reject(error)
      } else {
        console.log('获取一/二级品类列表正常')
        resolve(result)
      }
    })
  })
}

module.exports = {
  addCategory,
  getAllCategories,
  updateCategory,
  deleteCategory,
  getCategoriesByParentId,
}