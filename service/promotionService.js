// 活动Service层，对Dao层发起异步DML操作
const promotionDao = require("../dao/promotionDao");

// 添加活动
const addPromotion = async (name, description, discount, start_time, end_time) => {
  let data = await promotionDao.addPromotion(name, description, discount, start_time, end_time)
  return data
}

// 获取所有活动列表
const getAllPromotions = async () => {
  let data = await promotionDao.getAllPromotions()
  return data
}

// 更新活动
const updatePromotion = async (name, description, discount, start_time, end_time, pk_promotion_id) => {
  let data = await promotionDao.updatePromotion(name, description, discount, start_time, end_time, pk_promotion_id)
  return data
}

// 删除活动
const deletePromotion = async (pk_promotion_id) => {
  let data = await promotionDao.deletePromotion(pk_promotion_id)
  return data
}

module.exports = {
  addPromotion,
  getAllPromotions,
  updatePromotion,
  deletePromotion,
}