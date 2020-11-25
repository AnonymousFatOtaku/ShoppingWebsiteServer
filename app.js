let createError = require('http-errors');
let express = require('express');
let path = require('path');
// 声明使用解析cookie数据的中间件
let cookieParser = require('cookie-parser');
let logger = require('morgan');
let ejs = require('ejs');

let db = require('./dao/db');
let user = require('./routes/user');
let log = require('./routes/log');
let admin = require('./routes/admin');
let role = require('./routes/role');
let right = require('./routes/right');
let category = require('./routes/category');
let product = require('./routes/product');
let upload = require('./routes/upload');
// 引入jwt token工具
let JwtUtil = require('./public/utils/jwtUtils');

let app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
// app.set('view engine', 'ejs');
app.engine('.html', ejs.__express);
app.set('view engine', 'html');

app.use(logger('dev'));
app.use(express.json()); // 请求体参数是json结构:{name:tom,pwd:123}
// 声明使用解析post请求的中间件
app.use(express.urlencoded({extended: true})); // 请求体参数是:name=tom&pwd=123
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

// 登录拦截器，必须放在静态资源声明之后、路由导航之前
app.use(function (req, res, next) {
  // 除登录注册外的所有请求都需要进行token校验
  if (req.url != '/user/addUser' && req.url != '/user/userLogin' && req.url != '/admin/adminLogin') {
    let token = req.headers.token;
    console.log(token)
    let jwt = new JwtUtil(token);
    let result = jwt.verifyToken();
    // 如果校验通过就next，否则就返回登录信息不正确
    if (result == 'err') {
      console.log(result);
      res.send({status: 403, msg: '未登录或登录已过期，请重新登录'});
      // res.render('login.html');
    } else {
      next();
    }
  } else {
    next();
  }
});

app.use('/user', user);
app.use('/log', log);
app.use('/admin', admin);
app.use('/role', role);
app.use('/right', right);
app.use('/category', category);
app.use('/product', product);
app.use('/upload', upload);

// catch 404 and forward to error handler
app.use(function (req, res, next) {
  next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};
  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

// 在指定端口开启一个服务器
app.listen('8000', () => {
  console.log('服务器启动成功, 请访问：http://localhost:8000')
})

module.exports = app;