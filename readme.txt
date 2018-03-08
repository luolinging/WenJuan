=============================================
1.系统名称：网上问卷调查的系统
  技 术 QQ：1968967624
  联系邮箱：1968967624@qq.com
=============================================

2.打开eclipse->new->import->General->Existing Projects into Workspace->next->Browse->选中这个项目(lll)->将下面的Copy projects into workspace选中->finish,

至此就将这个项目导入到eclipse的工作空间里了，
（注意：启动MySQL服务器，打开MySQL-Front,将运行SQL文件，否则运行该系统时或出现数据库异常等错误信息）

可能会由于jdk版本，MySQL连接驱动的版本问题，或者是一些其他jar包的原因出现错误符号，不过稍作简单的调整就可以运行该项目。

4.访问方法：http://localhost:8080/lll/index.jsp

5.默认信息
用户名和密码默认为：admin，admin。
默认主页：Index.jsp

6.使用方法
左侧有菜单项->问卷管理
对应上面有一些功能按钮：新建问卷，修改问卷，删除问卷，问卷内容编辑，发布，撤销，预览，查看结果等。