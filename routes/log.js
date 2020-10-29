// 控制层/路由处理层代码，解析request请求的参数，做一些合法性的校验，如果参数不合法，直接向表示层响应异常状态码。如果参数合法，异步调用Service业务层
var express = require('express');
var router = express.Router();
const logService = require("../service/logService");

// 添加日志
router.post('/addLog', async function (req, res) {
  const {operateType, username} = req.body
  const data = await logService.addLog();
  res.send(data);
})

// 获取所有日志列表
router.get('/getAllLogs', async function (req, res) {
  const data = await logService.getAllLogs();
  res.send(data);
});

module.exports = router;