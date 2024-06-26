const db = require('../../db/index');
//匹配接口
exports.getList = (req, res) => {
    let sql;
    // 构建 SQL 查询语句，同时查询多个字段
    if(Object.keys(req.query).length === 0) {
        sql = 'select * from list'
    }
    sql = 'select * from list where '
    const {id, sex, characters, hobby, years, city,uid, likeSum, recommend } = req.query;
    const params = [];
    if(id) {
        sql += ` id = ?`
        params.push(id)
    }
    if (sex) {
        sql += ` sex = ?`
        params.push(sex);
    }
    if (characters) {
        sql += `  characters = ?`;
        params.push(characters);
    }

    if (hobby) {
        sql += `  hobby = ?`;
        params.push(hobby);
    }

    if (years) {
        sql += `  years = ?`;
        params.push(years);
    }

    if (city) {
        sql += `  city = ?`;
        params.push(city);
    }
    if(uid) {
        sql += ` uid = ?`;
        params.push(uid)
    }
    if (likeSum) {
        sql += `  likeSum = ?`;
        params.push(likeSum);
    }
    if(recommend) {
        sql += `  recommend = ?`
        params.push(recommend)
    }
    sql = sql.replace(/\?/g, "? AND").replace(/ AND$/g, "");
    if(params.length == 0) {
        sql = 'select * from list'
    }
    // 执行 SQL 查询
    db.query(sql, params, (err, result) => {
        if (err) {
            return res.status(500).send('该匹配无数据');
        }
        
        if (!result.length) {
            return res.status(404).send('未找到匹配的数据');
        }

        res.status(200).send({
            status: 0,
            message: '获取数据成功！',
            data: result
        });
    });
};

//list的每个详情
exports.getListDetails = (req, res) => {
    const query = req.query
    let sql = `select * from list_details where name = ?`
    if(!query.name) {
        return res.send({status:1, message:'未能找到该城市路线！'})
    }
    db.query(sql, [query.name], (err, results) => {
        // 1. 执行 SQL 语句失败
        if (err) return res.send(err);
        // 2. 执行 SQL 语句成功，但是查询到的数据条数不等于 1
        if (results.length !== 1) return res.send("获取c城市信息失败！");
        // 3. 将用户信息响应给客户端
        res.send({
          status: 0,
          message: `获取${query.name}信息成功！`,
          data: results[0],
        });
      });
} 
//添加路线
exports.postListDetail = (req, res) => {
    const query = req.body
    let sql = `update  list_details set route_recommendation = ? where name = ?`
    db.query(sql, [JSON.stringify(query.route_recommendation), query.name], (err, results) => {
        // 1. 执行 SQL 语句失败
        if (err) return res.send(err);
        // 2. 执行 SQL 语句成功，但是查询到的数据条数不等于 1
        // if (results.length !== 1) return res.send("获取c城市信息失败！");
        // // 3. 将用户信息响应给客户端
        // res.send({
        //   status: 0,
        //   message: `获取${query.name}信息成功！`,
        //   data: results[0],
        // });
        if (results.affectedRows !== 1) return res.send("修改信息失败！");
  
        // 修改用户信息成功
        return res.send({ status: 0, message: "修改信息成功！" });
      });

}

//请求城市路线进度
exports.getDetailInfo = (req,res) => {
    const query = req.query
    let sql = `select * from details_schedule where uid = ? && name = ?`
    db.query(sql, [query.uid,query.name,query.title], (err, results) => {
        // 1. 执行 SQL 语句失败
        if (err) return res.send(err);
        // 2. 执行 SQL 语句成功，但是查询到的数据条数不等于 1
        if (results.length !== 1) return res.send ({
            status: 0,
            message:`${query.name}暂时没得旅游路线！`,
            data:[]
        })
        // 3. 将用户信息响应给客户端
        res.send({
          status: 0,
          message: `获取${query.name}信息成功！`,
          data: results[0],
        });
      });
}
//选择路线了，请求存储 
exports.postDetailStatus = (req, res) => {
    const query = req.body;
   
    let sql1 = `UPDATE details_schedule SET status=?, detailSchedule=?, route=?, title=?, uid=?,article=? , langs = ? , img = ? WHERE name=?`;
    let sql2 = `INSERT INTO details_schedule (status, detailSchedule, route, name, title, uid,article,langs,img) VALUES (?, ?, ?, ?, ?, ?,? , ?, ?)`;

    let sqlName = 'SELECT * FROM details_schedule WHERE name = ?';
    db.query(sqlName, [query.name], (err, results) => {
        if (err) {
            return res.send('失败');
        } else {
            const sql = results.length > 0 ? sql1 : sql2;
            const params = results.length > 0 ? [query.status, query.detailSchedule, JSON.stringify(query.route), query.title, query.uid, query.article,query.langs,query.img,query.name] : [query.status, query.detailSchedule, JSON.stringify(query.route), query.name, query.title, query.uid,query.article,query.langs,query.img];
            //const params = [query.status, query.detailSchedule, JSON.stringify(query.route), query.name, query.title, query.uid,query.article];
            
            db.query(sql, params, (e, result) => {
                if (e) {
                    return res.send(e);
                }
                if (result.affectedRows !== 1) {
                    return res.send("失败");
                }
                return res.send({ status: 0, message: '成功！' });
            });
        }
    });
}

//推荐加一

exports.postList = (req, res) => {
    const query = req.body;
    let sql = `UPDATE list SET likeSum = ? WHERE id = ?`;
    let selectSql = `SELECT status FROM list WHERE id = ?`;
    
    db.query(selectSql, [query.id], (err, results) => {
        if (err) return res.send(err);

        // 检查结果是否存在并且长度大于0
        if (results.length > 0) {
            let statusArray = JSON.parse(results[0].status || "[]");

            // 检查是否是不同的用户并且该用户不存在
            if (!statusArray.includes(query.userId)) {
                statusArray.push(query.userId);

                db.query(sql, [query.likeSum, query.id], (err, results) => {
                    if (err) return res.send(err);
                    return res.send({ status: 0, message: "推荐成功！" });
                });

                // 更新 status 数组
                let updateStatusSql = `UPDATE list SET status = ? WHERE id = ?`;
                db.query(updateStatusSql, [JSON.stringify(statusArray), query.id], (err, results) => {
                    if (err) return res.send(err);
                });
            } else {
                return res.send({status:302,message:"用户已推荐过！"});
            }
        } else {
            return res.send({status:404,message:"未找到相关记录！"});
        }
    });
};


//请求城市路线进度--只用于获取用户自己的旅游路线
exports.getDetailUserInfo = (req,res) => {
    const query = req.query
    let sql = `select * from details_schedule where uid = ?`
    db.query(sql, [query.uid], (err, results) => {

        // 1. 执行 SQL 语句失败
        if (err) return res.send(err);
        // 2. 执行 SQL 语句成功，但是查询到的数据条数不等于 1
        if (results.length == 0) return res.send ({
            status: 404,
            message:`暂时没得旅游路线！`,
            data:[]
        })
        // 3. 将用户信息响应给客户端
        res.send({
          status: 0,
          message: `获取信息成功！`,
          data: results,
        });
      });
}



