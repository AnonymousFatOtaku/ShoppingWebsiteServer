// 商品Service层，对Dao层发起异步DML操作
const productDao = require("../dao/productDao");

// 添加商品
const addProduct = async (name, price, categoryId, imgs, detail) => {
  let data = await productDao.addProduct(name, price, categoryId, imgs, detail)
  return data
}

// 获取所有商品列表
const getAllProducts = async () => {
  let data = await productDao.getAllProducts()
  return data
}

// 更新商品
const updateProduct = async (fk_category_id, name, price, image, description, pk_product_id) => {
  let data = await productDao.updateProduct(fk_category_id, name, price, image, description, pk_product_id)
  return data
}

// 删除商品
const deleteProduct = async (pk_category_id) => {
  let data = await productDao.deleteProduct(pk_category_id)
  return data
}

// 更新商品状态
const updateStatus = async (productId, status) => {
  let data = await productDao.updateStatus(productId, status)
  return data
}

// 根据商品名搜索商品
const searchProductsByProductName = async (searchName) => {
  let data = await productDao.searchProductsByProductName(searchName)
  return data
}

// 根据分类id搜索商品
const searchProductsByCategoryId = async (searchName) => {
  let data = await productDao.searchProductsByCategoryId(searchName)
  return data
}

module.exports = {
  addProduct,
  getAllProducts,
  updateProduct,
  deleteProduct,
  updateStatus,
  searchProductsByProductName,
  searchProductsByCategoryId,
}