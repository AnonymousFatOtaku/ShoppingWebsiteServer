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

// 获取活动商品列表
const getPromotionProducts = async (fk_promotion_id) => {
  let data = await promotionDao.getPromotionProducts(fk_promotion_id)
  return data
}

// 添加活动商品
const addPromotionProduct = async (fk_product_id, fk_promotion_id) => {
  let data = await promotionDao.addPromotionProduct(fk_product_id, fk_promotion_id)
  return data
}

// 删除活动商品
const deletePromotionProducts = async (fk_promotion_id) => {
  let data = await promotionDao.deletePromotionProducts(fk_promotion_id)
  return data
}

module.exports = {
  addPromotion,
  getAllPromotions,
  updatePromotion,
  deletePromotion,
  getPromotionProducts,
  addPromotionProduct,
  deletePromotionProducts,
}