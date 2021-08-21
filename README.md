# 火车票售票系统

#### 系统实现了用户会员管理、火车车次管理、火车座位管理、系统公告管理、火车票退票、火车票换乘、换乘查询、直达查询、乘车人管理、订单管理、个人中心管理等。


![输入图片说明](https://images.gitee.com/uploads/images/2021/0821/115359_cc30d497_865419.png "系统首页.png")


![输入图片说明](https://images.gitee.com/uploads/images/2021/0821/115410_c46eeaf6_865419.png "我的订单列表.png")

![输入图片说明](https://images.gitee.com/uploads/images/2021/0821/115426_a17bdd1f_865419.png "座位详情查看.png")

![输入图片说明](https://images.gitee.com/uploads/images/2021/0821/115435_1622e6e4_865419.png "用户注册.png")


![用户-修改个人信息](https://images.gitee.com/uploads/images/2021/0821/115443_6571a25c_865419.png "用户-修改个人信息.png")

![用户添加乘车人](https://images.gitee.com/uploads/images/2021/0821/115452_727c0794_865419.png "用户添加乘车人.png")


![输入图片说明](https://images.gitee.com/uploads/images/2021/0821/115540_9b88ef89_865419.png "用户-管理我的乘车人.png")


![输入图片说明](https://images.gitee.com/uploads/images/2021/0821/115548_f5c66f6e_865419.png "用户订座-选座位.png")

![输入图片说明](https://images.gitee.com/uploads/images/2021/0821/115600_8a551301_865419.png "用户登陆.png")

![输入图片说明](https://images.gitee.com/uploads/images/2021/0821/115609_a583f901_865419.png "换乘查询.png")

![输入图片说明](https://images.gitee.com/uploads/images/2021/0821/115635_ab19eb29_865419.png "管理员-登陆.png")

![输入图片说明](https://images.gitee.com/uploads/images/2021/0821/115643_48b4044a_865419.png "管理员-车次列表.png")


![输入图片说明](https://images.gitee.com/uploads/images/2021/0821/115650_be9426b6_865419.png "管理员-乘车人信息管理.png")


![输入图片说明](https://images.gitee.com/uploads/images/2021/0821/115658_14fe1150_865419.png "管理员-订单管理.png")

![输入图片说明](https://images.gitee.com/uploads/images/2021/0821/115706_b5b2aebb_865419.png "管理员-个人中心.png")

![输入图片说明](https://images.gitee.com/uploads/images/2021/0821/115713_e0ba4a60_865419.png "管理员-公告管理.png")

![输入图片说明](https://images.gitee.com/uploads/images/2021/0821/115721_53fae891_865419.png "管理员-火车车次管理.png")


![输入图片说明](https://images.gitee.com/uploads/images/2021/0821/115727_41a7dab3_865419.png "管理员-系统管理员管理.png")


![输入图片说明](https://images.gitee.com/uploads/images/2021/0821/115734_86c48c14_865419.png "管理员-用户管理.png")

![输入图片说明](https://images.gitee.com/uploads/images/2021/0821/115745_1d6ae4e0_865419.png "管理员-用户添加.png")

![输入图片说明](https://images.gitee.com/uploads/images/2021/0821/115756_62beb2a7_865419.png "管理员-坐席管理.png")

![输入图片说明](https://images.gitee.com/uploads/images/2021/0821/115803_c631cab5_865419.png "管理员-坐席列表.png")


火车票售票系统 的设计与实现
http://localhost:8080/myproject/index
【系统测试账号】
管理员 admin 123456
后台技术 SSM框架和Springboot框架两个版本代码
数据库 Mysql
开发工具：Eclipse和idea或MyEclipse都可以运行
【如果不会运行，可以找我们远程帮助调试运行】
数据库每个表都有详细注释
代码也有详细注释（详细说明）
前段使用技术：html+JavaScript+css+layui+jQuery
网站前端：http://localhost:8080/myproject/pc/index
网站后台:http://localhost:8080/myproject/manage/login
4.系统实现（基础代码，业务功能代码的编写）
com   项目包结构说明
└─module
    ├─controller  控制层，负责请求的处理，数据库的操作调用
    ├─mapper      数据库操作接口，sql文件在xml中的配置
    ├─pojo        数据库对应实体类，用来和数据库表实现映射关系
    └─util        java中常见工具类的存放

所有WEB-INF/view/pc文件夹中的都是前端相关jsp页面
    login.jsp 登录页面
    register.jsp   注册页面
    index.jsp 首页
    code.jsp 验证码生成页面
    userinfoList.jsp 用户信息显示页面
    ....
所有WEB-INF/view/manage文件夹中的都是后台管理相关jsp页面，按照文件夹进行划分表，
    每一个文件夹对应一张表的操作，例如userinfo是用户表的所有管理操作。

包名功能说明
com.code.admin  所有请求控制类  例如 UserinfoMapper 代表用户相关请求
com.code.entity 数据库对应实体类
com.code.mapper 所有mybatis plus框架操作数据库接口
com.code.util   项目中常用工具类

下面的文件是ssm框架配置文件
applicationContext.xml
jdbc.properties   数据库配置文件
log4j.properties
mybatis-config.xml
springmvc.xml



