var express = require('express');
var router = express.Router();
var user = require('./user/users') 
var userinfo = require("./user/userInfo")
var list =require("./list/list")
var comment = require("./comment/index")
router.post('/regUser', user.regUser)//注册用户
router.post('/login',user.login)//登录
router.get('/userInfo',userinfo.getUserInfo)//查询用户信息
router.post('/updateUserInfo',userinfo.updateUserInfo)//修改用户信息


router.get("/list/mate", list.getList)//获取匹配列表
router.get('/list/mate/details', list.getListDetails)//获取城市详细信息
router.post('/list/mate/detail',list.postListDetail)//添加绿线
router.get("/list/mate/detailInfo",list.getDetailInfo)//获取用户+城市的详细信息
router.post("/list/mate/detailStatus",list.postDetailStatus)//修改路线状态

router.post("/list/likeSum",list.postList)//推荐加一
router.get("/list/mate/userDetail",list.getDetailUserInfo),//只用于获取用户自己的旅游路线

router.get("/comment/list",comment.getCommentList)////获取所有评论（不包括对发表的评论）
router.get('/commentSum/list',comment.getCommentSumList)//发表每个说说的对应评论
router.post("/comment/addLike",comment.postLikeAdd)//点赞
router.post("/commentSum/add",comment.postCommentSum)//评论发布者的
router.post("/comment/addRely",comment.postAddRely)//评论发布
module.exports = router;

