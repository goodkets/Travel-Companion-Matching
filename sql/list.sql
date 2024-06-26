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

 Date: 17/03/2024 09:52:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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

SET FOREIGN_KEY_CHECKS = 1;
