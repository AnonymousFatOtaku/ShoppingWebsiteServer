// 角色DAO，只负责数据库操作
let db = require('../dao/db');

// 添加角色
const addRole = async (parent_role_id, name, description) => {
  let sql = 'INSERT INTO t_role(parent_role_id,name,description) VALUES (?,?,?)'
  let sqlParams = [parent_role_id, name, description]
  return new Promise((resolve, reject) => {
    db.connection.query(sql, sqlParams, (error, result) => {
      if (error) {
        console.error('添加角色异常')
        reject(error)
      } else {
        console.error('添加角色正常')
        resolve(result)
      }
    })
  })
}

// 获取所有角色列表
const getAllRoles = async () => {
  let sql = 'SELECT pk_role_id,parent_role_id,name,description,gmt_create,gmt_modified FROM t_role WHERE is_delete = 0'
  return new Promise((resolve, reject) => {
    db.connection.query(sql, (error, result) => {
      if (error) {
        console.log('获取角色列表异常')
        reject(error)
      } else {
        console.log('获取角色列表正常')
        resolve(result)
      }
    })
  })
}

// 更新角色
const updateRole = async (name, description, pk_role_id) => {
  let sql = 'UPDATE t_role SET name = ?,description = ? WHERE is_delete = 0 AND pk_role_id = ?'
  let sqlParams = [name, description, pk_role_id]
  return new Promise((resolve, reject) => {
    db.connection.query(sql, sqlParams, (error, result) => {
      if (error) {
        console.error('更新角色异常')
        reject(error)
      } else {
        console.error('更新角色正常')
        resolve(result)
      }
    })
  })
}

// 删除角色
const deleteRole = async (pk_role_id) => {
  let sql = 'UPDATE t_role SET is_delete = 1 WHERE pk_role_id = ?'
  return new Promise((resolve, reject) => {
    db.connection.query(sql, pk_role_id, (error, result) => {
      if (error) {
        console.error('删除角色异常')
        reject(error)
      } else {
        console.error('删除角色正常')
        resolve(result)
      }
    })
  })
}

// 根据用户id获取用户角色
const getRoleByUserId = async (pk_user_id) => {
  let sql = 'SELECT fk_role_id FROM t_user_role_relation WHERE is_delete = 0 AND fk_user_id = ?'
  return new Promise((resolve, reject) => {
    db.connection.query(sql, pk_user_id, (error, result) => {
      if (error) {
        console.log('根据用户id获取用户角色异常')
        reject(error)
      } else {
        console.log('根据用户id获取用户角色正常')
        resolve(result)
      }
    })
  })
}

// 更新用户的角色
const updateRoleByUserId = async (pk_user_id, role_id) => {
  let sql = 'UPDATE t_user_role_relation SET fk_role_id = ?,gmt_modified = NOW() WHERE is_delete = 0 AND fk_user_id = ?'
  let sqlParams = [role_id, pk_user_id]
  return new Promise((resolve, reject) => {
    db.connection.query(sql, sqlParams, (error, result) => {
      if (error) {
        console.error('更新角色异常')
        reject(error)
      } else {
        console.error('更新角色正常')
        resolve(result)
      }
    })
  })
}

module.exports = {
  addRole,
  getAllRoles,
  updateRole,
  deleteRole,
  getRoleByUserId,
  updateRoleByUserId,
}