// 用户Service层，对Dao层发起异步DML操作
const userDao = require("../dao/userDao");

// 添加用户
const addUser = async (username, password, phone, email) => {
  let data = await userDao.addUser(username, password, phone, email)
  return data
}

// 根据用户名、电话、邮箱查询用户信息是否已存在
const getUserByUsernameAndPhoneAndEmail = async (username, phone, email) => {
  let data = await userDao.getUserByUsernameAndPhoneAndEmail(username, phone, email)
  return data
}

// 获取所有用户列表
const getAllUsers = async () => {
  let data = await userDao.getAllUsers()
  return data
}

// 更新用户
const updateUser = async (pk_user_id, username, password, phone, email) => {
  let data = await userDao.updateUser(pk_user_id, username, password, phone, email)
  return data
}

// 删除用户
const deleteUser = async (pk_user_id) => {
  let data = await userDao.deleteUser(pk_user_id)
  return data
}

// 登录
const userLogin = async (username, password) => {
  let data = await userDao.userLogin(username, password)
  return data
}

// 获取用户上次登录时间和次数
const getUserLastLoginInfo = async (username) => {
  let data = await userDao.getUserLastLoginInfo(username)
  return data
}

// 更新用户登录时间、上次登录时间、登录次数
const updateUserLoginInfo = async (login_time, login_count, username) => {
  let data = await userDao.updateUserLoginInfo(login_time, login_count, username)
  return data
}

// 新增用户角色
const addUserRole = async (fk_user_id, fk_role_id) => {
  let data = await userDao.addUserRole(fk_user_id, fk_role_id)
  return data
}

// 更新用户类型
const updateUserType = async (pk_user_id, type) => {
  let data = await userDao.updateUserType(pk_user_id, type)
  return data
}

// 更新用户角色
const updateUserRole = async (pk_user_id, role_id) => {
  let data = await userDao.updateUserRole(pk_user_id, role_id)
  return data
}

module.exports = {
  getAllUsers,
  addUser,
  updateUser,
  deleteUser,
  userLogin,
  getUserLastLoginInfo,
  updateUserLoginInfo,
  getUserByUsernameAndPhoneAndEmail,
  addUserRole,
  updateUserType,
  updateUserRole,
}