// 权限DAO，只负责数据库操作
let db = require('../dao/db');

// 添加权限
const addRight = async (parent_right_id, name, description) => {
  let sql = 'INSERT INTO t_right(parent_right_id,name,description) VALUES (?,?,?),'
  let sqlParams = [parent_right_id, name, description]
  return new Promise((resolve, reject) => {
    db.connection.query(sql, sqlParams, (error, result) => {
      if (error) {
        console.error('添加权限异常')
        reject(error)
      } else {
        console.error('添加权限正常')
        resolve(result)
      }
    })
  })
}

// 获取所有权限列表
const getAllRights = async () => {
  let sql = 'SELECT pk_right_id,parent_right_id,name,description FROM t_right WHERE is_delete = 0'
  return new Promise((resolve, reject) => {
    db.connection.query(sql, (error, result) => {
      if (error) {
        console.log('获取权限列表异常')
        reject(error)
      } else {
        console.log('获取权限列表正常')
        resolve(result)
      }
    })
  })
}

// 更新权限
const updateRight = async (name, description, pk_right_id) => {
  let sql = 'UPDATE t_role SET name = ?,description = ? WHERE is_delete = 0 AND pk_right_id = ?'
  let sqlParams = [name, description, pk_right_id]
  return new Promise((resolve, reject) => {
    db.connection.query(sql, sqlParams, (error, result) => {
      if (error) {
        console.error('更新权限异常')
        reject(error)
      } else {
        console.error('更新权限正常')
        resolve(result)
      }
    })
  })
}

// 删除权限
const deleteRight = async (pk_right_id) => {
  let sql = 'UPDATE t_role SET is_delete = 1 WHERE pk_right_id = ?'
  return new Promise((resolve, reject) => {
    db.connection.query(sql, pk_right_id, (error, result) => {
      if (error) {
        console.error('删除权限异常')
        reject(error)
      } else {
        console.error('删除权限正常')
        resolve(result)
      }
    })
  })
}

// 根据角色id获取相应权限
const getRightsByRoleId = async (roleId) => {
  let sql = 'SELECT fk_right_id,right_type FROM t_role_right_relation WHERE is_delete = 0 AND fk_role_id = ?'
  return new Promise((resolve, reject) => {
    db.connection.query(sql, roleId, (error, result) => {
      if (error) {
        console.log('根据角色id获取相应权限异常')
        reject(error)
      } else {
        console.log('根据角色id获取相应权限正常')
        resolve(result)
      }
    })
  })
}

// 删除角色拥有的权限
const deleteRoleRights = async (pk_role_id, item) => {
  let sql = 'UPDATE t_role_right_relation SET is_delete = 1,gmt_modified = NOW() WHERE fk_role_id = ? AND fk_right_id = ?'
  let sqlParams = [pk_role_id, item]
  return new Promise((resolve, reject) => {
    db.connection.query(sql, sqlParams, (error, result) => {
      if (error) {
        console.error('删除角色拥有的权限异常')
        reject(error)
      } else {
        console.error('删除角色拥有的权限正常')
        resolve(result)
      }
    })
  })
}

// 添加角色拥有的权限
const addRoleRights = async (pk_role_id, item) => {
  let sql = 'INSERT INTO t_role_right_relation(fk_role_id,fk_right_id) VALUES (?,?)'
  let sqlParams = [pk_role_id, item]
  return new Promise((resolve, reject) => {
    db.connection.query(sql, sqlParams, (error, result) => {
      if (error) {
        console.error('添加角色拥有的权限异常')
        reject(error)
      } else {
        console.error('添加角色拥有的权限正常')
        resolve(result)
      }
    })
  })
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