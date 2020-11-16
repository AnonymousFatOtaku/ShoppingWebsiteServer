// token工具模块

// 引入模块依赖
const jwt = require('jsonwebtoken');
let {PRIVITE_KEY, EXPIRESD} = require("./store")

// 创建token类
class JwtUtils {

  constructor(data) {
    this.data = data;
  }

  // 生成token
  generateToken() {
    let {pk_user_id, username} = this.data;
    let token = jwt.sign({pk_user_id, username}, PRIVITE_KEY, {expiresIn: EXPIRESD});
    return token;
  }

  // 校验token
  verifyToken() {
    let token = this.data;
    let res;
    try {
      let result = jwt.verify(token, PRIVITE_KEY) || {}
      let {exp = 0} = result, current = Math.floor(Date.now() / 1000);
      if (current <= exp) {
        res = result.data || {};
      }
    } catch (e) {
      res = 'err';
    }
    return res;
  }
}

module.exports = JwtUtils;