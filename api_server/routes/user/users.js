
/**
 * 在这里定义和用户相关的路由处理函数，供 /router/user.js 模块进行调用
 */
// 导入数据库模块
const db = require("../../db/index");
//  导入加密
const bcrypt = require("bcryptjs");
// 用这个包来生成 Token 字符串
const jwt = require("jsonwebtoken");
// 导入配置文件
const config = require("../../config");
// 注册
exports.regUser = (req, res) => {
  // 注册用户的处理函数
  // const bcrypt=require("bcryptjs")
  // 检测用户账号密码是否为空
  const userinfo = req.body;
  if (!userinfo.username || !userinfo.password) {
    return res.send({ status: 1, message: "用户或者密码不能为空" });
  }
  // 检测用户名是否被占用
  const sqlStr = `select * from user where username=?`;
  db.query(sqlStr, [userinfo.username], function (err, results) {
    // 执行 SQL 语句失败
    // if (err) {
    // return res.send({ status: 1, message: err.message })
    // }
    // 用户名被占用
    if (results.length > 0) {
      return res.send({
        status: 1,
        message: "用户名被占用，请更换其他用户名！",
      });
    }
    // TODO: 用户名可用，继续后续流程...
    userinfo.password = bcrypt.hashSync(userinfo.password, 10);
    // 插入新用户
    const sqlUser = "insert into user set ?";
    db.query(
      sqlUser,
      { username: userinfo.username, password: userinfo.password , nickname:userinfo.nickname},
      function (err, results) {
        // 执行 SQL 语句失败
        if (err) return res.send({ status: 1, message: err.message });
        // SQL 语句执行成功，但影响行数不为 1
        if (results.affectedRows !== 1) {
          return res.send({ status: 1, message: "注册用户失败，请稍后再试！" });
        }
      }
    );
        const sql = `select * from user where username=?`;
        db.query(sql, userinfo.username,function(err,results) {
          if(err) return res.send ({
            message:err
          })
          if(results.length !== 1) return res.send({
            status:1,
            message:'用户注册失败！'
          })
          const userWithPassword = results[0]; // Assuming results is an array
          const { password, ...userWithoutPassword } = userWithPassword;
          const user = { ...userWithoutPassword, user_pic: "" };
          // 生成 Token 字符串
          const tokenStr = jwt.sign(user, config.jwtSecretKey, {
            expiresIn: "168h", // token 有效期为 7天
          });
          res.send({
            status: 0,
            message: "成功加入！",
            // 为了方便客户端使用 Token，在服务器端直接拼接上 Bearer 的前缀
            token: "Bearer " + tokenStr,
            data:user
          });
        })
  });
};
// 登录的处理函数
exports.login = (req, res) => {
  const userinfo = req.body;
  const sql = `select * from user where username=?`;
  db.query(sql, userinfo.username, function (err, results) {
    // 执行 SQL 语句失败
    if (err) return res.send ({
      message:err
    })
    // 执行 SQL 语句成功，但是查询到数据条数不等于 1
    if (results.length !== 1) return res.send({
      status: 1,
      message:'用户不存在'
    });
    // TODO：判断用户输入的登录密码是否和数据库中的密码一致
    // 拿着用户输入的密码,和数据库中存储的密码进行对比
    const compareResult = bcrypt.compareSync(
      userinfo.password,
      results[0].password
    );

    // 如果对比的结果等于 false, 则证明用户输入的密码错误
    if (!compareResult) {
      return res.send({
        status:1,
        message:'用户名或者密码错误'
      })
    }

    // TODO：登录成功，生成 Token 字符串
    // 剔除完毕之后，user 中只保留了用户的 id, username, nickname, email 这四个属性的值
    const userWithPassword = results[0]; // Assuming results is an array
    const { password, ...userWithoutPassword } = userWithPassword;
    const user = { ...userWithoutPassword };

    // 生成 Token 字符串
    const tokenStr = jwt.sign(user, config.jwtSecretKey, {
      expiresIn: "168h", // token 有效期为 7天
    });
    res.send({
      status: 0,
      message: "登录成功！",
      // 为了方便客户端使用 Token，在服务器端直接拼接上 Bearer 的前缀
      token: "Bearer " + tokenStr,
      data:user
    });
  });
};
