// 控制层/路由处理层代码，解析request请求的参数，做一些合法性的校验，如果参数不合法，直接向表示层响应异常状态码。如果参数合法，异步调用Service业务层
var express = require('express');
var router = express.Router();
const validator = require('validator');
const logService = require("../service/logService");

// 添加日志
router.post('/addLog', async function (req, res) {
  const {operateType, operate_content, pk_user_id} = req.body
  if (!validator.isInt(operateType.toString())) { // 通过matches进行正则验证
    res.send({status: 1, msg: '操作类型格式不正确，请检查后重新输入'})
  } else if (!validator.isLength(operate_content, {min: 0, max: 100})) { // 通过matches进行正则验证
    res.send({status: 1, msg: '操作描述长度不正确，请检查后重新输入'})
  } else if (!validator.isInt(pk_user_id.toString())) { // 通过matches进行正则验证
    res.send({status: 1, msg: '用户id长度不正确，请检查后重新输入'})
  } else { // 所有数据验证通过才进行数据库操作
    const data = await logService.addLog(operateType, operate_content, pk_user_id);
    res.send(data);
  }
})

// 获取所有日志列表
router.get('/getAllLogs', async function (req, res) {
  const data = await logService.getAllLogs();
  res.send({status: 0, data: data});
});

// 根据条件搜索日志
router.get('/searchLogs', async function (req, res) {
  const {searchName, searchType, startTime, endTime} = req.query
  console.log(searchName, searchType, startTime, endTime)
  let data = await logService.searchLogs(searchName, searchType, startTime, endTime);
  res.send({status: 0, data: data});
})

module.exports = router;