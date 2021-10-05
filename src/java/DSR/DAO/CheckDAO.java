package DSR.DAO;

import DSR.Helper.NewHibernateUtil;
import DSR.POJO.Login;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class CheckDAO {
    public static int LoginCheck(String usname,String passw)
    {
        int i=0;
        try
        {
        Session session1=NewHibernateUtil.getSessionFactory().openSession();
        Login lg=new Login();
        Object obj=session1.get(Login.class, 1);
        lg=(Login)obj;
        if(usname.equals(lg.getUsname()) && passw.equals(lg.getPassw()))
        {
            i=1;
        }
        else
        {
            i=2;
        }
        session1.close();
        } catch(Exception e){ e.printStackTrace();}
        return i;   
    }
}