const db = require('../../db/index');
//获取所有评论
exports.getCommentList = (req, res) => {
    // 构建 SQL 查询语句，同时查询多个字段
    const query = req.query
    let sql = `select * from comment ORDER BY id DESC`
    db.query(sql, [query], (err, results) => {

        // 1. 执行 SQL 语句失败
        if (err) return res.send(err);
        // 2. 执行 SQL 语句成功，但是查询到的数据条数不等于 1
        if (results.length == 0) return res.send ({
            status: 404,
            message:`无评论！`,
            data:[]
        })
        // 3. 将信息响应给客户端
        res.send({
          status: 0,
          message: `获取信息成功！`,
          data: results,
        });
      });
};
// 获取发表分享对应的评论
exports.getCommentSumList = (req, res) => {
    const query = req.query
    // 假设 query.comment_ids 为包含要查询的评论 id 的数组，如 [1, 2]
    let sql = `select * from comment_sum where comment_id IN (?) ORDER BY id DESC`
    db.query(sql, [JSON.parse(query.comment_id)], (err, results) => {
        if (err) return res.send(err)
        if (results.length === 0) {
            return res.send({
                status: 404,
                message: '没有评论！',
                data: results
            })
        }
        res.send({
            status: 0,
            message: "获取评论成功！",
            data: results
        })
    })
}


// 点赞
exports.postLikeAdd = (req,res) => {
    const query = req.body;
    let table = 'comment'
    if(query.isSumTable) {
        table = 'comment_sum'
    }
    let sql = `UPDATE ${table} SET like_sum = ? WHERE id = ?`;
    let selectSql = `SELECT is_like FROM ${table} WHERE id = ?`;

    db.query(selectSql, [query.id], (err, results) => {
        if (err) return res.send(err);

        // 检查结果是否存在并且长度大于0
        if (results.length > 0) {
            let statusArray = JSON.parse(results[0].is_like || "[]");

            // 检查是否是不同的用户并且该用户不存在
            if (!statusArray.includes(query.userId)) {
                statusArray.push(query.userId);

                db.query(sql, [query.like_sum, query.id], (err, results) => {
                    if (err) return res.send(err);
                    return res.send({ status: 0, message: "推荐成功！" });
                });

                // 更新 status 数组
                let updateStatusSql = `UPDATE ${table} SET is_like = ? WHERE id = ?`;
                db.query(updateStatusSql, [JSON.stringify(statusArray), query.id], (err, results) => {
                    if (err) return res.send(err);
                });
            } else {
                return res.send({status:302,message:"用户已点赞过！"});
            }
        } else {
            return res.send({status:404,message:"未找到相关记录！"});
        }
    });
}

//添加评论--对发布者的
exports.postCommentSum = (req, res) => {
    const query = req.body;
    let sql = 'insert into comment_sum (user_name, data, content_str, comment_id, uid,url) values (?,?,?,?,?,?)';
    db.query(sql, [ query.user_name, query.data, query.content_str, query.comment_id, query.uid, query.url], (err, result) => {
        // 1. 执行 SQL 语句失败
        if (err) return res.send(err);
        
        // 2. 执行 SQL 语句成功，但是影响的行数不等于 1
        if (result.affectedRows !== 1) {
            return res.send({
                status: 0,
                message: `评论失败！`
            });
        }

        // 3. 更新成功，将结果响应给客户端
        res.send({
            status: 1,
            message: `评论成功！`
        });
    });
}

// 发说说
exports.postAddRely = (req,res) => {
    const query = req.body
    console.log(query)
    if(query.images == []) {
        query.images = null
    }
    let sql = 'insert into comment (user_name, data, content_text, uid,url,images) values (?,?,?,?,?,?)'
    db.query(sql,[query.user_name,query.data,query.content_text,query.uid,query.url,JSON.stringify(query.images)],(err,result) => {
                // 1. 执行 SQL 语句失败
                if (err) return res.send(err);
        
                // 2. 执行 SQL 语句成功，但是影响的行数不等于 1
                if (result.affectedRows !== 1) {
                    return res.send({
                        status: 0,
                        message: `发表评论失败！`
                    });
                }
        
                // 3. 更新成功，将结果响应给客户端
                res.send({
                    status: 1,
                    message: `发表评论成功！`
                });
    })
}
