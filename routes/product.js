// 控制层/路由处理层代码，解析request请求的参数，做一些合法性的校验，如果参数不合法，直接向表示层响应异常状态码。如果参数合法，异步调用Service业务层
let express = require('express');
let router = express.Router();
const validator = require('validator');
const productService = require("../service/productService");

// 添加商品
router.post('/addProduct', async function (req, res) {
  const {parent_category_id, name, description} = req.body
  console.log(parent_category_id, name, description)
  const data = await productService.addProduct(parent_category_id, name, description);
  res.send({status: 0, data: data});
})

// 获取所有商品列表
router.get('/getAllProducts', async function (req, res) {
  const data = await productService.getAllProducts();
  res.send({status: 0, data: data});
})

// 更新商品
router.post('/updateProduct', async function (req, res) {
  const {categoryName, categoryDescription, categoryId} = req.body
  console.log(categoryName, categoryDescription, categoryId)
  const data = await productService.updateProduct(categoryName, categoryDescription, categoryId);
  res.send({status: 0, data: data});
})

// 删除商品
router.post('/deleteProduct', async function (req, res) {
  const {pk_category_id} = req.body
  const data = await productService.deleteProduct(pk_category_id);
  res.send({status: 0, data: data});
})

module.exports = router;