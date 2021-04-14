<%@ page import = "java.io.InputStream" %>
<%@ page import = "com.itheima.dao.IUserDao" %>
<%@ page import = "com.itheima.domain.User" %>
<%@ page import = "org.apache.ibatis.io.Resources" %>
<%@ page import = "org.apache.ibatis.session.SqlSession" %>
<%@ page import = "org.apache.ibatis.session.SqlSessionFactory" %>
<%@ page import = "org.apache.ibatis.session.SqlSessionFactoryBuilder" %>
<%@ page import = "java.util.List" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<html>
<body>
<h2>Hello World!</h2>
<%
            InputStream in = Resources.getResourceAsStream("SqlMapConfig.xml");
            SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
            SqlSessionFactory factory = builder.build(in);
            SqlSession sqlSession = factory.openSession();
            IUserDao userDao = sqlSession.getMapper(IUserDao.class);
            List<User> users = userDao.findAll();
            for(User user : users){
                System.out.println(user);
            }
            sqlSession.close();
            in.close();
%>
</body>
</html>
