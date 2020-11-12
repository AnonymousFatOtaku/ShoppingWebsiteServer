// 日志DAO，只负责数据库操作
let db = require('../dao/db');

// 添加日志
const addLog = async (operateType, username) => {
  let sql = 'INSERT INTO t_log(operate_type,operate_content,fk_username) VALUES (?,?,?)'
  let operate_content
  if (operateType === 0) {// 增

  } else if (operateType === 1) {// 删

  } else if (operateType === 2) {// 改

  } else if (operateType === 3) {// 查

  } else if (operateType === 4) {// 登录
    operate_content = "成功登录"
  } else if (operateType === 5) {// 注册
    operate_content = "成功注册"
  }
  let sqlParams = [operateType, operate_content, username]
  return new Promise((resolve, reject) => {
    db.connection.query(sql, sqlParams, (error, result) => {
      if (error) {
        console.error('添加日志异常')
        reject(error)
      } else {
        console.error('添加日志正常')
        resolve(result)
      }
    })
  })
}

// 获取所有日志列表
const getAllLogs = async () => {
  let sql = 'SELECT operate_type,operate_content,fk_user_id FROM t_log WHERE is_delete = 0'
  return new Promise((resolve, reject) => {
    db.connection.query(sql, (error, result) => {
      if (error) {
        console.log('获取日志列表异常')
        reject(error)
      } else {
        console.log('获取日志列表正常')
        resolve(result)
      }
    })
  })
}

module.exports = {addLog, getAllLogs}