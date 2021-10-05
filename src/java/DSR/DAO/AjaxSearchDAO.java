package DSR.DAO;
import DSR.Helper.NewHibernateUtil;
import java.util.ListIterator;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
public class AjaxSearchDAO {
    static Query q=null;
    static ListIterator lit=null;
    
    public static ListIterator deptshow(String dept)
    {
        ListIterator lit=null;
        try
        {
            Session s=NewHibernateUtil.getSessionFactory().openSession();
            Query q=s.createQuery("FROM writeoff where department=:dept");
            q.setParameter("dept",dept);
            lit=q.list().listIterator();
            s.close();
        } catch(Exception ae)
        {
            ae.printStackTrace();
        }
        return (ListIterator)lit;
    }
      public static ListIterator deptshow2()
    {
        ListIterator lit=null;
        try
        {
            Session s=NewHibernateUtil.getSessionFactory().openSession();
            Query q=s.createQuery("from writeoff  ");
            lit=q.list().listIterator();
            s.close();
        } catch(Exception ae)
        {
            ae.printStackTrace();
        }
        return (ListIterator)lit;
    }
    public static ListIterator Filtersupplier(String supplier_name)
    {
       try
       {
        Session s=NewHibernateUtil.getSessionFactory().openSession();
        q=s.createQuery("FROM CDSR WHERE Supplier like concat('%',:supplier_name,'%')");
        q.setParameter("supplier_name", supplier_name);
        lit=q.list().listIterator();
        s.close();
       }    
       catch(HibernateException he)          
       {
           he.printStackTrace();
       }    
       return (ListIterator)lit;
    }
     public static ListIterator FilterConsumeSupplier(String supplier_name)
    {
       try
       {
        Session s=NewHibernateUtil.getSessionFactory().openSession();
        q=s.createQuery("FROM Consume_CDSR WHERE Consume_Supplier_Name like concat('%',:supplier_name,'%')");
        q.setParameter("supplier_name",supplier_name);
        lit=q.list().listIterator();
        s.close();
       }    
       catch(HibernateException he)          
       {
           he.printStackTrace();
       }    
       return (ListIterator)lit;
    }
     public static ListIterator FilterConsumeProduct(String product_name)
    {
       try
       {
        Session s=NewHibernateUtil.getSessionFactory().openSession();
        q=s.createQuery("FROM Consume_CDSR WHERE ConsumeCDSR_Product_Name like concat('%',:product_name,'%')");
        q.setParameter("product_name",product_name);
        lit=q.list().listIterator();
        s.close();
       }    
       catch(HibernateException he)          
       {
           he.printStackTrace();
       }    
       return (ListIterator)lit;
    }
    public static ListIterator DeptSearch_writeoff(String dept)
    {
        try
        {
            Session s=NewHibernateUtil.getSessionFactory().openSession();
            q=s.createQuery("From writeoff WHERE department=:dept");
            q.setParameter("dept", dept);
            lit=q.list().listIterator();
            s.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return (ListIterator)lit;
    }
}