// 用户DAO，只负责数据库操作
let db = require('../dao/db');

// 添加用户
const addUser = async (username, password) => {
  let sql = 'INSERT INTO t_user(username,password,phone,email,login_time,last_login_time,gmt_create,gmt_modified) VALUES (?,MD5(?),"13000000000","aaa@aa.aa",NOW(),NOW(),NOW(),NOW())'
  let sqlParams = [username, password]
  return new Promise((resolve, reject) => {
    db.connection.query(sql, sqlParams, (error, result) => {
      if (error) {
        console.error('添加用户异常')
        reject(error)
      } else {
        console.error('添加用户正常')
        resolve(result)
      }
    })
  })
}

// 获取所有用户列表
const getAllUsers = async () => {
  let sql = 'SELECT username,phone,email,login_time FROM t_user WHERE is_delete = 0'
  return new Promise((resolve, reject) => {
    db.connection.query(sql, (error, result) => {
      if (error) {
        console.log('获取用户列表异常')
        reject(error)
      } else {
        console.log('获取用户列表正常')
        resolve(result)
      }
    })
  })
}

// 更新用户
const updateUser = async (username, password) => {
  let sql = 'UPDATE t_user SET password = MD5(?) WHERE username = ?'
  let sqlParams = [password, username]
  return new Promise((resolve, reject) => {
    db.connection.query(sql, sqlParams, (error, result) => {
      if (error) {
        console.error('更新用户异常')
        reject(error)
      } else {
        console.error('更新用户正常')
        resolve(result)
      }
    })
  })
}

// 删除用户
const deleteUser = async (username) => {
  let sql = 'UPDATE t_user SET is_delete = 1 WHERE username = ?;'
  return new Promise((resolve, reject) => {
    db.connection.query(sql, username, (error, result) => {
      if (error) {
        console.error('删除用户异常')
        reject(error)
      } else {
        console.error('删除用户正常')
        resolve(result)
      }
    })
  })
}

// 登录
const login = async (username, password) => {
  let sql = 'SELECT username,phone,email,login_time FROM t_user WHERE is_delete = 0 AND username = ? AND password = MD5(?)'
  let sqlParams = [password, username]
  return new Promise((resolve, reject) => {
    db.connection.query(sql, sqlParams, (error, result) => {
      if (error) {
        console.error('登录异常')
        reject(error)
      } else {
        console.error('登录正常')
        resolve(result)
      }
    })
  })
}

module.exports = {getAllUsers, addUser, updateUser, deleteUser, login}