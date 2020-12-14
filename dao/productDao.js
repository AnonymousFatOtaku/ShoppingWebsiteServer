// 商品DAO，只负责数据库操作
let mysql = require('mysql');
let db = require('../dao/db');

// 添加商品
const addProduct = async (name, price, categoryId, imgs, detail) => {
  let sql = 'INSERT INTO t_product(fk_category_id,name,price,image,description) VALUES (?,?,?,?,?)'
  let sqlParams = [categoryId, name, price, imgs, detail]
  return new Promise((resolve, reject) => {
    db.connection.query(sql, sqlParams, (error, result) => {
      console.log(sql, sqlParams)
      if (error) {
        console.error('添加商品异常')
        reject(error)
      } else {
        console.error('添加商品正常')
        resolve(result)
      }
    })
  })
}

// 获取所有商品列表
const getAllProducts = async () => {
  let sql = 'SELECT pk_product_id,fk_category_id,name,description,image,price,saleable,gmt_create,gmt_modified FROM t_product WHERE is_delete = 0'
  return new Promise((resolve, reject) => {
    db.connection.query(sql, (error, result) => {
      if (error) {
        console.log('获取商品列表异常')
        reject(error)
      } else {
        console.log('获取商品列表正常')
        resolve(result)
      }
    })
  })
}

// 更新商品
const updateProduct = async (categoryId, name, price, imgs, detail, pk_product_id) => {
  let sql = 'UPDATE t_product SET fk_category_id = ?,name = ?,price = ?,image = ?,description = ?,gmt_modified = NOW() WHERE pk_product_id = ?'
  let sqlParams = [categoryId, name, price, imgs, detail, pk_product_id]
  return new Promise((resolve, reject) => {
    db.connection.query(sql, sqlParams, (error, result) => {
      console.log(sql, sqlParams)
      if (error) {
        console.error('更新商品异常')
        reject(error)
      } else {
        console.error('更新商品正常')
        resolve(result)
      }
    })
  })
}

// 删除商品
const deleteProduct = async (pk_product_id) => {
  let sql = 'UPDATE t_product SET is_delete = 1,gmt_modified = NOW() WHERE pk_product_id = ?'
  return new Promise((resolve, reject) => {
    db.connection.query(sql, pk_product_id, (error, result) => {
      if (error) {
        console.error('删除商品异常')
        reject(error)
      } else {
        console.error('删除商品正常')
        resolve(result)
      }
    })
  })
}

// 更新商品状态
const updateStatus = async (productId, status) => {
  let sql = 'UPDATE t_product SET saleable = ?,gmt_modified = NOW() WHERE pk_product_id = ?'
  let sqlParams = [status, productId]
  return new Promise((resolve, reject) => {
    db.connection.query(sql, sqlParams, (error, result) => {
      if (error) {
        console.error('更新商品状态异常')
        reject(error)
      } else {
        console.error('更新商品状态正常')
        resolve(result)
      }
    })
  })
}

// 根据条件搜索商品
const searchProducts = async (searchName, searchType) => {
  let sql
  if (searchType === 'productName') {
    sql = "SELECT pk_product_id,fk_category_id,name,description,image,price,saleable,gmt_create,gmt_modified FROM t_product WHERE is_delete = 0 AND name LIKE " + mysql.escape("%" + searchName + "%")
  } else if (searchType === 'categoryId') {
    sql = 'SELECT pk_product_id,fk_category_id,name,description,image,price,saleable,gmt_create,gmt_modified FROM t_product WHERE is_delete = 0 AND fk_category_id = ?'
  }
  return new Promise((resolve, reject) => {
    db.connection.query(sql, searchName, (error, result) => {
      if (error) {
        console.log('根据条件搜索商品异常')
        reject(error)
      } else {
        console.log('根据条件搜索商品正常')
        resolve(result)
      }
    })
  })
}

module.exports = {
  addProduct,
  getAllProducts,
  updateProduct,
  deleteProduct,
  updateStatus,
  searchProducts,
}