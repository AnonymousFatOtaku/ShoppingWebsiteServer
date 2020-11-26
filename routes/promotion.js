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
  res.send({status: 0, data: data});
})

module.exports = router;