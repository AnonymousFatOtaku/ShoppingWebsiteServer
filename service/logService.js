// 日志Service层，对Dao层发起异步DML操作
const logDao = require("../dao/logDao");

// 添加日志
const addLog = async (operateType, operate_content, pk_user_id) => {
  let data = await logDao.addLog(operateType, operate_content, pk_user_id)
  return data
}

// 获取所有日志列表
const getAllLogs = async () => {
  let data = await logDao.getAllLogs()
  return data
}

// 根据条件搜索日志
const searchLogs = async (searchName, searchType, startTime, endTime) => {
  let data = await logDao.searchLogs(searchName, searchType, startTime, endTime)
  return data
}

module.exports = {addLog, getAllLogs, searchLogs}