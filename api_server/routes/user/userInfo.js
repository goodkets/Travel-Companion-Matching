// 导入数据库模块
const db = require("../../db/index");
const comment = require('../comment/index.js')
exports.getUserInfo = (req, res) => {
  // 根据用户的 id，查询用户的基本信息
  // 注意：为了防止用户的密码泄露，需要排除 password 字段
  // const sql = `select id, username, nickname, email, user_pic from ev_users where id=?`
  const sql = `select  sex, user_pic,nickname,born,eduction,tall,textareaHobby,myTextarea from user where id=?`;
  // 注意：req 对象上的 user 属性，是 Token 解析成功，express-jwt 中间件帮我们挂载上去的
  db.query(sql, req.query.id, (err, results) => {
    // 1. 执行 SQL 语句失败
    if (err) return res.send(err);
    // 2. 执行 SQL 语句成功，但是查询到的数据条数不等于 1
    if (results.length !== 1) return res.send("获取用户信息失败！");
    // 3. 将用户信息响应给客户端
    res.send({
      status: 0,
      message: "获取用户基本信息成功！",
      data: results[0],
    });
  });
};
exports.updateUserInfo = (req, res) => {

    const sql = `
      UPDATE user 
      SET
        sex=?,
        user_pic=?,
        nickname=?,
        born=?,
        eduction=?,
        tall=?,
        textareaHobby=?,
        myTextarea=?
      WHERE id=?`;
    
    const queryParams = [
      req.body.sex,
     JSON.stringify( req.body.user_pic),
      req.body.nickname,
      req.body.born,
      req.body.eduction,
      req.body.tall,
      req.body.textareaHobby,
      req.body.myTextarea,
      req.body.id
    ];
    const sql1 = 'update comment set url = ? where uid = ?'
    const sql2 = `update comment_sum set url = ? where uid = ?`

    db.query(sql, queryParams, (err, results) => {
      res.setHeader("Content-Type", "text/plain;charset=utf-8");
  
      // 执行 SQL 语句失败
      if (err) return res.send(err);
      // 执行 SQL 语句成功，但影响行数不为 1
      if (results.affectedRows !== 1) return res.send("修改用户基本信息失败！");
      db.query(sql1 , [JSON.stringify( req.body.user_pic),req.body.id],(err1,results1) => {
        console.log(results1)
        if (err) return console.log(err);
      })
      db.query(sql2 , [JSON.stringify( req.body.user_pic),req.body.id],(err2,results2) => {
        if(err2) console.log(err2)
      })
      // 修改用户信息成功
      return res.send({ status: 0, message: "修改用户基本信息成功！" });
    });
  };
  