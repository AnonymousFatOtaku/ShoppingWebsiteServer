// 控制层/路由处理层代码，解析request请求的参数，做一些合法性的校验，如果参数不合法，直接向表示层响应异常状态码。如果参数合法，异步调用Service业务层
let express = require('express');
let router = express.Router();
const validator = require('validator');
const promotionService = require("../service/promotionService");

// 添加活动
router.post('/addPromotion', async function (req, res) {
  const {name, description, discount, start_time, end_time} = req.body
  console.log(name, description, discount, start_time, end_time)
  const data = await promotionService.addPromotion(name, description, discount, start_time, end_time);
  res.send({status: 0, data: data});
})

// 获取所有活动列表
router.get('/getAllPromotions', async function (req, res) {
  const data = await promotionService.getAllPromotions();
  res.send({status: 0, data: data});
})

// 更新活动
router.post('/updatePromotion', async function (req, res) {
  const {name, description, discount, start_time, end_time, pk_promotion_id} = req.body
  console.log(name, description, discount, start_time, end_time, pk_promotion_id)
  const data = await promotionService.updatePromotion(name, description, discount, start_time, end_time, pk_promotion_id);
  res.send({status: 0, data: data});
})

// 删除活动
router.post('/deletePromotion', async function (req, res) {
  const {pk_promotion_id} = req.body
  const data = await promotionService.deletePromotion(pk_promotion_id);
  const deleteResult = await promotionService.deletePromotionProducts(pk_promotion_id);
  res.send({status: 0, data: data});
})

// 获取活动商品列表
router.get('/getPromotionProducts', async function (req, res) {
  const {fk_promotion_id} = req.query
  const data = await promotionService.getPromotionProducts(fk_promotion_id);
  res.send({status: 0, data: data});
})

/*
* 设置活动商品
* 1.获取新设置的参加当前活动的商品的列表
* 2.获取已有的当前活动商品列表
* 3.删除旧列表数据，添加新列表数据
* */
router.post('/setPromotionProducts', async function (req, res) {
  let {products, pk_promotion_id} = req.body
  // console.log(products.products, pk_promotion_id)

  // 创建数组保存新的活动商品列表
  let newProducts = []
  products.products.toString().split(",").forEach(function (item) {
    newProducts.push(parseInt(item));
  })
  // console.log(newProducts)

  // 删除旧列表数据
  const deleteResult = await promotionService.deletePromotionProducts(pk_promotion_id);

  // 添加新列表数据
  newProducts.forEach(async function (product) {
    // console.log(product)
    await promotionService.addPromotionProduct(product, pk_promotion_id)
  })
  res.send({status: 0});
})

// 获取所有参加活动的商品列表
router.get('/getAllPromotionProducts', async function (req, res) {
  const data = await promotionService.getAllPromotionProducts();
  res.send({status: 0, data: data});
})

module.exports = router;