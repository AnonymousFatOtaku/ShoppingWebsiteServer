// 数据库连接
const mysql = require('mysql');

// 创建mysql连接配置
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'root',
  database: 'backend',
  multipleStatements: true
});

// 使用connect()方法连接mysql，这个方法接收一个error参数，有error就报错
connection.connect((error) => {
  if (error) throw error;
  console.log('连接mysql成功');
});

module.exports = {connection}