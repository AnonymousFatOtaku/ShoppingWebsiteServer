// 控制层/路由处理层代码，解析request请求的参数，做一些合法性的校验，如果参数不合法，直接向表示层响应异常状态码。如果参数合法，异步调用Service业务层
let express = require('express');
let router = express.Router();
const validator = require('validator');
const productService = require("../service/productService");

// 添加商品
router.post('/addProduct', async function (req, res) {
  let {name, price, categoryId, imgs, detail} = req.body
  console.log(name, price, categoryId, imgs, detail)
  if (imgs.length === 0) {
    imgs = ""
  }
  const data = await productService.addProduct(name, parseInt(price), categoryId, imgs, detail);
  res.send({status: 0, data: data});
})

// 获取所有商品列表
router.get('/getAllProducts', async function (req, res) {
  const data = await productService.getAllProducts();
  res.send({status: 0, data: data});
})

// 更新商品
router.post('/updateProduct', async function (req, res) {
  let {categoryId, name, price, imgs, detail, pk_product_id} = req.body
  imgs = imgs.toString()
  console.log(categoryId, name, price, imgs, detail, pk_product_id)
  const data = await productService.updateProduct(categoryId, name, price, imgs, detail, pk_product_id);
  res.send({status: 0, data: data});
})

// 删除商品
router.post('/deleteProduct', async function (req, res) {
  const {pk_category_id} = req.body
  const data = await productService.deleteProduct(pk_category_id);
  res.send({status: 0, data: data});
})

// 更新商品状态
router.post('/updateStatus', async function (req, res) {
  let {productId, status} = req.body
  console.log(productId, status)
  const data = await productService.updateStatus(productId, status);
  res.send({status: 0, data: data});
})

// 根据关键字搜索商品
router.get('/searchProducts', async function (req, res) {
  const {searchName, searchType} = req.query
  console.log(searchName, searchType)
  let data
  if (searchType === 'productName') {
    data = await productService.searchProductsByProductName(searchName);
  } else if (searchType === 'categoryId') {
    data = await productService.searchProductsByCategoryId(searchName);
  }
  res.send({status: 0, data: data});
})

module.exports = router;