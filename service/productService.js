// 商品Service层，对Dao层发起异步DML操作
const productDao = require("../dao/productDao");

// 添加商品
const addProduct = async (parent_category_id, name, description) => {
  let data = await productDao.addProduct(parent_category_id, name, description)
  return data
}

// 获取所有商品列表
const getAllProducts = async () => {
  let data = await productDao.getAllProducts()
  return data
}

// 更新商品
const updateProduct = async (categoryName, categoryDescription, categoryId) => {
  let data = await productDao.updateProduct(categoryName, categoryDescription, categoryId)
  return data
}

// 删除商品
const deleteProduct = async (pk_category_id) => {
  let data = await productDao.deleteProduct(pk_category_id)
  return data
}

module.exports = {
  addProduct,
  getAllProducts,
  updateProduct,
  deleteProduct,
}