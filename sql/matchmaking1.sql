/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306_1
 Source Server Type    : MySQL
 Source Server Version : 50651 (5.6.51)
 Source Host           : localhost:3306
 Source Schema         : matchmaking

 Target Server Type    : MySQL
 Target Server Version : 50651 (5.6.51)
 File Encoding         : 65001

 Date: 17/03/2024 09:47:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间',
  `content_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自己的评论',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `all_reply` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '总评论数',
  `like_sum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '点赞数',
  `is_like` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否点赞了 0/1',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `images` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '评论图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 'root', '2024-03-14 22:02', '我很喜欢重庆美食和美景，玩了很多次还是玩不腻，下次再来！！！1', NULL, NULL, NULL, NULL, 4, '[{\"size\":246824,\"type\":\"image\",\"url\":\"http://tmp/ZMHhD58W3n7o81050ced1e2938786cf94046f18fea51.webp\",\"thumb\":\"http://tmp/ZMHhD58W3n7o81050ced1e2938786cf94046f18fea51.webp\",\"status\":\"success\",\"message\":\"\"}]');
INSERT INTO `comment` VALUES (19, 'root1', '2024-03-15 00:54', '这里好美啊！！！', '{\"size\":21863,\"type\":\"image\",\"url\":\"http://tmp/WMgonQeVgzLm27e729e0396a4da64f358e75e87fc69c.png\",\"thumb\":\"http://tmp/WMgonQeVgzLm27e729e0396a4da64f358e75e87fc69c.png\",\"status\":\"success\",\"message\":\"上传成功！\"}', NULL, '2', '[5,4]', 5, '[{\"size\":14352,\"type\":\"image\",\"url\":\"http://tmp/vHA2hZR79kQj0d1ddff7d6472aea8d8dbb0df56087c9.webp\",\"thumb\":\"http://tmp/vHA2hZR79kQj0d1ddff7d6472aea8d8dbb0df56087c9.webp\",\"status\":\"success\",\"message\":\"\"}]');
INSERT INTO `comment` VALUES (21, 'root1', '2024-03-16 20:25', '我还是非常喜欢这里的风景的，毕竟这也是我的老家，欢迎大家来玩耍！！', '{\"size\":21863,\"type\":\"image\",\"url\":\"http://tmp/WMgonQeVgzLm27e729e0396a4da64f358e75e87fc69c.png\",\"thumb\":\"http://tmp/WMgonQeVgzLm27e729e0396a4da64f358e75e87fc69c.png\",\"status\":\"success\",\"message\":\"上传成功！\"}', NULL, NULL, NULL, 5, '[{\"size\":14352,\"type\":\"image\",\"url\":\"http://tmp/mNagnLkqOJfm0d1ddff7d6472aea8d8dbb0df56087c9.webp\",\"thumb\":\"http://tmp/mNagnLkqOJfm0d1ddff7d6472aea8d8dbb0df56087c9.webp\",\"status\":\"success\",\"message\":\"\"},{\"size\":79713,\"type\":\"image\",\"url\":\"http://tmp/uVrI44D8nTe3217bf3ee873933fe093e60eb3eba3080.jpg\",\"thumb\":\"http://tmp/uVrI44D8nTe3217bf3ee873933fe093e60eb3eba3080.jpg\",\"status\":\"success\",\"message\":\"\"}]');
INSERT INTO `comment` VALUES (22, 'root1', '2024-03-16 20:31', '此时此刻，我想表达这里真的很美，来这里一趟真的是非常棒的一个选择，我真的很庆幸能遇见！！！', '{\"size\":21863,\"type\":\"image\",\"url\":\"http://tmp/WMgonQeVgzLm27e729e0396a4da64f358e75e87fc69c.png\",\"thumb\":\"http://tmp/WMgonQeVgzLm27e729e0396a4da64f358e75e87fc69c.png\",\"status\":\"success\",\"message\":\"上传成功！\"}', NULL, NULL, NULL, 5, '[{\"size\":246824,\"type\":\"image\",\"url\":\"http://tmp/TvsQOlOFp9X581050ced1e2938786cf94046f18fea51.webp\",\"thumb\":\"http://tmp/TvsQOlOFp9X581050ced1e2938786cf94046f18fea51.webp\",\"status\":\"success\",\"message\":\"\"},{\"size\":14352,\"type\":\"image\",\"url\":\"http://tmp/M9z8L8GyXydX0d1ddff7d6472aea8d8dbb0df56087c9.webp\",\"thumb\":\"http://tmp/M9z8L8GyXydX0d1ddff7d6472aea8d8dbb0df56087c9.webp\",\"status\":\"success\",\"message\":\"\"}]');

-- ----------------------------
-- Table structure for comment_sum
-- ----------------------------
DROP TABLE IF EXISTS `comment_sum`;
CREATE TABLE `comment_sum`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `content_str` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论',
  `uid` int(11) NULL DEFAULT NULL COMMENT '评论的用户id',
  `comment_id` int(11) NULL DEFAULT NULL COMMENT '发表评论的用户的id',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `like_sum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '赞数',
  `is_like` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否赞了',
  `data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of comment_sum
-- ----------------------------
INSERT INTO `comment_sum` VALUES (1, 'root', '真的很棒喔', 4, 15, NULL, NULL, NULL, '2024-03-14 23:18');
INSERT INTO `comment_sum` VALUES (2, 'root', '我也很喜欢', 4, 15, NULL, NULL, NULL, '2024-03-14 23:18');
INSERT INTO `comment_sum` VALUES (3, 'root', '最好是这样', 4, 15, NULL, NULL, NULL, '2024-03-14 23:19');
INSERT INTO `comment_sum` VALUES (4, 'root', '你说呢', 4, 15, NULL, NULL, NULL, '2024-03-14 23:19');
INSERT INTO `comment_sum` VALUES (5, 'root', '还是很棒', 4, 15, NULL, NULL, NULL, '2024-03-14 23:19');
INSERT INTO `comment_sum` VALUES (6, 'root', '哈哈哈哈', 4, 15, '{\"size\":53185,\"type\":\"image\",\"url\":\"http://tmp/leZjPdhvdQnOfda3837f8fe55c96663e5e4b51c94494.png\",\"thumb\":\"http://tmp/leZjPdhvdQnOfda3837f8fe55c96663e5e4b51c94494.png\",\"status\":\"success\",\"message\":\"上传成功！\"}', NULL, NULL, '2024-03-14 23:28');
INSERT INTO `comment_sum` VALUES (7, 'root1', '我也很喜欢重庆！', 5, 1, '{\"size\":21863,\"type\":\"image\",\"url\":\"http://tmp/WMgonQeVgzLm27e729e0396a4da64f358e75e87fc69c.png\",\"thumb\":\"http://tmp/WMgonQeVgzLm27e729e0396a4da64f358e75e87fc69c.png\",\"status\":\"success\",\"message\":\"上传成功！\"}', NULL, NULL, '2024-03-15 00:51');
INSERT INTO `comment_sum` VALUES (8, 'root1', '真的吗，我好喜欢这里', 5, 21, '{\"size\":21863,\"type\":\"image\",\"url\":\"http://tmp/WMgonQeVgzLm27e729e0396a4da64f358e75e87fc69c.png\",\"thumb\":\"http://tmp/WMgonQeVgzLm27e729e0396a4da64f358e75e87fc69c.png\",\"status\":\"success\",\"message\":\"上传成功！\"}', NULL, NULL, '2024-03-16 20:30');

-- ----------------------------
-- Table structure for details_schedule
-- ----------------------------
DROP TABLE IF EXISTS `details_schedule`;
CREATE TABLE `details_schedule`  (
  `uid` int(255) NULL DEFAULT NULL COMMENT '用户id',
  `detailSchedule` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '根据用户展示具体城市的旅游进度',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '在那个城市旅游',
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '序列id',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旅游状态，0：未开始旅游 1:正在旅游',
  `route` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路线',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '那个地方旅游（某个城市内）',
  `article` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第几条路线',
  `langs` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '进度在第几个地方',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of details_schedule
-- ----------------------------

-- ----------------------------
-- Table structure for list
-- ----------------------------
DROP TABLE IF EXISTS `list`;
CREATE TABLE `list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `hobby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '爱好',
  `years` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年龄段',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户',
  `likeSum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '点赞数',
  `characters` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性格',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `recommend` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推荐--1是/2不是',
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推荐描述',
  `star` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推荐心数',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否已推荐',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of list
-- ----------------------------
INSERT INTO `list` VALUES (5, '男', '阅读', '00后', '北京', '', '607', '宜人', 'https://img95.699pic.com/xsj/0p/ap/s3.jpg%21/fh/300', '1', '作为00后的年轻男性，对于喜欢阅读的你来说，北京是一个汇聚了丰富文化资源和书香氛围的城市，无论是古老的文化名胜如故宫、还是现代的文学活动和书店，都能满足你对知识和阅读的热爱。此外，北京作为中国的首都，不仅拥有优质的教育资源和就业机会，也提供了多元化的生活方式和文化体验，让你在这座城市里能够充分展现自己的才华和潜力。因此，我强烈推荐你前往北京，探索这座城市的独特魅力，相信你一定会在这里找到适合自己成长和发展的机会', '4', '');
INSERT INTO `list` VALUES (6, '男', '运动', '00后', '广州', '', '32', NULL, 'http://dj-52152.cdn.bcebos.com/uploads/userfiles/6850/images/pageimg/20210324/6850-2103241H02S.jpg', NULL, '广州是中国南方重要城市之一，是“岭南文化”的代表城市。城市内有许多著名景点，如白云山、陈家祠、广州塔等。广州的美食文化也是其独特之处，如叉烧、煲仔饭、牛肉粉等经典美食', '3', NULL);
INSERT INTO `list` VALUES (7, '男', '旅游', '00后', '上海', NULL, '300', '外向', 'https://wx1.sinaimg.cn/mw690/005E7Pvwly1hn2jch5sotj30tn1hctk7.jpg', NULL, '探索上海的潮流文化：00后年轻人通常对时尚和潮流文化感兴趣，上海作为中国时尚之都，有许多时尚创意园区、涂鸦艺术区和潮流购物街区，如Tianzifang、复兴SOHO等，可以满足他们对潮流文化的好奇心。\r\n\r\n感受上海的现代气息：上海是一个融合传统与现代的城市，00后游客可以前往陆家嘴金融区感受高楼林立的震撼，参观上海中心大厦观光厅，感受现代都市的繁华和活力。\r\n\r\n探索上海历史文化：除了现代气息，上海也有悠久的历史文化，00后游客可以游览豫园、城隍庙等历史景点，感受上海的古老韵味。\r\n\r\n参与城市体验活动', NULL, NULL);
INSERT INTO `list` VALUES (8, '女', '旅游', '00后', '深圳', '', '50', '直觉', 'https://p2.cri.cn/M00/82/93/rBABCmXYD6eALXPbAAAAAAAAAAA223.768x575.640x480.jpg', '1', '深圳是中国广东省的一座现代化城市，也是00后女性喜欢旅游的热门目的地之一。作为一座年轻而充满活力的城市，深圳拥有独特的魅力和吸引力。\r\n\r\n深圳以其高科技产业、创新氛围和繁华的商业环境而闻名，吸引了许多年轻人前来追求梦想和发展机会。在这里，您可以感受到现代化的都市氛围，探索各种科技展览和创意空间，领略创新科技带来的无限可能。\r\n\r\n除了商业活力，深圳还有丰富多彩的文化景观和自然风光。您可以参观深圳的文化村落、博物馆和艺术展览，感受城市的文化底蕴；也可以前往深圳湾畔欣赏海景，漫步在公园绿地中，享受放松愉悦的', '3', NULL);
INSERT INTO `list` VALUES (9, '女', '艺术', '90后', '天津', NULL, '90', '开放', 'https://dimg04.c-ctrip.com/images/0102p1200080xo5ww7B8C_R_1600_10000.jpg', NULL, '对于90后的艺术爱好者来说，天津是一个充满艺术氛围和历史底蕴的城市，提供了许多适合他们的艺术体验。以下是一些建议：\r\n\r\n参观天津美术馆：作为中国最早的美术馆之一，天津美术馆收藏着大量的中国现当代美术作品，包括绘画、雕塑、书法等，展览内容丰富多样，适合艺术爱好者进行深入的艺术探索。\r\n\r\n漫步意式风情街区：天津拥有独特的意式风情街区，街道两侧布满了文艺小店、画廊、咖啡馆等，90后艺术爱好者可以在这里感受到浓厚的艺术氛围，欣赏各种艺术品和手工艺品。\r\n\r\n参与文化创意活动：天津的文化创意产业发达，经常举办各', NULL, NULL);
INSERT INTO `list` VALUES (10, '女', '阅读', '80后', '南京', NULL, '51', '直觉', 'https://pic1.zhimg.com/v2-274069fe474bd3abc87c4a36d8bf7abc_r.jpg', NULL, '对于80后的阅读爱好者来说，南京是一个充满文化底蕴和历史气息的城市，提供了许多适合他们的阅读体验。以下是一些建议：\r\n\r\n参观南京图书馆：南京图书馆是中国历史悠久、规模宏大的综合性图书馆之一，馆藏丰富，涵盖了各个领域的书籍和资料，是80后阅读爱好者进行深入阅读和研究的理想场所。\r\n\r\n探访老门东历史文化街区：老门东是南京著名的历史文化保护街区，街道两旁布满了古玩店、古书店、艺术工作室等，80后阅读爱好者可以在这里感受到浓厚的历史氛围，寻找到心仪的书籍和收藏品。\r\n\r\n参加文学活动和讲座：南京经常举办各种文', NULL, NULL);
INSERT INTO `list` VALUES (11, '男', '旅游', '80后', '杭州', '', '200', NULL, 'https://wwly.itzjj.cn/uploads/images/202311/20231121/387c92edd6812f41a0f7b1ff8fc34546.png', '1', '杭州是中国浙江省的一座历史悠久、风景优美的城市，也是80后男性喜欢旅游的热门目的地之一。作为一座典型的江南水乡城市，杭州以其优美的自然风光、悠久的历史文化和精致的美食而闻名于世。\r\n\r\n杭州的西湖被誉为中国的“天堂”，是杭州的标志性景点之一。在西湖边散步、骑行或乘船游览，您可以欣赏到如诗如画的湖光山色，感受到宁静和美好。此外，雷峰塔、岳庙、孤山等历史古迹也值得一游，让您领略到杭州悠久的历史文化底蕴。\r\n\r\n杭州还是一个美食之都，拥有众多有名的特色小吃和地方美食，如西湖醋鱼、龙井虾仁、宋嫂鱼羹等，让您在品尝', '3', NULL);
INSERT INTO `list` VALUES (12, '女', '美食', '00后', '成都', NULL, NULL, NULL, 'https://n.sinaimg.cn/sinakd20220418ac/78/w1050h628/20220418/4343-4bafd8aaf7068f8482b873323842d349.png', NULL, '对于00后的美食爱好者来说，成都是一个绝佳的选择。作为中国西南地区的美食之都，成都以其丰富多样的川菜闻名于世。以下是一些建议：\r\n\r\n品尝正宗川菜：成都有许多著名的川菜馆和小吃摊，如火锅、麻辣烫、辣子鸡等。您可以尝试成都最具代表性的美食，如麻婆豆腐、回锅肉、水煮鱼等，在舌尖上享受川菜的魅力。\r\n\r\n探索传统夜市：成都的夜市是品尝当地美食的绝佳场所。锦里古街、宽窄巷子等地都有许多小吃摊位，您可以品尝到各种传统的川菜小吃，如麻辣串串、龙抄手、糖油果子等。\r\n\r\n尝试创意美食：成都也有许多创意美食店，00后喜欢', NULL, NULL);
INSERT INTO `list` VALUES (13, '女', '美食', '10后', '重庆', NULL, '500', '直觉', 'https://dimg04.c-ctrip.com/images/0101f1200085t1py26F46_R_1600_10000.jpg', '1', '重庆是中国西南地区的一座美食之城，也是10后女性喜欢探索美食的热门目的地之一。作为一座融合了川菜、火锅等多种地方特色美食的城市，重庆以其麻辣味道和丰富多样的美食文化吸引着众多游客。\r\n\r\n在重庆，您可以品尝到正宗的川菜，如麻辣香锅、麻辣火锅、口水鸡等，尽情享受川菜独特的麻辣味道和浓厚的地方特色。此外，重庆还有许多特色小吃，如酸辣粉、豆花米线、重庆小面等，让您可以品尝到不同口味和风味的美食。\r\n\r\n除了美食，重庆还有许多值得一游的景点和活动，如洪崖洞、长江索道、解放碑步行街等，让您在品尝美食的同时，感受重庆', '5', NULL);
INSERT INTO `list` VALUES (14, '女', '运动', '10后', '武汉', '', NULL, NULL, 'https://photo.tuchong.com/1874260/f/695142224.jpg', NULL, '对于10后的运动爱好者来说，武汉提供了丰富多彩的运动选择。作为一座充满活力的城市，武汉拥有许多适合年轻人参与的运动项目和场所。以下是一些建议：\r\n\r\n骑行长江大堤：武汉长江大堤沿岸设置了专门的自行车道，适合骑行爱好者进行休闲骑行，欣赏长江美景，感受清风徐来的快乐。\r\n\r\n参加户外体育活动：武汉的一些公园和户外运动场所经常举办各种体育活动，如篮球比赛、排球比赛等，10后的运动爱好者可以参与其中，结交新朋友，享受运动的乐趣。\r\n\r\n划船游湖：在东湖、沙湖等景区，您可以租赁小船，划船游湖，感受水上运动的刺激和乐', NULL, NULL);
INSERT INTO `list` VALUES (15, '男', '阅读', '00后', '西安', NULL, NULL, NULL, 'http://djyclvy.cdn.bcebos.com/uploads/userfiles/1/images/pageimg/20191204/1-19120409440T.jpeg', NULL, '对于00后的阅读爱好者来说，西安是一个充满文化底蕴的城市，提供了丰富多样的阅读选择和书店场所。以下是一些建议：\r\n\r\n参观历史名胜：作为中国四大古都之一，西安拥有丰富的历史文化资源，如兵马俑、大雁塔、古城墙等，00后可以通过参观这些历史名胜，了解中国古代历史，激发阅读兴趣。\r\n\r\n拜访书店和文化街区：西安有许多文化氛围浓厚的书店和文化街区，如钟书阁、鹦鹉洲书局等，00后可以在这些地方找到各种类型的书籍，尤其是关于历史、文学、艺术等方面的书籍，满足阅读需求。\r\n\r\n参加文学活动：西安经常举办各种文学沙龙、书', NULL, NULL);
INSERT INTO `list` VALUES (16, '女', '艺术', '90后', '青岛', NULL, NULL, NULL, 'https://44616.itzjj.cn/uploads/images/pageimg/20230413/44616-230413153J34.jpg', NULL, '对于90后的艺术爱好者来说，青岛是一个充满艺术氛围和文化底蕴的城市，提供了许多艺术相关的活动和场所。以下是一些建议：\r\n\r\n参观艺术展览：青岛有许多美术馆和画廊，经常举办各种艺术展览，展示当代艺术作品和传统艺术品。90后的艺术爱好者可以参观这些展览，欣赏艺术作品，拓展艺术视野。\r\n\r\n参加艺术工作坊：青岛的一些艺术机构和文化中心会定期举办艺术工作坊，如绘画、手工艺制作、摄影等。90后的艺术爱好者可以参加这些工作坊，学习艺术技巧，体验艺术创作的乐趣。\r\n\r\n漫步艺术街区：青岛有一些充满艺术氛围的街区，如老城', NULL, NULL);
INSERT INTO `list` VALUES (17, '男', '音乐', '00后', '大连', NULL, NULL, '外向', 'https://38585.itzjj.cn/uploads/images/pageimg/20230323/38585-2303231233354.jpg', NULL, '对于00后的音乐爱好者来说，大连是一个充满音乐活力和文化氛围的城市，提供了丰富多样的音乐场所和活动。以下是一些建议：\r\n\r\n参加音乐演出：大连经常举办各种音乐演出活动，包括流行音乐、古典音乐、摇滚乐等不同风格的演出。00后的音乐爱好者可以参加这些演出，欣赏不同类型的音乐表演，感受音乐的魅力。\r\n\r\n参与音乐节和活动：大连也定期举办各类音乐节和音乐活动，如大型音乐节、校园音乐活动等，00后的音乐爱好者可以参与其中，体验音乐盛会，发现新的音乐才华。\r\n\r\n寻找音乐酒吧和livehouse：大连有许多音乐酒吧和', NULL, NULL);
INSERT INTO `list` VALUES (18, '女', '艺术', '80后', '厦门', NULL, NULL, NULL, 'https://dimg04.c-ctrip.com/images/0105u1200087cqv2aD4F0_R_1600_10000.jpg', NULL, '对于80后的艺术爱好者来说，厦门是一个充满文化氛围和艺术活动的城市，提供了许多艺术相关的场所和活动。以下是一些建议：\r\n\r\n参观艺术展览：厦门有许多美术馆、画廊和艺术空间，经常举办各种艺术展览，展示当代艺术作品和传统艺术品。80后的艺术爱好者可以参观这些展览，欣赏艺术作品，拓展艺术视野。\r\n\r\n参加艺术课程：在厦门的一些艺术机构和文化中心，会定期举办绘画、陶艺、摄影等艺术课程，80后的艺术爱好者可以参加这些课程，学习艺术技巧，进行艺术创作。\r\n\r\n探索文艺街区：厦门有一些充满艺术气息的街区，如鼓浪屿、南普', NULL, NULL);
INSERT INTO `list` VALUES (19, '女', '运动', '10后', '哈尔滨', '', '300', '宜人', 'https://dimg04.c-ctrip.com/images/100s0z000000ng5sn3ED6.jpg', '1', '哈尔滨是中国东北地区的一座美丽城市，也是一个适合10后女性喜欢运动的地方。作为一个四季分明的城市，哈尔滨在不同季节都有各种户外和室内运动活动可供选择，让您可以尽情享受运动的乐趣。\r\n\r\n冬季是哈尔滨最具特色的季节，这个时候您可以体验到冰雪运动的乐趣。哈尔滨冬季运动会是一大亮点，您可以观赏到各种精彩的冰雪项目比赛，感受冰雪运动的魅力。此外，您还可以去哈尔滨的冰雪大世界、冰雕园等地参与冰雪娱乐活动，体验滑冰、滑雪等冬季运动项目。\r\n\r\n除了冬季运动，哈尔滨在夏季也有很多户外运动项目可供选择。您可以去索菲亚大教', '5', NULL);

-- ----------------------------
-- Table structure for list_details
-- ----------------------------
DROP TABLE IF EXISTS `list_details`;
CREATE TABLE `list_details`  (
  `id` int(255) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地名',
  `images` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '轮播图照片',
  `text` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '地点文字叙述',
  `route_recommendation` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '路线推荐',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of list_details
-- ----------------------------
INSERT INTO `list_details` VALUES (1, '北京', '[{\r\n			\"url\": \"https://gd-hbimg.huaban.com/ef9fb2a609459c2e4203af60df44414ae2bda7c01a71f-T6JvNi_fw1200\"\r\n		}, {\r\n			\"url\": \"https://p9-pc-sign.douyinpic.com/tos-cn-i-0813/oARbACNzCEPQeGyAI427D7EXaCWAEhCAfAAyIg~tplv-dy-aweme-images:q75.webp?biz_tag=aweme_images&from=3213915784&s=PackSourceEnum_AWEME_DETAIL&sc=image&se=false&x-expires=1711544400&x-signature=V12utLcf2%2FzauvNDHcbjwwLbVmQ%3D\"\r\n		}, {\r\n			\"url\": \"https://picx.zhimg.com/v2-bc3e283588adbfa436b56ac070e460d2_1440w.jpg?source=172ae18b\"\r\n		}]', '北京是中国的首都，拥有丰富的历史和文化遗产。这座城市有着著名的故宫、长城、颐和园等地标性景点，吸引着众多国内外游客。此外，北京还以烤鸭和各种小吃而闻名。', '[\r\n		[{\r\n			\"title\": \"天安门\"\r\n		}, {\r\n			\"title\": \"故宫\"\r\n		}, {\r\n			\"title\": \"天坛\"\r\n		}, {\r\n			\"title\": \"八角岭\"\r\n		}, {\r\n			\"title\": \"鸟巢\"\r\n		}, {\r\n			\"title\": \"圆明园\"\r\n		}],\r\n		[{\r\n			\"title\": \"天安门\"\r\n		}, {\r\n			\"title\": \"故宫\"\r\n		}, {\r\n			\"title\": \"天坛\"\r\n		}, {\r\n			\"title\": \"八角岭\"\r\n		}, {\r\n			\"title\": \"颐和园\"\r\n		}]\r\n	]');
INSERT INTO `list_details` VALUES (2, '上海', '[{\"url\":\"https://img2.baidu.com/it/u=2235816832,3416792269&fm=253&fmt=auto&app=138&f=JPEG?w=888&h=500\"}, {\"url\":\"https://img-qn.51miz.com/preview/photo/00/01/52/80/P-1528076-CBA642C2.jpg\"}, {\"url\":\"https://youimg1.c-ctrip.com/target/100o0j000000af7bt3CB2.jpg\"},{\"url\":\"https://pic3.zhimg.com/v2-2ffbd9dd78b67ad480205c89179f56ce_r.jpg\"}]', '上海是中国最大的城市之一，也是国际化大都市。这座城市拥有许多具有时代特征的老建筑和现代化高楼大厦。著名景点包括外滩、东方明珠塔、豫园等。此外，上海的小吃和饮食文化也是其独特魅力所在。', '[[{\"title\":\"多伦现代美术馆\"},{\"title\":\"薛公馆\"},{\"title\":\"多伦路文化名人街\"},{\"title\":\"孔公馆\"},{\"title\":\"白公馆\"},{\"title\":\"白公馆\"},{\"title\":\"鲁迅故居\"}],[{\"title\":\"上海宋庆龄故居\"},{\"title\":\"武康大楼\"},{\"title\":\"武康路\"},{\"title\":\"黄兴旧居\"},{\"title\":\"陈立夫故居\"},{\"title\":\"上海话剧艺术中心\"}]]');
INSERT INTO `list_details` VALUES (3, '广州', '[{\"url\":\"https://p3.toutiaoimg.com/pgc-image/e52ee088ad6f4d09a04cb8e6600ad250~tplv-tt-large.image\"}, {\"url\":\"https://img0.baidu.com/it/u=3390799959,1757915104&fm=253&fmt=auto&app=138&f=JPEG?w=600&h=400\"}, {\"url\":\"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Ffb168b81-81a0-49ce-9fb9-7c3e4354f769%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1711549016&t=d65e0e41dc10706f72834b2098ca6d5b\"}]', '广州是中国南方重要城市之一，是“岭南文化”的代表城市。城市内有许多著名景点，如白云山、陈家祠、广州塔等。广州的美食文化也是其独特之处，如叉烧、煲仔饭、牛肉粉等经典美食。', '[[{\"title\":\"石室圣心大教堂\"},{\"title\":\"上下九步行街\"},{\"title\":\"越秀公园\"},{\"title\":\"中山纪念堂\"},{\"title\":\"永庆坊\"},{\"title\":\"广州塔\"}],[{\"title\":\"石室圣心大教堂\"},{\"title\":\"北京路步行街\"},{\"title\":\"广东省博物馆\"},{\"title\":\"海心沙\"},{\"title\":\"西华路\"}]]');
INSERT INTO `list_details` VALUES (4, '深圳', '[{\"url\":\"https://img2.baidu.com/it/u=3235069366,1876106024&fm=253&fmt=auto&app=138&f=JPEG?w=1055&h=500\"},{\"url\":\"https://p1-q.mafengwo.net/s12/M00/5D/02/wKgED1vAn9SAcosGACNKKYviCek62.jpeg\"}, {\"url\":\"https://img.mp.itc.cn/upload/20161027/fa5ab57cc2bf44269050ee1a89ed9fcd_th.jpg\"}]', '深圳是中国的特区之一，是中国改革开放的代表城市。这座城市有许多著名景点，如世界之窗、欢乐谷、深圳湾公园等。此外，深圳的美食也是其独特魅力所在，如盐焗鸡、潮汕牛肉火锅等', '[[{\"title\":\"莲花山公园\"},{\"title\":\"深圳书城\"},{\"title\":\"深圳图书馆\"},{\"title\":\"深圳证券交易所\"},{\"title\":\"平安金融中心深圳湾公园\"},{\"title\":\"欢乐海岸\"}],[{\"title\":\"东门老街\"},{\"title\":\"深圳文和友\"},{\"title\":\"爬南山公园\"},{\"title\":\"海上世界\"}]]');
INSERT INTO `list_details` VALUES (5, '天津', '[{\"url\":\"https://t11.baidu.com/it/u=2376216870,217752547&fm=30&app=106&f=JPEG?w=640&h=957&s=9D606084EAB6D4DE1DB8A9980300D09F\"}, {\"url\":\"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F1aadc3b5-0ff1-48f3-84f7-2cc6bf8dd6b9%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1711549380&t=44a46c6dae44bc291cfefd704cf5d348\"}, {\"url\":\"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Faa3d74e8-5eb1-441e-a19a-e73ba56b7e7f%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1711549402&t=2ab2c06cddb7bd118a27b99efafaa686\"}]', '天津是中国北方的沿海城市，素有“北方小洋人”之称。这座城市有许多著名景点，如意式风情区、五大道、天津之眼等。此外，天津的美食文化也是其独特魅力所在，如狗不理包子、驴打滚等。', '[\r\n    [\r\n        {\"title\":\"意式风情区\"},\r\n        {\"title\":\"天津之眼\"},\r\n        {\"title\":\"古文化街\"},\r\n        {\"title\":\"南市食品街\"},\r\n        {\"title\":\"天津博物馆\"}\r\n    ],\r\n    [\r\n        {\"title\":\"五大道\"},\r\n        {\"title\":\"天津之眼\"},\r\n        {\"title\":\"海河\"},\r\n        {\"title\":\"天津音乐厅\"},\r\n        {\"title\":\"瓷房子\"}\r\n    ]\r\n]');
INSERT INTO `list_details` VALUES (6, '南京', '[{\"url\":\"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Ff125579e-ccb3-4803-a680-fc62c3b1d393%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1711549454&t=ae4d7eb358b0122249d060f0cb415f9b\"}, {\"url\":\"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F53125e82-af85-415f-b395-fab84726b00d%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1711549454&t=54380a6aec8f6972644ea868ce7c7980\"}, {\"url\":\"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F5b8bdbe9-a352-41da-a64f-b2914b2343f8%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1711549455&t=4c926f45be5716c72389fbbbb6c7da97\"}]', '南京是中国东部的古都之一，有着丰富的历史和文化遗产。著名景点包括中山陵、夫子庙、明孝陵等。此外，南京还以梅花、夜景和美食而闻名，如玄武湖梅花园、夫子庙美食街等。', '[\r\n    [\r\n        {\"title\":\"中山陵\"},\r\n        {\"title\":\"夫子庙\"},\r\n        {\"title\":\"秦淮河\"},\r\n        {\"title\":\"总统府\"},\r\n        {\"title\":\"明孝陵\"}\r\n    ],\r\n    [\r\n        {\"title\":\"夫子庙\"},\r\n        {\"title\":\"新街口步行街\"},\r\n        {\"title\":\"南京博物院\"},\r\n        {\"title\":\"雨花台\"},\r\n        {\"title\":\"中山陵\"}\r\n    ]\r\n]\r\n');
INSERT INTO `list_details` VALUES (7, '杭州', '[{\"url\":\"https://images.weelv.com/question/745607c9df6de6053b1cfacbe2807366.jpg?x-oss-process=img/resize,w_750\"}, {\"url\":\"https://p1-q.mafengwo.net/s11/M00/E8/EF/wKgBEFt6g0eADDqtABEqBaJEV_c82.jpeg\"}, {\"url\":\"https://n.sinaimg.cn/sinacn21/200/w1080h720/20180322/6970-fysnevk8070741.jpg\"}]', '杭州是中国东南沿海城市，以美丽的西湖和丰富的文化遗产而闻名。著名景点包括西湖、雷峰塔、灵隐寺等。此外，杭州的美食也是其独特魅力所在，如叫化鸡、龙井虾仁、蟹黄包等', '[\r\n    [\r\n        {\"title\":\"西湖\"},\r\n        {\"title\":\"灵隐寺\"},\r\n        {\"title\":\"雷峰塔\"},\r\n        {\"title\":\"苏堤\"},\r\n        {\"title\":\"平湖秋月\"}\r\n    ],\r\n    [\r\n        {\"title\":\"西湖\"},\r\n        {\"title\":\"千岛湖\"},\r\n        {\"title\":\"杭州动物园\"},\r\n        {\"title\":\"宋城演艺\"},\r\n        {\"title\":\"西溪湿地\"}\r\n    ]\r\n]\r\n');
INSERT INTO `list_details` VALUES (8, '成都', '[{\"url\":\"https://img-qn.51miz.com/preview/photo/00/01/54/73/P-1547312-AB217BA8O.jpg\"}, {\"url\":\"https://www.siiic.com/uploads/allimg/201022/1-201022112I62E.jpg\"}, {\"url\":\"https://pic.quanjing.com/db/3h/QJ6639887046.jpg\"}]', '成都是中国西南地区的重要城市，以美食和文化而闻名。著名景点包括武侯祠、锦里、宽窄巷子等。此外，成都的美食文化也是其独特魅力所在，如麻辣火锅、夫子庙豆花、兔头等。', '[\r\n    [\r\n        {\"title\":\"宽窄巷子\"},\r\n        {\"title\":\"锦里古街\"},\r\n        {\"title\":\"武侯祠\"},\r\n        {\"title\":\"大熊猫繁育研究基地\"},\r\n        {\"title\":\"春熙路\"}\r\n    ],\r\n    [\r\n        {\"title\":\"都江堰\"},\r\n        {\"title\":\"青城山\"},\r\n        {\"title\":\"杜甫草堂\"},\r\n        {\"title\":\"熊猫基地\"},\r\n        {\"title\":\"宽窄巷子\"}\r\n    ]\r\n]\r\n');
INSERT INTO `list_details` VALUES (9, '重庆', '[{\"url\":\"https://img1.baidu.com/it/u=72652788,2362395680&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500\"}, {\"url\":\"https://ww1.sinaimg.cn/mw690/3f1c50e4ly1hmesz455bhj22ag31xe84.jpg\"}, {\"url\":\"https://images.weelv.com/question/5eead923ab4aaaf7e73f7ea2f141f1ed.png?x-oss-process=img/resize,w_750\"}]', '重庆是中国西南地区的直辖市，以山城和火锅而闻名。著名景点包括洪崖洞、磁器口、南山等。此外，重庆的美食文化也是其独特魅力所在，如火锅、毛血旺、重庆小面等。', '[\r\n    [\r\n        {\"title\":\"洪崖洞\"},\r\n        {\"title\":\"解放碑步行街\"},\r\n        {\"title\":\"长江索道\"},\r\n        {\"title\":\"三峡博物馆\"},\r\n        {\"title\":\"白公馆\"}\r\n    ],\r\n    [\r\n        {\"title\":\"华岩寺\"},\r\n        {\"title\":\"磁器口古镇\"},\r\n        {\"title\":\"南山风景区\"},\r\n        {\"title\":\"重庆大剧院\"},\r\n        {\"title\":\"洪崖洞\"}\r\n    ]\r\n]\r\n');
INSERT INTO `list_details` VALUES (10, '武汉', '[{\"url\":\"https://img1.baidu.com/it/u=41222794,235519449&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500\"}, {\"url\":\"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw%2Fca947910-d9c3-4a89-94d3-34fd0104af2b%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1711549696&t=79789223f66139f1cab173057c6f2820\"}, {\"url\":\"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw%2F86f513a4-e45c-42a0-8249-e7c342e475b7%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1711549696&t=ca75c9b8401b4ce50fa12a76c6b9fd5c\"}]', '武汉是中国中部的重要城市，以长江和美食而闻名。著名景点包括黄鹤楼、东湖、户部巷等。此外，武汉的美食文化也是其独特魅力所在，如热干面、豆皮、麻花等', '[\r\n    [\r\n        {\"title\":\"黄鹤楼\"},\r\n        {\"title\":\"东湖\"},\r\n        {\"title\":\"户部巷\"},\r\n        {\"title\":\"武汉长江大桥\"},\r\n        {\"title\":\"武汉博物馆\"}\r\n    ],\r\n    [\r\n        {\"title\":\"黄鹤楼\"},\r\n        {\"title\":\"东湖樱花园\"},\r\n        {\"title\":\"宝丰街\"},\r\n        {\"title\":\"武汉楚河汉街\"},\r\n        {\"title\":\"光谷步行街\"}\r\n    ]\r\n]\r\n');
INSERT INTO `list_details` VALUES (11, '西安', '[{\"url\":\"https://img0.baidu.com/it/u=3956185317,2504427212&fm=253&fmt=auto&app=120&f=JPEG?w=1200&h=800\"}, {\"url\":\"https://pic.lvmama.com/uploads/pc/place2/2019-09-27/5bec0f1b-d993-4aa5-90e7-26bd3c164b5f.jpg\"}, {\"url\":\"https://img.sxdaily.com.cn/2022-01/27/9425427_6934dbbe-170a-4328-b0b8-e35415e09c6e.jpg\"}]', '西安是中国历史文化名城，以兵马俑和古城墙而闻名。著名景点包括兵马俑、大雁塔、钟楼等。此外，西安的美食文化也是其独特魅力所在，如肉夹馍、凉皮、油泼面等。', '[\r\n    [\r\n        {\"title\":\"兵马俑\"},\r\n        {\"title\":\"大雁塔\"},\r\n        {\"title\":\"华清宫\"},\r\n        {\"title\":\"钟楼\"},\r\n        {\"title\":\"古城墙\"}\r\n    ],\r\n    [\r\n        {\"title\":\"陕西历史博物馆\"},\r\n        {\"title\":\"大唐芙蓉园\"},\r\n        {\"title\":\"小雁塔\"},\r\n        {\"title\":\"西安城墙国际马拉松\"},\r\n        {\"title\":\"曲江池\"}\r\n    ]\r\n]\r\n');
INSERT INTO `list_details` VALUES (12, '青岛', '[{\"url\":\"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F773ea493-baad-42b3-a4cb-574cd08cdcdc%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1711549799&t=f224d4c314a84c29469957b0d1147a98\"}, {\"url\":\"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Fb6f44b50-5e4f-4bcc-a2a3-9572bab07486%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1711549799&t=39adefc07278ca756d85cc88ade8aa28\"}, {\"url\":\"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F21398cdd-6665-48fd-86ce-d54f3a621b6c%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1711549799&t=b8e990cce7d9361a263d4e8169253a07\"}]', '青岛是中国东部沿海城市，以啤酒和德国风情街区而闻名。著名景点包括八大关、栈桥、崂山等。此外，青岛的美食文化也是其独特魅力所在，如鲍鱼、海鲜、烤肉等。', '[\r\n    [\r\n        {\"title\":\"栈桥\"},\r\n        {\"title\":\"八大关\"},\r\n        {\"title\":\"青岛海底世界\"},\r\n        {\"title\":\"崂山\"},\r\n        {\"title\":\"石老人\"}\r\n    ],\r\n    [\r\n        {\"title\":\"栈桥\"},\r\n        {\"title\":\"海军博物馆\"},\r\n        {\"title\":\"五四广场\"},\r\n        {\"title\":\"信号山\"},\r\n        {\"title\":\"青岛啤酒博物馆\"}\r\n    ]\r\n]\r\n');
INSERT INTO `list_details` VALUES (13, '大连', '[{\"url\":\"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F79a38bd5-c062-4bf3-92be-9b28ee336f03%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1711549877&t=839bad3cf4d79843e31a18d9ad28cf1f\"}, {\"url\":\"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Fc649a371-570a-46fe-a098-1c688bafad36%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1711549877&t=46fcd1ac71ae4f0b163625231f2042f0\"}, {\"url\":\"https://tr-osdcp.qunarzz.com/tr-osd-tr-manager/img/5d6e84c2e2d0dc4d9393490eaf05316e.jpg\"}]', '大连是中国东北地区的重要城市和滨海度假胜地。著名景点包括星海广场、森林动物园、圣亚海洋世界等。此外，大连的美食文化也是其独特魅力所在，如海鲜、烤鱼、炒蟹等', '[\r\n    [\r\n        {\"title\":\"星海广场\"},\r\n        {\"title\":\"大连老街\"},\r\n        {\"title\":\"虎滩\"},\r\n        {\"title\":\"圣亚海洋世界\"},\r\n        {\"title\":\"大连森林动物园\"}\r\n    ],\r\n    [\r\n        {\"title\":\"大连圣亚\"},\r\n        {\"title\":\"金石滩\"},\r\n        {\"title\":\"大连自然博物馆\"},\r\n        {\"title\":\"旅顺口\"},\r\n        {\"title\":\"星海公园\"}\r\n    ]\r\n]\r\n');
INSERT INTO `list_details` VALUES (14, '厦门', '[{\"url\":\"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F95bb69d1-6b73-459e-a9a5-8e875bd0cd71%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1711549922&t=836ecff9168c13c09c3a6cbb48df42a2\"}, {\"url\":\"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F25eeabdc-ad3a-4cc9-9189-cc3fff267bcb%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1711549922&t=2fc4ec34c28bfd624cba12a1717fa40d\"}, {\"url\":\"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Fe40cc6f5-44a8-48f3-b8e6-cdbf78e2a13c%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1711549922&t=15053ca54e730bea1cfa04b27b1c9c57\"}]', '厦门是中国东南沿海城市，以鼓浪屿和美丽的海滩而闻名。著名景点包括鼓浪屿、南普陀寺、厦门大学等。此外，厦门的美食文化也是其独特魅力所在，如海鲜、沙茶面、花生汤等', '[\r\n    [\r\n        {\"title\":\"鼓浪屿\"},\r\n        {\"title\":\"南普陀寺\"},\r\n        {\"title\":\"曾厝垵\"},\r\n        {\"title\":\"环岛路\"},\r\n        {\"title\":\"厦门大学\"}\r\n    ],\r\n    [\r\n        {\"title\":\"中山路步行街\"},\r\n        {\"title\":\"胡里山炮台\"},\r\n        {\"title\":\"集美学村\"},\r\n        {\"title\":\"厦门海底世界\"},\r\n        {\"title\":\"曾厝垵\"}\r\n    ]\r\n]\r\n');
INSERT INTO `list_details` VALUES (15, '哈尔滨', '[{\"url\":\"https://img1.baidu.com/it/u=1503861621,545834068&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500\"}, {\"url\":\"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Fce04fc27-ac44-4439-b183-c3b41536a171%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1711549999&t=3e8dac704e37265079d61b0461fe1a3c\"}, {\"url\":\"https://t11.baidu.com/it/u=3348789702,219074556&fm=30&app=106&f=JPEG?w=640&h=1138&s=90F17184C41799DE2CC7911D0300109A\"}]', '哈尔滨是中国东北地区的重要城市，以冰雪和欧式建筑而闻名。著名景点包括中央大街、索菲亚教堂、哈尔滨冰雪大世界等。此外，哈尔滨的美食文化也是其独特魅力所在，如锅包肉、酸菜鱼、烤肉等。', '[\r\n    [\r\n        {\"title\":\"中央大街\"},\r\n        {\"title\":\"索菲亚教堂\"},\r\n        {\"title\":\"太阳岛\"},\r\n        {\"title\":\"哈尔滨冰雪大世界\"},\r\n        {\"title\":\"松花江\"}\r\n    ],\r\n    [\r\n        {\"title\":\"冰雪大世界\"},\r\n        {\"title\":\"松花江畔\"},\r\n        {\"title\":\"圣索菲亚大教堂\"},\r\n        {\"title\":\"太阳岛\"},\r\n        {\"title\":\"哈尔滨市区\"}\r\n    ]\r\n]\r\n');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `born` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出生日期',
  `eduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历',
  `tall` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高',
  `user_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `textareaHobby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '哪儿玩描述',
  `myTextarea` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关于我',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('root', 4, '$2a$10$hBYZkvsLzo1xSZw6EfSlc.LQaXC0klOe44oa1vqn/Dgp70ti/vNn6', 'root', '男', '2024-03-14', '大学', '175cm', '{\"size\":53185,\"type\":\"image\",\"url\":\"http://tmp/leZjPdhvdQnOfda3837f8fe55c96663e5e4b51c94494.png\",\"thumb\":\"http://tmp/leZjPdhvdQnOfda3837f8fe55c96663e5e4b51c94494.png\",\"status\":\"success\",\"message\":\"上传成功！\"}', '重庆', '我是一个非常喜欢旅游的人！！');
INSERT INTO `user` VALUES ('root1', 5, '$2a$10$XyHEBuJbntpA.qJ/HzliuuMZJIRKsEc3u.Z.4GvxJEqmVTbPt8d/i', 'root1', '男', '2024-03-16', '大学', NULL, '{\"size\":21863,\"type\":\"image\",\"url\":\"http://tmp/WMgonQeVgzLm27e729e0396a4da64f358e75e87fc69c.png\",\"thumb\":\"http://tmp/WMgonQeVgzLm27e729e0396a4da64f358e75e87fc69c.png\",\"status\":\"success\",\"message\":\"上传成功！\"}', '重庆', '我是root');

SET FOREIGN_KEY_CHECKS = 1;
