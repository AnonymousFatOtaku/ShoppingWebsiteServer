// 权限Service层，对Dao层发起异步DML操作
const rightDao = require("../dao/rightDao");

// 添加权限
const addRight = async (parent_right_id, name, description) => {
  let data = await rightDao.addRight(parent_right_id, name, description)
  return data
}

// 获取所有权限列表
const getAllRights = async () => {
  let data = await rightDao.getAllRights()
  return data
}

// 更新权限
const updateRight = async (name, description, pk_right_id) => {
  let data = await rightDao.updateRight(name, description, pk_right_id)
  return data
}

// 删除权限
const deleteRight = async (pk_right_id) => {
  let data = await rightDao.deleteRight(pk_right_id)
  return data
}

// 根据角色id获取相应权限
const getRightsByRoleId = async (roleId) => {
  let data = await rightDao.getRightsByRoleId(roleId)
  return data
}

// 删除角色拥有的权限
const deleteRoleRights = async (pk_role_id, item) => {
  let data = await rightDao.deleteRoleRights(pk_role_id, item)
  return data
}

// 添加角色拥有的权限
const addRoleRights = async (pk_role_id, item) => {
  let data = await rightDao.addRoleRights(pk_role_id, item)
  return data
}

module.exports = {
  addRight,
  getAllRights,
  updateRight,
  deleteRight,
  getRightsByRoleId,
  deleteRoleRights,
  addRoleRights,
}