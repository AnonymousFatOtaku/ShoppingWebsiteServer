// 用户Service层，对Dao层发起异步DML操作
const adminDao = require("../dao/adminDao");

// 添加用户
const addAdmin = async (username, password) => {
  let data = await adminDao.addAdmin(username, password)
  return data
}

// 获取所有用户列表
const getAllAdmins = async () => {
  let data = await adminDao.getAllAdmins()
  return data
}

// 更新用户
const updateAdmin = async (username, password) => {
  let data = await adminDao.updateAdmin(username, password)
  return data
}

// 删除用户
const deleteAdmin = async (username) => {
  let data = await adminDao.deleteAdmin(username)
  return data
}

// 登录
const adminLogin = async (username, password) => {
  let data = await adminDao.adminLogin(username, password)
  return data
}

// 获取用户上次登录时间和次数
const getAdminLastLoginInfo = async (username) => {
  let data = await adminDao.getAdminLastLoginInfo(username)
  return data
}

// 更新用户登录时间、上次登录时间、登录次数
const updateAdminLoginInfo = async (login_time, login_count, username) => {
  let data = await adminDao.updateAdminLoginInfo(login_time, login_count, username)
  return data
}

module.exports = {
  getAllAdmins,
  addAdmin,
  updateAdmin,
  deleteAdmin,
  adminLogin,
  getAdminLastLoginInfo,
  updateAdminLoginInfo
}