/*
Navicat MySQL Data Transfer

Source Server         : fish
Source Server Version : 50726
Source Host           : 149.129.59.121:3306
Source Database       : mall

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2021-02-22 11:18:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_address
-- ----------------------------
DROP TABLE IF EXISTS `t_address`;
CREATE TABLE `t_address` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `province` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `streets` varchar(255) NOT NULL,
  `village` varchar(255) NOT NULL,
  `detail` varchar(255) NOT NULL,
  `achieve_name` varchar(255) NOT NULL,
  `phone` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_address
-- ----------------------------

-- ----------------------------
-- Table structure for t_goods_info
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_info`;
CREATE TABLE `t_goods_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) NOT NULL,
  `goods_info` text NOT NULL,
  `goods_img` varchar(255) DEFAULT NULL,
  `goods_bigimg` varchar(255) DEFAULT NULL,
  `price` decimal(18,2) NOT NULL,
  `now_price` decimal(18,2) NOT NULL,
  `user_id` int(10) NOT NULL,
  `sort_id` int(10) DEFAULT NULL,
  `sales_volume` int(10) DEFAULT NULL,
  `send_palce` varchar(255) NOT NULL,
  `shop_id` int(10) NOT NULL,
  `is_shop` int(2) NOT NULL DEFAULT '1',
  `shipping` decimal(18,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_goods_info
-- ----------------------------
INSERT INTO `t_goods_info` VALUES ('1', '大同黄花 ', '黄花，学名萱草，俗称金针菜，是一种营养价值很高的蔬菜。嵇康《养生论》神农经上，有“萱草忘忧，乐为食之”的记载，李时珍在《本草纲目》上也有专门论述，说它有利尿、健胃的功能。大同县是山西省黄花的主要产区之一，从明朝开始，就享有“黄花之乡”的盛名。大同的黄花有三大优点：一是颜色鲜黄，干净无霉，一色金光灿烂，绝少黑斑霉货；二是角长肉厚，线条粗壮，肥颀整齐；三是油性大，脆嫩清口，久煮不烂。因此，大同黄花为素食上品，受外商欢迎，成为山西省外贸骨干商品之一', 'http://localhost:3000/public/images/1574317562097.jpeg', 'http://localhost:3000/public/images/1574317562097.jpeg', '399.00', '234234.00', '9', '21', '233', '山西大同', '1', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('2', '浑源黄芪', '　黄芪是一种名贵的中草药，具有补身益气的作用。浑源的黄芪以“条长而顺，皮光色亮，粉性大，空心小”著称，药用价值比一般的黄芪高，被称为“浑芪”。广阔延绵的恒山地区，是有名的“黄芪之乡”。浑源黄芪加工厂，是我国黄芪出口加工的主要工厂之一，每年加工黄芪达一百万斤。这些黄芪远销五大洲七十多个国家和地区，为国家换回大量外汇。 受上天与自然的宠爱，在浑源1966平方公里的土地上，蕴藏着厚实的自然资源禀赋，中药材黄芪就是其中之一。', 'http://localhost:3000/public/images/1574326232032.jpeg', 'http://localhost:3000/public/images/1574326232032.jpeg', '399.00', '243.00', '9', '48', '243', '山西大同', '1', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('3', '左云苦荞 ', '　苦荞集七大营养素于一身，不是药，不是保健品，是能当饭吃的食品，却有着卓越的营养保健价值和非凡的食疗功效。它与人们所熟悉的“何首乌、大黄”等是亲兄弟，是国际粮农组织公认的优秀粮药兼用粮种，是我国药食同源文化的典型体现。苦荞被誉为“五谷之王”，是三降食品（降血压，降血糖，降血脂）。多出产于高寒山区。', 'http://localhost:3000/public/images/1574326265934.jpeg', 'http://localhost:3000/public/images/1574326265934.jpeg', '399.00', '32.00', '9', '49', '32', '山西大同', '1', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('4', '广灵大尾羊羊肉 ', '广灵大尾羊羊肉是山西大同广灵县的特产。广灵大尾羊历史悠久，据传在汉朝时期，从蒙古引入，由于时代的变迁，经济贸易的相互来往，人们将终年以放牧为主的蒙古羊，由草原区引入农区。长期以来，在当地自然条件、生态环境的影响下，以及农民群众的精心饲养管理和选育，长期闭锁繁育。在体形外貌和生产性能方面趋于一致，逐渐形成了具有生长发育快，育肥效果好，产肉力高，肉质鲜嫩，皮毛品质好，被毛呈毛股结构，干死毛极少，耐粗饲，抗寒性能强，', 'http://localhost:3000/public/images/1574326279852.jpeg', 'http://localhost:3000/public/images/1574326279852.jpeg', '399.00', '235.00', '9', '50', '235', '山西大同', '1', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('5', '广灵大尾羊 ', ' 广灵大尾羊，是山西省绵羊优良品种，是以产肉为主，产皮毛为辅的兼用型羊种。它增长速度快，育肥效果好，肉质鲜嫩，皮毛品质好。成年羊，体高62厘米以上，体重50公斤左右，尾长18－21厘米，尾宽19－22厘米，尾厚5.5－7.9厘米。大尾羊一般是11个月后即可屠宰。曾经试宰9只羊，每只羊饲养13.5个月，平均活重66公斤，屠宰后胴体重38.42公斤', 'http://localhost:3000/public/images/1574326293085.jpeg', 'http://localhost:3000/public/images/1574326293085.jpeg', '399.00', '233.00', '9', '51', '233', '山西大同', '1', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('6', '广灵小米 ', '广灵小米，驰名已久，清康熙时曾经作为朝廷贡米晋京，遂有“御米”之称。1961年又改进培育出新品种“东方亮”，更是米中佳品。这种小米，颗粒光洁，色泽金黄，营养丰富。做米饭，熬稀粥，都是粘而滑润，香甜可口。化验测定：广灵小米含有碳水化合物76.1%，蛋白质9.7%，脂肪1.7%，粗纤维0.1%，灰粉1.4%。所含多种微量元素有钙、磷、铁、胡萝卜素、硫胶素、核黄素、尼克酸等;还有维生素B13与维生素B15', 'http://localhost:3000/public/images/1574326314478.jpeg', 'http://localhost:3000/public/images/1574326314478.jpeg', '399.00', '122.00', '10', '52', '122', '山西大同', '2', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('7', '天镇唐杏 ', '地域范围天镇唐杏生产特定区域位于天镇县西部平川区，距县治西南6公里，以东沙河村为主的南河堡全乡范围，地理位置在东经114°02′12″-114°02′53″，北纬40°22′22″-40°23′01″，海拔1021-1033米，生产面积666.7公顷，年生产总量300万公斤。自然生态环境和人文历史因素（1）土壤地貌情况：产地土壤类型为中壤耕种灌於栗褐土性土，', 'http://localhost:3000/public/images/1574326333927.jpeg', 'http://localhost:3000/public/images/1574326333927.jpeg', '399.00', '134.00', '10', '53', '134', '山西大同', '2', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('8', '阳高长城羊肉 ', '阳高长城羊肉为国家农产品地理标志保护产品。人们常说，到阳高县不吃长城乡羊肉是一大憾事。的确，长城乡色如玫瑰的羊肉香嫩可口，白如美玉的凉拌羊肚丝鲜美爽口，做法各异的羊杂鲜而不膻，让人印象深刻。阳高县长城乡大力发展规模养羊产业，因地制宜创新以土地使用权抵押贷款发展养殖业新模式，走出一条农民脱贫致富的新路子。', 'http://localhost:3000/public/images/1574326344319.jpeg', 'http://localhost:3000/public/images/1574326344319.jpeg', '399.00', '134.00', '10', '54', '134', '山西大同', '2', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('9', '大同小明绿豆 ', '大同小明绿豆主产区在大同县，种植历史悠久、面积大，是该县传统的名优特产和出口的拳头产品。该县的小明绿豆颗粒饱满，色泽深绿，发芽率和营养价值高，经测定，蛋白质含量25.6%，脂态含量0.7%，此外还有VA、VD等多种成分，绿豆芽百克VC含量为6毫克，是茄子的2倍。小明绿豆具有较高的药用价值，可消肿下气，清热解毒、利小便、止渴消暑', 'http://localhost:3000/public/images/1574326359209.jpeg', 'http://localhost:3000/public/images/1574326359209.jpeg', '399.00', '177.00', '10', '55', '177', '山西大同', '2', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('10', '广灵画眉驴 ', '广灵画眉驴是全国优种驴之一。画眉驴属大型驴。广灵画眉驴为中国四大名驴之一，以其体型高大、骨骼粗壮，耐粗饲，能挽善驮，及外貌“五白一黑”为特征闻名全国，被列为国家第一批畜禽遗传资源保种和保护区名录。肉性温，具有补气养血、益精壮阳、滋补补肾、利肺作用，尤其对止烦、安神清脑有独到效果，用驴骨熬汤可治多年消渴（即糖尿病）。', 'http://localhost:3000/public/images/1574326372877.jpeg', 'http://localhost:3000/public/images/1574326372877.jpeg', '399.00', '177.00', '10', '56', '177', '山西大同', '2', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('11', '抿八股儿', '晋北地区的名吃，磨成泥的土豆和莜面加水混合（为了筋道也可加少许淀粉），把面糊铲到抿床子上，右手拿着抿子挤压，抿出一截截儿抿八股儿，煮约一分钟，捞出，根据个人喜好，配制调料(盐葱花椒辣椒香菜，还有栽栽面花儿或哨子，就着酸咸菜吃，口感爽滑，易于消化。', 'https://tse1-mm.cn.bing.net/th?id=OIP.f5F14GvffzDE99iKPcvjUwHaFN&w=150&h=107&c=8&rs=1&qlt=90&pid=3.1&rm=2', 'https://tse1-mm.cn.bing.net/th?id=OIP.f5F14GvffzDE99iKPcvjUwHaFN&w=150&h=107&c=8&rs=1&qlt=90&pid=3.1&rm=2', '399.00', '177.00', '10', '57', '177', '山西大同', '2', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('12', '大同扒肉条', '也叫小烧肉。只是在烧法上，前者为大块烧，后者为小条烧，故称。烧肉源于民间，古已有之，特别是大同地区与多民族聚居融合，扒肉条是大同人民的最佳菜肴。扒肉条以其色泽红润，酥软可口，肥而不腻，补脑醒神之功能，早就征服了大同人。清代《调鼎集》就载有扣肉，其所记制作方法与小烧肉大同小异。扒肉条不仅显示大同人的饮食习惯，而且尽显晋北人的热情、豪放，以及大块吃肉、大碗喝酒的性格。', 'https://tse1-mm.cn.bing.net/th?id=OIP.f5F14GvffzDE99iKPcvjUwHaFN&w=150&h=107&c=8&rs=1&qlt=90&pid=3.1&rm=2', 'https://tse1-mm.cn.bing.net/th?id=OIP.f5F14GvffzDE99iKPcvjUwHaFN&w=150&h=107&c=8&rs=1&qlt=90&pid=3.1&rm=2', '399.00', '177.00', '11', '58', '177', '山西大同', '3', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('13', '大同酸汤羊肉', '李时珍的《本草纲目》中论述：“羊肉能暖中补虚，补中益气，开胃健身，益肾气，养胆明目，治虚劳寒冷，五劳七伤”。大同羊肉因味香、肉嫩、质鲜、外形美，在全国赫赫有名。肉质量洁净、色泽鲜艳、有红有白、外表美观。这道汤菜就是采用了大同上等羊肉与酸菜熬制而成，易消化，同时有良好的滋补功效。', 'https://tse1-mm.cn.bing.net/th?id=OIP.f5F14GvffzDE99iKPcvjUwHaFN&w=150&h=107&c=8&rs=1&qlt=90&pid=3.1&rm=2', 'https://tse1-mm.cn.bing.net/th?id=OIP.f5F14GvffzDE99iKPcvjUwHaFN&w=150&h=107&c=8&rs=1&qlt=90&pid=3.1&rm=2', '200.00', '177.00', '11', '59', '177', '山西大同', '3', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('14', '大同烤羊排', '大同烤羊排是招待宾客的一道佳肴名菜。烤羊腿是从烤全羊演变而来。相传，生活在中国北方广阔大地上的狩猎和游牧民族，常在篝火旁烘烤整只猎物和整羊进食。人们逐渐发现整羊最好吃的部位是羊后腿，便经常割下羊后腿烘烤。单独烘烤羊后腿不但比烤整羊时间快，而且更加味道鲜美，食用方便，于是烤羊腿逐渐代替了烤整羊。经过长期的发展，在羊腿烘烤过程中逐步增加了各种配料和调味品，使其集形、色、味、鲜于一体，色美、肉香、外焦、内嫩、干酥不腻，“眼未见其物，香味已扑鼻”。', 'https://tse1-mm.cn.bing.net/th?id=OIP.f5F14GvffzDE99iKPcvjUwHaFN&w=150&h=107&c=8&rs=1&qlt=90&pid=3.1&rm=2', 'https://tse1-mm.cn.bing.net/th?id=OIP.f5F14GvffzDE99iKPcvjUwHaFN&w=150&h=107&c=8&rs=1&qlt=90&pid=3.1&rm=2', '199.00', '177.00', '11', '60', '177', '山西大同', '3', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('15', '大同张氏折纸', '大同张氏折纸艺术是山西省非物质文化遗产保护项目，是张氏家族超过百年历史的家族传承民间手工技艺，属于民间美术类别。\r\n　　　　张氏折纸艺术的主要特征为纯手工折叠，所有作品不剪不粘,一双手,一张纸,一折到底,靠的是真功夫. 不管多复杂多逼真的作品拆开后仍然是一张完整的纸张，周边没有裁剪粘贴的痕迹。包含于张氏折纸艺术中纸雕作品富含民间气息，它依然秉承了不剪不粘的本质，承前启后，创新中求发展，辨证地吸收了刻纸技法，折叠步骤完成后，在作品上雕刻出花纹图案，使作品更有艺术表现力和感染力。', 'https://tse1-mm.cn.bing.net/th?id=OIP.f5F14GvffzDE99iKPcvjUwHaFN&w=150&h=107&c=8&rs=1&qlt=90&pid=3.1&rm=2', 'https://tse1-mm.cn.bing.net/th?id=OIP.f5F14GvffzDE99iKPcvjUwHaFN&w=150&h=107&c=8&rs=1&qlt=90&pid=3.1&rm=2', '222.00', '133.00', '11', '61', '133', '山西大同', '3', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('16', '大同煤雕', '　煤雕是我国独一无二的工艺美术品，产于大同。大同煤雕以大同煤层深处树化石为原料，精心磨制而成。作品纹理清晰，石质细腻，真正赋予了煤艺术生命。煤雕作品早在我国东汉时期即有记载。\r\n　　一块块被丢弃的煤矸石，经山西大同民间艺人施玉平精雕细刻后，成了栩栩如生的艺术', 'http://h.bytravel.cn/shop/head/19953.gif', 'http://h.bytravel.cn/shop/head/19953.gif', '355.00', '211.00', '11', '62', '211', '山西大同', '3', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('17', '野生沙棘', '　　地方特产，俗称酸溜溜，是一种多年生野生落叶灌木。果实呈椭圆形，成熟后为橙黄色或红色，味酸可口。每到农历九月，在百草枯槁的百里煤田上，惟独沙棘生长茂盛，果实累累，像一串串红色珍珠，在山坡丘陵上到处可见。城内大街小巷沿街叫卖，儿童一边咂嘴一边吸食，酸中带甜的果汁余味无穷，沙棘含糖20%，含有多种维生素和胡萝卜素以及氨基酸等营养物质。近年来开发出多种饮料、食品，无菌无毒，甜酸味美，清暑解渴，沁人心脾。', 'http://h.bytravel.cn/shop/head/13215.gif', 'http://h.bytravel.cn/shop/head/13215.gif', '123.00', '23.00', '11', '63', '23', '山西大同', '3', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('18', '仿古花瓶挂壁', '阳高县工艺美术厂以天然石粉和树脂为原料，经浇铸，烘烤等工序，生产几十种“人造石”的仿古花瓶，壁挂和人体造型台灯等工艺品。曾在92年荣获山西省优质产品金奖，在北京举办的博览会上荣获银质奖。产品造型新颖，工艺考究，坚固奈用，价格便宜，使用于室内摆设，还可做奖品，纪念品。应客户要求，还可以进行特殊加工生产。现北京，天津，石家庄，西安，太原，郑州，南京，呼和浩特等大中城市，还销往国外。欢迎选购定货，洽谈业务。', 'http://h.bytravel.cn/shop/head/13214.gif', 'http://h.bytravel.cn/shop/head/13214.gif', '35.00', '17.00', '9', '64', '17', '山西大同', '1', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('19', '三黄二白', '\"三黄二白\"是山西省大同的名产，即是：浑源的黄芪，大同的黄花，天镇的\"里外黄\"山药蛋，以及广灵的白麻、阳高的圆白菜。', 'http://h.bytravel.cn/shop/head/13213.gif', 'http://h.bytravel.cn/shop/head/13213.gif', '68.00', '23.00', '12', '65', '23', '山西大同', '4', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('20', '大同油糕', '　把黍子碾成黄米，再把黄米磨成面，即成黄米面，由黄米面做成的黄米糕具有“黄、软、筋、香”四大特点，吃的方法有两种，一是“素糕”，二是“油炸糕”。', 'http://h.bytravel.cn/shop/head/13211.gif', 'http://h.bytravel.cn/shop/head/13211.gif', '399.00', '177.00', '12', '66', '177', '山西大同', '4', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('21', '山西刀削面', '刀削面是山西人民日常喜食的面食，因其风味独特，驰名中外。刀削面全凭刀削，因此得名。用刀削出的面叶，中厚边薄。棱锋分明，形似柳叶；入口外滑内筋，软而不粘，越嚼越香，深受喜食面食者欢迎。它同北京的打卤面、山东的伊府面、河南的鱼焙面、四川的担担面，同称为五大面食名品，享有盛誉。', 'http://h.bytravel.cn/shop/head/13178.gif', 'http://h.bytravel.cn/shop/head/13178.gif', '399.00', '177.00', '12', '67', '177', '山西大同', '4', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('22', '下韩砂锅', '浑源县下韩村生产砂锅，相传开始于明代。清道光十五年（1835年），河东道总督粟毓美，曾把此物带入朝内，得到道光皇帝的赞赏。从此，下韩砂锅驰名东北、河北、陕西、内蒙古一带。\r\n　　 下韩砂锅的特点是：耐火、耐碰撞、酸碱不腐蚀、里外光滑、色泽优美，既可做饭，也可用来煎中药。现在能生产砂火锅、焖肉罐、砂酒壶、砂小罐、药壶等十多个品种。在色泽上，也由过去单纯的灰褐色，发展到现在的豆绿、乳白、茶色等多种颜色。', 'http://h.bytravel.cn/shop/head/8063.gif', 'http://h.bytravel.cn/shop/head/8063.gif', '399.00', '177.00', '12', '68', '177', '山西大同', '4', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('23', '莜面考老老', '莜面考老老是大同、雁北一带人民群众喜欢吃的风味食品。考老老用莜麦蒸制而成，配以羊肉梢子，加上各种作料，香味浓长，耐消化。这与大同雁北一带盛产莜麦面有很大关系。( 大同)', 'http://h.bytravel.cn/shop/head/7660.gif', 'http://h.bytravel.cn/shop/head/7660.gif', '233.00', '177.00', '12', '69', '177', '山西大同', '4', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('24', '大同烧麦', ' 烧麦，宴席主食，有时称稍梅。因出笼时状为梅朵而得名。边口雪白，中间可透过皮看到里边的肉馅。吃一口一嘴油，细嚼一团肉。据说正德皇帝到大同看中饭铺的李凤姐，曾经在此过夜，一夜皇后\"\"梅龙镇\"等闹剧，据说不必考证，但大同烧麦闻名四海是当之无愧的。( 大同)', 'http://h.bytravel.cn/shop/head/7457.gif', 'http://h.bytravel.cn/shop/head/7457.gif', '399.00', '177.00', '12', '70', '177', '山西大同', '4', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('25', '大同油炸糕', '把黍子碾成黄米，再把黄米磨成面，即成黄米面，由黄米面做成的黄米糕具有“黄、软、筋、香”四大特点，吃的方法有两种，一是“素糕”，二是“油炸糕”', 'http://h.bytravel.cn/shop/head/7456.gif', 'http://h.bytravel.cn/shop/head/7456.gif', '399.00', '177.00', '12', '71', '177', '山西大同', '4', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('26', '风味凉粉', '　大同地区盛产山药，当地人除直接食用外，还有加工制成粉面的习惯。由此，粉面又制，各种食品，最常见的便是粉条和凉粉了。到了夏季，凉粉便成为家家户户的消暑佳肴。　　大同凉粉一年四季都有，风味独特，主要用盐汤、酱油、辣椒油、醋、香油、味精、芥末、葱花进行调味，配以黄瓜丝、萝卜丝、香菜、豆腐干等，吃起来清凉可口，其味具佳。( 大同)', 'http://h.bytravel.cn/shop/head/7455.gif', 'http://h.bytravel.cn/shop/head/7455.gif', '399.00', '177.00', '13', '72', '177', '山西大同', '5', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('27', '下韩砂器', '下韩砂器是用天然石矸为主料制成的正北砂器，清代曾作为贡品奉献金銮殿，从此名扬天下。其特点是预热慢，散热慢。煮其饭味道纯正，香甜可口；炖其肉汤质鲜美，肉香四溢；煎其药不温不火，药性俱存。目前开发的产品主要有砂锅、砂罐、砂壶、砂铞、砂瓢、砂火锅、焖肉罐等。( 大同)', 'http://localhost:3000/public/images/1574326265934.jpeg', 'http://localhost:3000/public/images/1574326265934.jpeg', '399.00', '177.00', '13', '73', '177', '山西大同', '5', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('28', '云岗啤酒', '云岗啤酒是大同市的地方名产，产于大同市酒厂。1987年云岗啤酒、特制云岗啤酒双双被评为山西省优质产品，并畅销北京、河北、陕西、内蒙等省、市、自治区。　　大同是著名的历史名城。在秦代为全国36郡之一的“云中郡”，北魏曾建都于此，后改称大同府。《山西通志》中载有“大同府风', 'http://h.bytravel.cn/shop/head/7385.gif', 'http://h.bytravel.cn/shop/head/7385.gif', '399.00', '177.00', '13', '74', '177', '山西大同', '5', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('29', '大同煤炭', '大同地区煤炭资源丰富，分布范围广泛，开采历史悠久，国内国外驰名，素有“煤都”之称。根据专家测定，几百万年之前，大同地区原属一片碧绿湖水，专家称之为“大同湖”。当时，大同湖畔，气候炎热，森林茂盛，蕨草丛生，野牛、野马、古象、披毛犀、大角鹿等动物成群追逐，剑齿虎、四不像、多刺鱼、丽蚌、蚬、螺等动物在湖泊、泥湾中游弋栖息。后来，由于印支运动后期的坳陷盆地和燕山、喜马拉雅山运动的影响，地壳经过剧烈变动，这些动植物生长层均被掩埋在地下，经过长年积压便成为煤炭。', 'http://localhost:3000/public/images/1574326293085.jpeg', 'http://localhost:3000/public/images/1574326293085.jpeg', '399.00', '177.00', '13', '75', '177', '山西大同', '5', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('30', '云冈绢人', '建国后，“泥娃娃”已被淘汰，而“布娃娃”却越来越精致，不少妇文言欢在缝布娃娃上下功夫，以此来表现自己心灵手巧。大同市绢人艺术家康巧玲多才多艺，在缝布娃娃的基础上，将戏剧人物的脸谱用服饰、身段以及云冈石窟、华严寺各种佛像、伎乐飞天以及戏剧人物的艺术造型用绢人表现出来。她所制作的绢人采用绫、罗、绸、缎、纱、绢、锦等布料制成的，颇有地方特色，被广大群众誉以“云冈绢人”的美称。', 'http://h.bytravel.cn/shop/head/3504.gif', 'http://h.bytravel.cn/shop/head/3504.gif', '399.00', '177.00', '13', '21', '177', '山西大同', '5', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('31', '斗山杏仁', ' 广灵斗山杏仁，被称为山西特产三大宝之一(山西特产三大宝：杏仁、核桃、大红枣)。广灵土地史有刮金板之称，杏仁久赋盛名，其优于一般杏仁的原因在于，广灵地处于太行山北端，衡山东麓，北纬39度线上（俗称杏果生长黄金线），再加上广灵斗山海拔2000米以上，温差大，阳光照射充足，更有：广灵斗山脚下、壶流河畔，微量元素含量较高，受到有关专家的一致好评。综上所述，广灵斗山被称为杏仁生长的黄金点', 'http://h.bytravel.cn/shop/head1s/25256.gif', 'http://h.bytravel.cn/shop/head1s/25256.gif', '399.00', '177.00', '13', '48', '177', '山西大同', '5', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('32', '天镇胡麻油', '　天镇胡麻油胡麻油，就是采用土法或榨油机压榨胡麻籽粒迫使流淌出来的黄色半透明液体亚麻按用途不同可分为油用亚麻、纤维用亚麻和兼用亚麻三种，同属亚麻科，一年生草本。胡麻籽粒呈扁孵圆形，暗褐色，有光泽，可榨油。胡麻油可炒菜，煎食品，也可供制油漆、油墨、肥皂等。山西省大同市天镇县贾家屯乡、米薪关镇、赵家沟乡、', 'http://h.bytravel.cn/shop/head3s/45891.gif', 'http://h.bytravel.cn/shop/head3s/45891.gif', '399.00', '177.00', '13', '49', '177', '山西大同', '5', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('33', '恒山黄芪', '产于山西浑源恒山。 　　恒山黄芪被誉为“黄芪王”，其条匀顺直，皮光纤细，色泽黄亮，粉性大，空心小，为中国北芪之正宗。 　　恒山黄芪富含蔗糖、葡萄糖、淀粉、粘液质、叶酸、甜茶碱、胆碱、树胶、纤维素以及多种氨基酸。', 'http://h.bytravel.cn/shop/heads/2547.gif', 'http://h.bytravel.cn/shop/heads/2547.gif', '399.00', '177.00', '9', '50', '177', '山西大同', '1', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('34', '浑源烧酒', '酒是用高粱、大麦、豌豆、米、葡萄或其他水果发酵制成的饮料。因其酿造、勾兑程序不同，酒又分为三大类，即不蒸馏酒、蒸馏酒、配制酒，浑源烧酒属蒸馏酒类。所谓蒸馏酒，就是发酵的酒液经过蒸锅器蒸馏，贮存、稀释、勾兑等工序后配制而成的酒，亦称烧酒。 由于特殊的地理位置，特殊的人群结构，再加上浑源盛产高粱、豌豆、麦类和米，因此浑源酿酒的历史，可以追溯到春秋战国时期。春秋', 'http://h.bytravel.cn/shop/head2s/36927.gif', 'http://h.bytravel.cn/shop/head2s/36927.gif', '399.00', '177.00', '14', '51', '177', '山西大同', '6', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('35', '天镇豆腐皮', '豆腐皮系天镇县城的传统名产。天镇城的豆腐皮，薄如纸张，筋似皮条，色美味香，价廉物美。用豆腐皮做的各种冷、热、荤、素菜，其味道之香，真是名不虚传。天镇城豆腐皮的味道之所以香甜可口，与它的制作过程有关。', 'http://h.bytravel.cn/shop/heads/13184.gif', 'http://h.bytravel.cn/shop/heads/13184.gif', '50.00', '177.00', '14', '52', '177', '山西大同', '6', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('36', '蒿籽面', '“蒿籽面、高粱面、豌豆面”的吆喝声充斥在小城的街巷里，那“面”字儿的尾音逐渐挑得很高，也拉得很长，非常有特色。寻着声音看到了一位胡子和脸被面粉扑成灰白色的卖面人，他是我的朋友老郑。', 'http://h.bytravel.cn/shop/head2s/37764.gif', 'http://h.bytravel.cn/shop/head2s/37764.gif', '123.00', '100.00', '14', '53', '100', '山西大同', '6', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('37', '北芪菇', '北芪菇“北芪菇”是根据传统中医药“药食同源”的理论，利用北岳恒山正宗黄芪（又称北芪）和多种中草药及农作物副产品作培养料，经科学配方和特殊工艺培育而成的新型菌类产品。故命名“北芪菇”。为药食同用的功能型产品。', 'http://h.bytravel.cn/shop/head2s/30233.gif', 'http://h.bytravel.cn/shop/head2s/30233.gif', '33.00', '222.00', '14', '54', '222', '山西大同', '6', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('38', '	\r\n晋北地皮菜灌饼', '晋北地区盛产地皮菜，又名地耳、地衣、地木耳，是天然绿色食品。地皮菜含蛋白质为13%-18%、糖类4-6%、无机盐13-15%、粗纤维1-4%。此外，还含有多种维生素和磷、锌、钙等矿物质。此菜香脆可口、颜色鲜艳，又是一道健康食品，极受大众欢迎', 'http://h.bytravel.cn/shop/head3s/46427.gif', 'http://h.bytravel.cn/shop/head3s/46427.gif', '30.00', '100.00', '14', '55', '100', '山西大同', '6', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('39', '山西黑猪', '山西黑猪培育于山西大同、忻州等地区。主要是用巴克夏猪、内-和山西本地猪种培育而成。现有种猪近万头，分布于太谷、合本同、析州、原平、五台等市、县。山西黑猪与长白猪和大约克夏猪杂交效果较好。', 'http://h.bytravel.cn/0.gif', 'http://h.bytravel.cn/0.gif', '30.00', '233.00', '14', '57', '233', '山西大同', '6', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('40', '大同苦菜', '苣萍,亦名甜草菜,《本草纲目》称之为败酱草。因为生长在山沟野外,不受化肥和农药污染,苦菜自然是一种天然的绿色食物。在晋北广大的乡村,人们对苦菜是崇敬的。不要说“男人出口外,女人挑苦菜”的年代,即便在今天,苦菜仍是深受人们喜爱的野菜。', 'http://h.bytravel.cn/shop/head2s/39579.gif', 'http://h.bytravel.cn/shop/head2s/39579.gif', '99.00', '1000.00', '14', '58', '1000', '山西大同', '6', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('41', '巨乐哈密杏', '大同县巨乐乡位于大同市东北端，晋、冀、蒙交界处，地理气候独特，交通便捷，历史上素有“花果乡”之称，所产哈蜜杏品质以其汁多、汁浓、汁甜、口感滑爽、外形圆光、色泽可口、营养价值丰富为特征，享誉塞北，近年产品远销国内，国际市场', 'http://h.bytravel.cn/shop/head2s/39577.gif', 'http://h.bytravel.cn/shop/head2s/39577.gif', '45.00', '234.00', '14', '56', '234', '山西大同', '6', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('42', '大白登陈醋', '　大白登镇闻名，还因其水源丰富,水质好,陈醋酿造历史悠久，味道鲜美、独特有关。相传闻名全国的清徐老陈醋起源于白登醋，如今以晋溢泉醋业有限公司为龙头的酿造制醋业有10多家，从制曲、酿造、熏制、陈酿、包装形成一条龙生产，有待于上档次、精包装、扩市场、闯名牌，真正成为大白登的地方特色产品和一大支柱产', 'http://h.bytravel.cn/shop/head2s/37776.gif', 'http://h.bytravel.cn/shop/head2s/37776.gif', '113.00', '113.00', '9', null, null, '山西大同', '1', '1', '21.00');
INSERT INTO `t_goods_info` VALUES ('43', '罗文皂圆白菜', '阳高罗文皂的圆白菜，生长在这一带盐碱滩上。这里的水性和土质，使圆白菜别具一格而驰名中外。它的特点是：裹得紧，份量重，筋少，质白，含水份少，耐压，耐腐烂，切开后，久置而不生刀锈，吃起来仍甘美可口，没有辣味。罗文皂圆白菜的这些特点，虽经长途运输和炎热天气，质量不变，始终能保持色鲜味美。', 'http://h.bytravel.cn/shop/head2s/37774.gif', 'http://h.bytravel.cn/shop/head2s/37774.gif', '1231.00', '1231.00', '9', '54', null, '山西大同', '1', '1', '13.00');
INSERT INTO `t_goods_info` VALUES ('44', '	\r\n阳高涮羊肉', '涮羊肉有四大特点：味香、肉嫩、质鲜、外形美观。阳高的涮羊肉，选料非常讲究，以长城乡羊肉为最佳(因长城乡地理位置独特，在这里饲养的羊，吃的是中草药，喝的是矿泉水，呼吸的是无污染的空气，因此羊肉特别鲜美，是真正的绿色食品', 'http://h.bytravel.cn/shop/head2s/37773.gif', 'http://h.bytravel.cn/shop/head2s/37773.gif', '12313124.00', '12313124.00', '9', '53', null, '山西大同', '1', '1', '1313.00');
INSERT INTO `t_goods_info` VALUES ('45', '阳高羊杂汤', '阳高人吃羊杂汤的历史由来已久，最早可以追溯到春秋战国时期。那时，阳高一带为林胡、楼烦等少数民族所占据，他们以放牧、射猎为生。公元前3世纪，赵武灵王用武力开拓疆土，建置云中、雁门、代郡以后，才将中原地区的农业生产传到这里。', 'http://h.bytravel.cn/shop/head2s/37771.gif', 'http://h.bytravel.cn/shop/head2s/37771.gif', '123.00', '123.00', '9', '54', null, '山西大同', '1', '1', '123.00');
INSERT INTO `t_goods_info` VALUES ('46', '拌汤糊糊', '　拌汤和糊糊皆是只用面、不下米而做成的稀饭。将面搅拌成块状碎块拨入水锅中熬成者皆名曰“拌汤”。“拌汤”中最佳者为“白面鸡蛋拦汤”。', 'http://h.bytravel.cn/shop/heads/13188.gif', 'http://h.bytravel.cn/shop/heads/13188.gif', '123.00', '123.00', '9', '54', null, '山西大同', '1', '1', '12.00');
INSERT INTO `t_goods_info` VALUES ('47', '和子饭', '凡用小米并加入适量的各种面而混合熬成之饭统名之曰“和子饭”。通常人们所说的“和子饭”即指莜面和子饭，此外还有：豆面、荞面、白面和子饭以及熟豆面糊糊共五种。甲、“莜面和子饭”：', 'http://h.bytravel.cn/shop/heads/13187.gif', 'http://h.bytravel.cn/shop/heads/13187.gif', '1231.00', '1231.00', '9', '54', null, '山西大同', '1', '1', '13.00');
INSERT INTO `t_goods_info` VALUES ('48', '	\r\n“黑龙王”豆腐干', '天镇豆腐干，制作历史悠久，是用传统的工艺精制而成。且选料精细，用上等的黄豆为原料，黄豆颗粒饱满，无疵瑕，磨出的豆浆、豆汁洁白鲜嫩。在制作豆腐干时，将制成的豆腐盛在木制模器内模压挤掉水分以后，再将模压品按豆腐干、豆腐筋所需大小切成块，然后在阳光下晾晒，晒成半韧，用水冲净再放到锅里煮。', 'http://h.bytravel.cn/shop/heads/13185.gif', 'http://h.bytravel.cn/shop/heads/13185.gif', '123.00', '123.00', '9', '59', null, '山西大同', '1', '1', '13.00');
INSERT INTO `t_goods_info` VALUES ('49', '红焖兔头', '大同市帅府街是著名的兔头一条街，马路一侧“胖胖来”、“老六”、“帅府”等兔头店食客如云。烧兔头，这是大同当地人较爱吃的一种食物，把兔子的脑袋用姜葱辣椒八角等十余种香料加以红焖，熬的时间至少得三小时以上，直至香料的味浸透到软烂软烂的兔肉里，属典型的北方菜式，口味比较重，味道不错。', 'http://h.bytravel.cn/shop/heads/13180.gif', 'http://h.bytravel.cn/shop/heads/13180.gif', '123.00', '123.00', '9', '58', null, '山西大同', '1', '1', '412.00');
INSERT INTO `t_goods_info` VALUES ('50', '大同铜器', '大同铜器历史悠久，工艺精湛，造型美观，久负盛名。历史上有“五台山上拜佛，大同城内买铜”之说。大同铜器已有25大系列，235个品种，458个花色，主要有铜火锅、酒具、宫廷餐具、铜牌匾等。大同铜器不仅在国内各地受欢迎，而且还畅销于日本、马来西亚、德国以及港澳地区。', 'http://h.bytravel.cn/shop/heads/13177.gif', 'http://h.bytravel.cn/shop/heads/13177.gif', '1234.00', '1234.00', '9', '54', null, '山西大同', '1', '1', '14.00');
INSERT INTO `t_goods_info` VALUES ('51', '新荣莜面', '山西省大同新荣莜面学名燕麦，禾本科，燕麦属。莜面是莜麦经过淘洗、晒凉、炒熟，磨制而成的。莜面的吃法很多，有推窝窝、搓个卷、推创渣、搓鱼儿等等。可热吃，可凉拌。热吃加羊肉臊子、蘑菇豆腐汤，香味扑鼻，美不可言；冷拌用烧茄子、黄瓜丝，再配以炝辣椒油，红绿相间，清香可口', 'http://h.bytravel.cn/shop/heads/13174.gif', 'http://h.bytravel.cn/shop/heads/13174.gif', '456.00', '456.00', '9', '58', null, '山西大同', '1', '1', '456.00');
INSERT INTO `t_goods_info` VALUES ('52', '大同铜火锅', '大同的铜器历史悠久，工艺精湛，早在北魏时期，就享有盛名。唐宋以来，大同的铜器已畅销全国。明清时期，大同的铸铜、制铜等工艺品已相当繁盛，当时钟楼院巷街制铜作坊已达数十处，均系子承父业，世代相传，故称“铜匠街”。正如民国大同志稿所述：“大同虽非铜区，而铜制品向颇著称，物美价廉，多运往外蒙古地方', 'http://h.bytravel.cn/shop/heads/7686.gif', 'http://h.bytravel.cn/shop/heads/7686.gif', '456.00', '456.00', '9', '54', null, '山西大同', '1', '1', '456.00');
INSERT INTO `t_goods_info` VALUES ('53', '骆驼界莜面', '浑源骆驼界是塞北饭麦的重要产区，其粒籽大皮薄，其粉细腻精白，其味可口浓香，民间俗称骆驼界莜面“男人吃了力量，女人吃了漂亮”。(', 'http://h.bytravel.cn/shop/heads/7393.gif', 'http://h.bytravel.cn/shop/heads/7393.gif', '456.00', '456.00', '9', '54', null, '山西大同', '1', '1', '456.00');
INSERT INTO `t_goods_info` VALUES ('54', '王千庄香火', '王千庄香火历史悠久，源远流长。清代乾隆壬戌年浑源知州桂敬顺编纂的《浑源州志》中对王千庄的香火作了详细记载。至今已有一千多年的历史。该村生产的香火主要有药香、普通香、卫生香、塔香四大系列四十多个品种，其特点是香味纯正，久燃不灭。远销河北、内蒙、西藏等十多个省市自治区，是居家生活、庙宇寺院的首选产品。', 'http://h.bytravel.cn/shop/heads/7391.gif', 'http://h.bytravel.cn/shop/heads/7391.gif', '456.00', '456.00', '9', '53', null, '山西大同', '1', '1', '456.00');
INSERT INTO `t_goods_info` VALUES ('55', '大同艺术瓷', '产于大同煤峪口煤矿陶瓷厂，产品造型别致，设计新颖，品种繁多，尤其是具有民族特点、地方特色的儿童玩具，别具一格，更为诱人。这里生产的陶瓷制品多达 130多种，几百个花色，其中有许多富有民族传统和神话传说色彩的制品', 'http://h.bytravel.cn/shop/heads/7389.gif', 'http://h.bytravel.cn/shop/heads/7389.gif', '7567.00', '7567.00', '9', '55', null, '山西大同', '1', '1', '567.00');
INSERT INTO `t_goods_info` VALUES ('56', '大同蛋雕', '远在明清时期，大同地区民间在喜庆婚娶、祝福庆寿、喜得贵子时，为图吉祥如意，就有了赠送红鸡蛋的习俗。当时在京城一带更是流行此风，而且用量也相当可观。于是就有一部分人摆摊设铺，专门卖红色染过的鸡蛋，称其为“彩蛋”。后来，商贩们又在彩蛋上画些花鸟、鱼虫、脸谱等图案，以图生意兴隆。经过多年演变，彩蛋工艺逐步提高，最后，终于形成了具有较高欣赏价值的艺术珍品。', 'http://h.bytravel.cn/shop/heads/7388.gif', 'http://h.bytravel.cn/shop/heads/7388.gif', '567.00', '567.00', '9', '54', null, '山西大同', '1', '1', '345.00');
INSERT INTO `t_goods_info` VALUES ('57', '龟龄集', '开始叫“老君益寿散”，到了明代中叶，方土及一些著名医学家，将此处方加以增删，改名为“龟龄集”，献给正在普天下广集长生不老药的嘉靖皇帝。嘉靖服用后，果然身轻体健，并在50岁后又连生三子，从此，龟龄集被列为“御用圣药”。当年监制“龟龄集”的医药总管是山西太谷人。他偷偷将处方带回家，自家开炼服用，并作为珍贵的礼品馈赠亲友。后来，此药方辗转传入山西中药厂的前身“广盛药店”，于是，便成了太谷县的独特方剂。', 'http://h.bytravel.cn/shop/heads/7380.gif', 'http://h.bytravel.cn/shop/heads/7380.gif', '23423.00', '23423.00', '9', '59', null, '山西大同', '1', '1', '234242.00');

-- ----------------------------
-- Table structure for t_order_info
-- ----------------------------
DROP TABLE IF EXISTS `t_order_info`;
CREATE TABLE `t_order_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `order_number` bigint(50) NOT NULL,
  `send_place` varchar(255) NOT NULL,
  `achieve_place` varchar(255) NOT NULL,
  `send_id` int(10) NOT NULL,
  `achieve_id` int(10) NOT NULL,
  `price_total` decimal(18,2) NOT NULL,
  `goods_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_order_info
-- ----------------------------
INSERT INTO `t_order_info` VALUES ('1', '1574259207694', '上海', 'hhhhhhhhhhhhhhh', '9', '9', '243.00', '2');
INSERT INTO `t_order_info` VALUES ('2', '1574315711787', '412412', '123123124', '9', '9', '12313124.00', '44');
INSERT INTO `t_order_info` VALUES ('3', '1574316599095', '上海', '1231', '9', '9', '478.00', '2');
INSERT INTO `t_order_info` VALUES ('4', '1574316599099', '上海', '1231', '9', '9', '478.00', '4');
INSERT INTO `t_order_info` VALUES ('5', '1574316599099', '上海', '1231', '9', '9', '478.00', '4');
INSERT INTO `t_order_info` VALUES ('6', '1574316623540', '上海', '', '9', '9', '235.00', '4');
INSERT INTO `t_order_info` VALUES ('7', '1574316623543', '上海', '', '9', '9', '235.00', '4');
INSERT INTO `t_order_info` VALUES ('8', '1574316694884', '上海', '', '9', '9', '478.00', '2');
INSERT INTO `t_order_info` VALUES ('9', '1574316694888', '上海', '', '9', '9', '478.00', '4');
INSERT INTO `t_order_info` VALUES ('10', '1574316694889', '上海', '', '9', '9', '478.00', '4');
INSERT INTO `t_order_info` VALUES ('11', '1574317118837', '上海', '1231', '9', '9', '267.00', '4');
INSERT INTO `t_order_info` VALUES ('12', '1574317118841', '上海', '1231', '9', '9', '267.00', '3');
INSERT INTO `t_order_info` VALUES ('13', '1574317173273', '上海', 'qweq', '9', '9', '478.00', '2');
INSERT INTO `t_order_info` VALUES ('14', '1574317173275', '上海', 'qweq', '9', '9', '478.00', '4');
INSERT INTO `t_order_info` VALUES ('15', '1574317723038', '412412', '', '9', '9', '12313367.00', '2');
INSERT INTO `t_order_info` VALUES ('16', '1574317723041', '412412', '', '9', '9', '12313367.00', '44');
INSERT INTO `t_order_info` VALUES ('17', '1574317747662', '上海', 'wrwe', '9', '9', '12313367.00', '44');
INSERT INTO `t_order_info` VALUES ('18', '1574317747667', '上海', 'wrwe', '9', '9', '12313367.00', '2');
INSERT INTO `t_order_info` VALUES ('19', '1574317784931', '上海', '', '9', '9', '12313367.00', '44');
INSERT INTO `t_order_info` VALUES ('20', '1574317784932', '上海', '', '9', '9', '12313367.00', '2');
INSERT INTO `t_order_info` VALUES ('21', '1574319028085', '12131', '11', '9', '9', '12313490.00', '2');
INSERT INTO `t_order_info` VALUES ('22', '1574319028090', '12131', '11', '9', '9', '12313490.00', '44');
INSERT INTO `t_order_info` VALUES ('23', '1574319028096', '12131', '11', '9', '9', '12313490.00', '45');
INSERT INTO `t_order_info` VALUES ('24', '1574319165917', '上海', '232', '9', '9', '243.00', '2');
INSERT INTO `t_order_info` VALUES ('25', '1574319745850', '12131', '321', '9', '9', '123.00', '45');
INSERT INTO `t_order_info` VALUES ('26', '1574327715915', '上海', 'sdsdg', '11', '16', '211.00', '16');
INSERT INTO `t_order_info` VALUES ('27', '1574327745669', '上海', 'werwrwerw', '9', '16', '243.00', '2');
INSERT INTO `t_order_info` VALUES ('28', '1574328590817', '上海', 'hio', '9', '17', '470.00', '4');
INSERT INTO `t_order_info` VALUES ('29', '1574328590825', '上海', 'hio', '9', '17', '470.00', '4');
INSERT INTO `t_order_info` VALUES ('30', '1574328597747', '上海', 'joil', '9', '17', '235.00', '4');
INSERT INTO `t_order_info` VALUES ('31', '1613811777923', '12131', '', '9', '9', '12313490.00', '2');
INSERT INTO `t_order_info` VALUES ('32', '1613811777928', '12131', '', '9', '9', '12313490.00', '45');
INSERT INTO `t_order_info` VALUES ('33', '1613811777926', '12131', '', '9', '9', '12313490.00', '44');
INSERT INTO `t_order_info` VALUES ('34', '1613812287664', '上海', '', '9', '9', '243.00', '2');
INSERT INTO `t_order_info` VALUES ('35', '1613812602830', '上海', '', '9', '9', '243.00', '2');
INSERT INTO `t_order_info` VALUES ('36', '1613812954973', '上海', '', '9', '9', '243.00', '2');
INSERT INTO `t_order_info` VALUES ('37', '1613813171540', '上海', '', '9', '9', '243.00', '2');
INSERT INTO `t_order_info` VALUES ('38', '1613813213491', '上海', '', '9', '9', '243.00', '2');
INSERT INTO `t_order_info` VALUES ('39', '1613960419034', '上海', '', '13', '9', '177.00', '32');
INSERT INTO `t_order_info` VALUES ('40', '1613960436761', '上海', '111', '13', '9', '12313424.00', '44');
INSERT INTO `t_order_info` VALUES ('41', '1613960436767', '上海', '111', '13', '9', '12313424.00', '45');
INSERT INTO `t_order_info` VALUES ('42', '1613960436770', '上海', '111', '13', '9', '12313424.00', '30');

-- ----------------------------
-- Table structure for t_shop_info
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_info`;
CREATE TABLE `t_shop_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(255) NOT NULL,
  `shop_introduce` varchar(255) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `shop_state` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_shop_info
-- ----------------------------
INSERT INTO `t_shop_info` VALUES ('1', '111的店铺', '暂无', '9', '2');
INSERT INTO `t_shop_info` VALUES ('2', '122312的店铺', '暂无', '10', '2');
INSERT INTO `t_shop_info` VALUES ('3', '333的店铺', '暂无', '11', '2');
INSERT INTO `t_shop_info` VALUES ('4', '444的店铺', '暂无', '12', '2');
INSERT INTO `t_shop_info` VALUES ('5', '444的店铺', '暂无', '13', '2');
INSERT INTO `t_shop_info` VALUES ('6', '666的店铺', '暂无', '14', '2');
INSERT INTO `t_shop_info` VALUES ('7', '777的店铺', '暂无', '15', '2');
INSERT INTO `t_shop_info` VALUES ('8', '888的店铺', '暂无', '16', '2');
INSERT INTO `t_shop_info` VALUES ('9', '999的店铺', '暂无', '17', '2');

-- ----------------------------
-- Table structure for t_shoppingcart_info
-- ----------------------------
DROP TABLE IF EXISTS `t_shoppingcart_info`;
CREATE TABLE `t_shoppingcart_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `goods_id` int(10) NOT NULL,
  `count` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_shoppingcart_info
-- ----------------------------
INSERT INTO `t_shoppingcart_info` VALUES ('7', '16', '16', '1');
INSERT INTO `t_shoppingcart_info` VALUES ('8', '17', '4', '1');
INSERT INTO `t_shoppingcart_info` VALUES ('9', '17', '4', '1');

-- ----------------------------
-- Table structure for t_sort
-- ----------------------------
DROP TABLE IF EXISTS `t_sort`;
CREATE TABLE `t_sort` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sort_name` varchar(255) NOT NULL,
  `user_id` int(10) NOT NULL,
  `is_have_child` int(2) DEFAULT '0',
  `parents_id` int(10) DEFAULT NULL,
  `level` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_sort
-- ----------------------------
INSERT INTO `t_sort` VALUES ('21', '热门推荐', '9', '0', '0', '0');
INSERT INTO `t_sort` VALUES ('48', '优选特产', '9', '0', '0', '0');
INSERT INTO `t_sort` VALUES ('49', '中华老字号', '9', '0', '0', '0');
INSERT INTO `t_sort` VALUES ('50', '肉禽蛋奶', '9', '0', '0', '0');
INSERT INTO `t_sort` VALUES ('51', '休闲小吃', '9', '0', '0', '0');
INSERT INTO `t_sort` VALUES ('52', '各种品类', '9', '0', '0', '0');
INSERT INTO `t_sort` VALUES ('53', '小吃', '9', '0', '21', '1');
INSERT INTO `t_sort` VALUES ('54', '瓜果', '9', '0', '21', '1');
INSERT INTO `t_sort` VALUES ('55', '工具', '9', '0', '21', '1');
INSERT INTO `t_sort` VALUES ('56', '面食', '9', '0', '21', '1');
INSERT INTO `t_sort` VALUES ('57', '干果', '9', '0', '48', '1');
INSERT INTO `t_sort` VALUES ('58', '水产', '9', '0', '48', '1');
INSERT INTO `t_sort` VALUES ('59', '茶叶', '9', '0', '48', '1');
INSERT INTO `t_sort` VALUES ('60', '滋补', '9', '0', '48', '1');
INSERT INTO `t_sort` VALUES ('61', '工艺', '9', '0', '49', '1');
INSERT INTO `t_sort` VALUES ('62', '糕点', '9', '0', '49', '1');
INSERT INTO `t_sort` VALUES ('63', '花生油', '9', '0', '49', '1');
INSERT INTO `t_sort` VALUES ('64', '干菜', '9', '0', '49', '1');
INSERT INTO `t_sort` VALUES ('65', '家禽', '9', '0', '50', '1');
INSERT INTO `t_sort` VALUES ('66', '猪肉', '9', '0', '50', '1');
INSERT INTO `t_sort` VALUES ('67', '蛋类', '9', '0', '50', '1');
INSERT INTO `t_sort` VALUES ('68', '牛肉', '9', '0', '50', '1');
INSERT INTO `t_sort` VALUES ('69', '零食', '9', '0', '51', '1');
INSERT INTO `t_sort` VALUES ('70', '肉干', '9', '0', '51', '1');
INSERT INTO `t_sort` VALUES ('71', '月饼', '9', '0', '51', '1');
INSERT INTO `t_sort` VALUES ('72', '坚果', '9', '0', '51', '1');
INSERT INTO `t_sort` VALUES ('73', '蔬菜礼盒', '9', '0', '52', '1');
INSERT INTO `t_sort` VALUES ('74', '节日礼盒', '9', '0', '52', '1');
INSERT INTO `t_sort` VALUES ('75', '水果组合', '9', '0', '52', '1');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `pass_word` varchar(255) NOT NULL,
  `introduce` varchar(255) DEFAULT NULL,
  `permission` int(2) NOT NULL DEFAULT '0',
  `fans_count` int(10) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('9', '111', '111', '111', '2', null, '11111111111', '111');
INSERT INTO `t_user` VALUES ('10', '122312', '123', '123', '0', null, '22222222222', '123');
INSERT INTO `t_user` VALUES ('11', '333', '333', '333', '0', null, '33333333333', '333');
INSERT INTO `t_user` VALUES ('12', '444', '444', '444', '0', null, '44444444444', '444');
INSERT INTO `t_user` VALUES ('13', '444', '444', '44444', '0', null, '55555555555', '4444');
INSERT INTO `t_user` VALUES ('14', '666', '666', '666', '4', null, '66666666666', '666');
INSERT INTO `t_user` VALUES ('15', '777', '777', '77fgh', '4', null, '77777777777', '7777');
INSERT INTO `t_user` VALUES ('16', '888', '888', 'fdfhfgh', '0', null, '88888888888', '88888');
INSERT INTO `t_user` VALUES ('17', '999', '999', '4546456', '0', null, '99999999999', '9999999');
