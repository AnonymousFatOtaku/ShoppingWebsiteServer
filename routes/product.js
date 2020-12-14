// 控制层/路由处理层代码，解析request请求的参数，做一些合法性的校验，如果参数不合法，直接向表示层响应异常状态码。如果参数合法，异步调用Service业务层
let express = require('express');
let router = express.Router();
const validator = require('validator');
const productService = require("../service/productService");

// 添加商品
router.post('/addProduct', async function (req, res) {
  let {name, price, categoryId, imgs, detail} = req.body
  imgs = imgs.toString()
  console.log(name, price, categoryId, imgs, detail)
  if (imgs.length === 0) {
    imgs = ""
  }
  if (!validator.isInt(categoryId.toString())) { // 通过matches进行正则验证
    res.send({status: 1, msg: '分类id不正确，请检查后重新输入'})
  } else { // 所有数据验证通过才进行数据库操作
    const data = await productService.addProduct(name, parseInt(price), categoryId, imgs, detail);
    res.send({status: 0, data: data});
  }
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
  if (!validator.isInt(categoryId.toString())) { // 通过matches进行正则验证
    res.send({status: 1, msg: '分类id不正确，请检查后重新输入'})
  } else if (!validator.isInt(pk_product_id.toString())) { // 通过matches进行正则验证
    res.send({status: 1, msg: '商品id不正确，请检查后重新输入'})
  } else { // 所有数据验证通过才进行数据库操作
    const data = await productService.updateProduct(categoryId, name, price, imgs, detail, pk_product_id);
    res.send({status: 0, data: data});
  }
})

// 删除商品(未使用)
router.post('/deleteProduct', async function (req, res) {
  const {pk_product_id} = req.body
  const data = await productService.deleteProduct(pk_product_id);
  res.send({status: 0, data: data});
})

// 更新商品状态
router.post('/updateStatus', async function (req, res) {
  let {productId, status} = req.body
  console.log(productId, status)
  if (!validator.isInt(productId.toString())) { // 通过matches进行正则验证
    res.send({status: 1, msg: '商品id不正确，请检查后重新输入'})
  } else if (!validator.isInt(status.toString())) { // 通过matches进行正则验证
    res.send({status: 1, msg: '商品状态不正确，请检查后重新输入'})
  } else { // 所有数据验证通过才进行数据库操作
    const data = await productService.updateStatus(productId, status);
    res.send({status: 0, data: data});
  }
})

// 根据关键字搜索商品
router.get('/searchProducts', async function (req, res) {
  const {searchName, searchType} = req.query
  console.log(searchName, searchType)
  let data = await productService.searchProducts(searchName, searchType);
  res.send({status: 0, data: data});
})

module.exports = router;