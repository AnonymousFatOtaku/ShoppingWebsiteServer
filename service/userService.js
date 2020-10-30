// 用户Service层，对Dao层发起异步DML操作
const userDAO = require("../dao/userDAO");

// 添加用户
const addUser = async (username, password) => {
  let data = await userDAO.addUser(username, password)
  return data
}

// 获取所有用户列表
const getAllUsers = async () => {
  let data = await userDAO.getAllUsers()
  return data
}

// 更新用户
const updateUser = async (username, password) => {
  let data = await userDAO.updateUser(username, password)
  return data
}

// 删除用户
const deleteUser = async (username) => {
  let data = await userDAO.deleteUser(username)
  return data
}

// 登录
const userLogin = async (username, password) => {
  let data = await userDAO.userLogin(username, password)
  return data
}

// 获取用户上次登录时间和次数
const getUserLastLoginInfo = async (username) => {
  let data = await userDAO.getUserLastLoginInfo(username)
  return data
}

// 更新用户登录时间、上次登录时间、登录次数
const updateUserLoginInfo = async (login_time, login_count, username) => {
  let data = await userDAO.updateUserLoginInfo(login_time, login_count, username)
  return data
}

module.exports = {getAllUsers, addUser, updateUser, deleteUser, userLogin, getUserLastLoginInfo, updateUserLoginInfo}