// 管理员DAO，只负责数据库操作
let db = require('../dao/db');

// 添加管理员
const addAdmin = async (username, password, phone, email) => {
  let sql = 'INSERT INTO t_user(username,password,phone,email,type) VALUES (?,MD5(?),?,?,1)'
  let sqlParams = [username, password, phone, email]
  return new Promise((resolve, reject) => {
    db.connection.query(sql, sqlParams, (error, result) => {
      if (error) {
        console.error('添加管理员异常')
        reject(error)
      } else {
        console.error('添加管理员正常')
        resolve(result)
      }
    })
  })
}

// 获取所有管理员列表
const getAllAdmins = async () => {
  let sql = 'SELECT username,phone,email,login_time FROM t_user WHERE is_delete = 0'
  return new Promise((resolve, reject) => {
    db.connection.query(sql, (error, result) => {
      if (error) {
        console.log('获取管理员列表异常')
        reject(error)
      } else {
        console.log('获取管理员列表正常')
        resolve(result)
      }
    })
  })
}

// 更新管理员
const updateAdmin = async (username, password) => {
  let sql = 'UPDATE t_user SET password = MD5(?) WHERE username = ?'
  let sqlParams = [password, username]
  return new Promise((resolve, reject) => {
    db.connection.query(sql, sqlParams, (error, result) => {
      if (error) {
        console.error('更新管理员异常')
        reject(error)
      } else {
        console.error('更新管理员正常')
        resolve(result)
      }
    })
  })
}

// 删除管理员
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

// 管理员登录
const adminLogin = async (username, password) => {
  let sql = 'SELECT pk_user_id,username,phone,email FROM t_user WHERE is_delete = 0 AND type = 1 AND password = MD5(?) AND (username = ? OR phone = ? OR email = ?)'
  let sqlParams = [password, username, username, username]
  return new Promise((resolve, reject) => {
    db.connection.query(sql, sqlParams, (error, result) => {
      if (error) {
        console.error('管理员登录异常')
        reject(error)
      } else {
        console.error('管理员登录正常')
        resolve(result)
      }
    })
  })
}

// 获取管理员上次登录时间和次数
const getAdminLastLoginInfo = async (username) => {
  let sql = 'SELECT login_time,login_count FROM t_user WHERE is_delete = 0 AND type = 1 AND (username = ? OR phone = ? OR email = ?)'
  let sqlParams = [username, username, username]
  return new Promise((resolve, reject) => {
    db.connection.query(sql, sqlParams, (error, result) => {
      if (error) {
        console.error('获取管理员上次登录时间和次数异常')
        reject(error)
      } else {
        console.error('获取管理员上次登录时间和次数正常')
        resolve(result)
      }
    })
  })
}

// 更新管理员登录时间、上次登录时间、登录次数
const updateAdminLoginInfo = async (login_time, login_count, username) => {
  let sql = 'UPDATE t_user SET login_time = NOW(),last_login_time = ?,login_count = ? WHERE is_delete = 0 AND type = 1 AND (username = ? OR phone = ? OR email = ?)'
  let last_login_time = login_time
  login_count += 1
  let sqlParams = [last_login_time, login_count, username, username, username]
  return new Promise((resolve, reject) => {
    db.connection.query(sql, sqlParams, (error, result) => {
      if (error) {
        console.error('更新管理员登录时间、上次登录时间、登录次数异常')
        reject(error)
      } else {
        console.error('更新管理员登录时间、上次登录时间、登录次数正常')
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