// 控制层/路由处理层代码，解析request请求的参数，做一些合法性的校验，如果参数不合法，直接向表示层响应异常状态码。如果参数合法，异步调用Service业务层
let express = require('express');
let router = express.Router();
const validator = require('validator');
const categoryService = require("../service/categoryService");

// 添加品类
router.post('/addCategory', async function (req, res) {
  const {parent_category_id, name, description} = req.body
  console.log(parent_category_id, name, description)
  const data = await categoryService.addCategory(parent_category_id, name, description);
  res.send({status: 0, data: data});
})

// 获取所有品类列表
router.get('/getAllCategories', async function (req, res) {
  const data = await categoryService.getAllCategories();
  res.send({status: 0, data: data});
})

// 更新品类
router.post('/updateCategory', async function (req, res) {
  const {categoryName, categoryDescription, categoryId} = req.body
  console.log(categoryName, categoryDescription, categoryId)
  const data = await categoryService.updateCategory(categoryName, categoryDescription, categoryId);
  res.send({status: 0, data: data});
})

// 删除品类
router.post('/deleteCategory', async function (req, res) {
  const {pk_category_id} = req.body
  const data = await categoryService.deleteCategory(pk_category_id);
  res.send({status: 0, data: data});
})

// 获取一/二级品类列表
router.get('/getCategoriesByParentId', async function (req, res) {
  const {parent_category_id} = req.query
  console.log(parent_category_id)
  const data = await categoryService.getCategoriesByParentId(parent_category_id);
  res.send({status: 0, data: data});
})

// 根据id获取分类
router.get('/getCategoryById', async function (req, res) {
  const {categoryId} = req.query
  // console.log(categoryId)
  const data = await categoryService.getCategoryById(categoryId);
  // console.log(data)
  res.send({status: 0, data: data});
})

module.exports = router;