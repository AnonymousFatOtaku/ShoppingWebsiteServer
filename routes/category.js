// 控制层/路由处理层代码，解析request请求的参数，做一些合法性的校验，如果参数不合法，直接向表示层响应异常状态码。如果参数合法，异步调用Service业务层
let express = require('express');
let router = express.Router();
const validator = require('validator');
const categoryService = require("../service/categoryService");

// 添加品类
router.post('/addCategory', async function (req, res) {
  const {parent_category_id, name, description} = req.body
  if (!validator.isInt(parent_category_id.toString())) { // 通过matches进行正则验证
    res.send({status: 1, msg: '分类id格式不正确，请检查后重新输入'})
  } else if (!validator.isLength(name, {min: 1, max: 15})) { // 通过matches进行正则验证
    res.send({status: 1, msg: '分类名称长度不正确，请检查后重新输入'})
  } else if (!validator.isLength(description, {min: 0, max: 100})) { // 通过matches进行正则验证
    res.send({status: 1, msg: '分类描述长度不正确，请检查后重新输入'})
  } else { // 所有数据验证通过才进行数据库操作
    console.log(parent_category_id, name, description)
    const data = await categoryService.addCategory(parent_category_id, name, description);
    res.send({status: 0, data: data});
  }
})

// 获取所有品类列表
router.get('/getAllCategories', async function (req, res) {
  const data = await categoryService.getAllCategories();
  res.send({status: 0, data: data});
})

// 更新品类
router.post('/updateCategory', async function (req, res) {
  const {categoryName, categoryDescription, categoryId} = req.body
  if (!validator.isLength(categoryName, {min: 1, max: 15})) { // 通过matches进行正则验证
    res.send({status: 1, msg: '分类名称长度不正确，请检查后重新输入'})
  } else if (!validator.isLength(categoryDescription, {min: 0, max: 100})) { // 通过matches进行正则验证
    res.send({status: 1, msg: '分类描述长度不正确，请检查后重新输入'})
  } else if (!validator.isInt(categoryId.toString())) { // 通过matches进行正则验证
    res.send({status: 1, msg: '分类id格式不正确，请检查后重新输入'})
  } else { // 所有数据验证通过才进行数据库操作{ // 所有数据验证通过才进行数据库操作
    console.log(categoryName, categoryDescription, categoryId)
    const data = await categoryService.updateCategory(categoryName, categoryDescription, categoryId);
    res.send({status: 0, data: data});
  }
})

// 删除品类
router.post('/deleteCategory', async function (req, res) {
  const {pk_category_id} = req.body
  console.log(pk_category_id)
  const data = await categoryService.deleteCategory(pk_category_id);
  res.send({status: 0, data: data});
})

// 获取一/二级品类列表
router.get('/getCategoriesByParentId', async function (req, res) {
  const {parent_category_id} = req.query
  console.log(parent_category_id)
  if (!validator.isInt(parent_category_id.toString())) { // 通过matches进行正则验证
    res.send({status: 1, msg: '分类id格式不正确，请检查后重新输入'})
  } else { // 所有数据验证通过才进行数据库操作
    const data = await categoryService.getCategoriesByParentId(parent_category_id);
    res.send({status: 0, data: data});
  }
})

// 根据id获取分类
router.get('/getCategoryById', async function (req, res) {
  const {categoryId} = req.query
  // console.log(categoryId)
  if (!validator.isInt(categoryId.toString())) { // 通过matches进行正则验证
    res.send({status: 1, msg: '分类id格式不正确，请检查后重新输入'})
  } else { // 所有数据验证通过才进行数据库操作
    const data = await categoryService.getCategoryById(categoryId);
    // console.log(data)
    res.send({status: 0, data: data});
  }
})

module.exports = router;