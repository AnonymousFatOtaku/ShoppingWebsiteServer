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
const login = async (username, password) => {
  let data = await userDAO.login(username, password)
  return data
}

module.exports = {getAllUsers, addUser, updateUser, deleteUser, login}