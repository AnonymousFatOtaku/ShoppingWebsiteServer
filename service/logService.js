// 日志Service层，对Dao层发起异步DML操作
const logDAO = require("../dao/logDAO");

// 添加日志
const addLog = async (operateType, username) => {
  let data = await logDAO.addLog(operateType, username)
  return data
}

// 获取所有日志列表
const getAllLogs = async () => {
  let data = await logDAO.getAllLogs()
  return data
}

module.exports = {addLog, getAllLogs}