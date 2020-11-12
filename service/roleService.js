// 角色Service层，对Dao层发起异步DML操作
const roleDao = require("../dao/roleDao");

// 添加角色
const addRole = async (parent_role_id, name, description) => {
  let data = await roleDao.addRole(parent_role_id, name, description)
  return data
}

// 获取所有角色列表
const getAllRoles = async () => {
  let data = await roleDao.getAllRoles()
  return data
}

// 更新角色
const updateRole = async (name, description, pk_role_id) => {
  let data = await roleDao.updateRole(name, description, pk_role_id)
  return data
}

// 删除角色
const deleteRole = async (pk_role_id) => {
  let data = await roleDao.deleteRole(pk_role_id)
  return data
}

// 根据用户id获取用户角色
const getRoleByUserId = async (pk_user_id) => {
  let data = await roleDao.getRoleByUserId(pk_user_id)
  return data
}

module.exports = {
  addRole,
  getAllRoles,
  updateRole,
  deleteRole,
  getRoleByUserId,
}