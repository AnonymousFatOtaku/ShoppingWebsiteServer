// 用户DAO，只负责数据库操作
let db = require('../dao/db');

// 添加用户
const addUser = async (username, password, phone, email) => {
  let sql = 'INSERT INTO t_user(username,password,phone,email,type) VALUES (?,MD5(?),?,?,0)'
  let sqlParams = [username, password, phone, email]
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

// 根据用户名、电话、邮箱查询用户信息是否已存在
const getUserByUsernameAndPhoneAndEmail = async (username, phone, email) => {
  let sql = 'SELECT pk_user_id,username,phone,email FROM t_user WHERE is_delete = 0 AND type = 0 AND ((username = ?  OR username = ?) OR phone = ? OR email = ?)'
  let sqlParams = [username, phone, phone, email]
  return new Promise((resolve, reject) => {
    db.connection.query(sql, sqlParams, (error, result) => {
      if (error) {
        console.error('根据用户名、电话、邮箱查询用户信息是否已存在异常')
        reject(error)
      } else {
        console.error('根据用户名、电话、邮箱查询用户信息是否已存在正常')
        resolve(result)
      }
    })
  })
}

// 获取所有用户列表
const getAllUsers = async () => {
  let sql = 'SELECT pk_user_id,username,phone,email,login_time,last_login_time,login_count,type,gmt_create,gmt_modified FROM t_user WHERE is_delete = 0'
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
const updateUser = async (pk_user_id, username, password, phone, email, type) => {
  let sql = 'UPDATE t_user SET username = ?, password = MD5(?), phone = ?, email = ?, type = ?, gmt_modified = NOW() WHERE pk_user_id = ?'
  let sqlParams = [username, password, phone, email, type, pk_user_id]
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
const deleteUser = async (pk_user_id) => {
  let sql = 'UPDATE t_user SET is_delete = 1 WHERE pk_user_id = ?'
  return new Promise((resolve, reject) => {
    db.connection.query(sql, pk_user_id, (error, result) => {
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
const userLogin = async (username, password) => {
  let sql = 'SELECT pk_user_id,username,phone,email FROM t_user WHERE is_delete = 0 AND type = 0 AND password = MD5(?) AND (username = ? OR phone = ? OR email = ?)'
  let sqlParams = [password, username, username, username]
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
const getUserLastLoginInfo = async (username) => {
  let sql = 'SELECT login_time,login_count FROM t_user WHERE is_delete = 0 AND type = 0 AND (username = ? OR phone = ? OR email = ?)'
  let sqlParams = [username, username, username]
  return new Promise((resolve, reject) => {
    db.connection.query(sql, sqlParams, (error, result) => {
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
const updateUserLoginInfo = async (login_time, login_count, username) => {
  let sql = 'UPDATE t_user SET login_time = NOW(),last_login_time = ?,login_count = ? WHERE is_delete = 0 AND type = 0 AND (username = ? OR phone = ? OR email = ?)'
  let last_login_time = login_time
  login_count += 1
  let sqlParams = [last_login_time, login_count, username, username, username]
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

// 新增用户角色
const addUserRole = async (fk_user_id, fk_role_id) => {
  let sql = 'INSERT INTO t_user_role_relation(fk_user_id,fk_role_id) VALUES (?,?)'
  let sqlParams = [fk_user_id, fk_role_id]
  return new Promise((resolve, reject) => {
    db.connection.query(sql, sqlParams, (error, result) => {
      if (error) {
        console.error('新增用户角色异常')
        reject(error)
      } else {
        console.error('新增用户角色正常')
        resolve(result)
      }
    })
  })
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
}