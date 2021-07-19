package jxl.springMVC;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 * Created by AlbusDumbledore on 2019/2/24 0024.
 */
@Controller
@RequestMapping("/user")
public class userController {

    @ResponseBody
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public Object login(HttpServletRequest request, HttpServletResponse response) throws SQLException,ClassNotFoundException{
        String mail = request.getParameter("mail");
        String pwd = request.getParameter("pwd");

        response.setContentType("text/javascript;charset=utf-8");
        response.setCharacterEncoding("utf-8");

        Class.forName("com.mysql.jdbc.Driver");//加载驱动
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wags", "root", "root");
        if (!conn.isClosed()) {
            System.out.println("Succeeded connecting to the Database!");
        }
        Statement statement = conn.createStatement();
        String sql = "select * from users where mail='"+mail+" AND pwd="+pwd;
        System.out.printf("------------------sql语句："+sql);

        ResultSet rs=statement.executeQuery(sql);//执行sql语句并返还结束

        if (rs!=null){
            return "ok";
        } else {
            return "false";
        }
    }

    //1.查询数据query方法
    public static void query(Connection conn,String mail,String pwd){
        String Sql="select * from users";
        try{
            Statement stmt=conn.createStatement(); //也可以使用PreparedStatement来做
            ResultSet rs=stmt.executeQuery(Sql);//执行sql语句并返还结束

            while(rs.next()){//遍历结果集
                System.out.println("邮箱:"+rs.getString("mail")+"密码:"+rs.getString("pwd"));
            }
            if(rs !=null){
                try{
                    rs.close();
                } catch (SQLException e){
                    e.printStackTrace();
                }
            }
            if(stmt !=null){
                try{
                    stmt.close();
                }catch(SQLException e){
                    e.printStackTrace();
                }
            }
            if(conn !=null){
                try{
                    conn.close();
                }catch(SQLException e){
                    e.printStackTrace();
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
