// 品类Service层，对Dao层发起异步DML操作
const categoryDao = require("../dao/categoryDao");

// 添加品类
const addCategory = async (parent_category_id, name, description) => {
  let data = await categoryDao.addCategory(parent_category_id, name, description)
  return data
}

// 获取所有品类列表
const getAllCategories = async () => {
  let data = await categoryDao.getAllCategories()
  return data
}

// 更新品类
const updateCategory = async (categoryName, categoryDescription, categoryId) => {
  let data = await categoryDao.updateCategory(categoryName, categoryDescription, categoryId)
  return data
}

// 删除品类
const deleteCategory = async (pk_category_id) => {
  let data = await categoryDao.deleteCategory(pk_category_id)
  return data
}

// 获取一/二级品类列表
const getCategoriesByParentId = async (parent_category_id) => {
  let data = await categoryDao.getCategoriesByParentId(parent_category_id)
  return data
}

module.exports = {
  addCategory,
  getAllCategories,
  updateCategory,
  deleteCategory,
  getCategoriesByParentId,
}