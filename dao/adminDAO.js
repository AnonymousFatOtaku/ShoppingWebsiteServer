// 用户DAO，只负责数据库操作
let db = require('../dao/db');

// 添加用户
const addAdmin = async (username, password) => {
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
const getAllAdmins = async () => {
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
const updateAdmin = async (username, password) => {
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
const deleteAdmin = async (username) => {
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
const adminLogin = async (username, password) => {
  let sql = 'SELECT pk_user_id,username,phone,email,login_time FROM t_user WHERE is_delete = 0 AND type = 1 AND username = ? AND password = MD5(?)'
  let sqlParams = [username, password]
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

// 获取用户上次登录时间和次数
const getAdminLastLoginInfo = async (username) => {
  let sql = 'SELECT login_time,login_count FROM t_user WHERE is_delete = 0 AND type = 1 AND username = ?'
  return new Promise((resolve, reject) => {
    db.connection.query(sql, username, (error, result) => {
      if (error) {
        console.error('获取用户上次登录时间和次数异常')
        reject(error)
      } else {
        console.error('获取用户上次登录时间和次数正常')
        resolve(result)
      }
    })
  })
}

// 更新用户登录时间、上次登录时间、登录次数
const updateAdminLoginInfo = async (login_time, login_count, username) => {
  let sql = 'UPDATE t_user SET login_time = NOW(),last_login_time = ?,login_count = ? WHERE is_delete = 0 AND type = 1 AND username = ?'
  let last_login_time = login_time
  login_count += 1
  let sqlParams = [last_login_time, login_count, username]
  return new Promise((resolve, reject) => {
    db.connection.query(sql, sqlParams, (error, result) => {
      if (error) {
        console.error('更新用户登录时间、上次登录时间、登录次数异常')
        reject(error)
      } else {
        console.error('更新用户登录时间、上次登录时间、登录次数正常')
        resolve(result)
      }
    })
  })
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