const express = require('express')
// 得到路由器对象
const router = express.Router()
require('./image')(router)
module.exports = router