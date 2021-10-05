package DSR.DAO;

import DSR.Helper.NewHibernateUtil;
import java.util.List;
import java.util.ListIterator;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class FilterDAO {
    static Query q=null;
    static List li=null;
    static Transaction trans=null;
    
    public static ListIterator Filtershowwriteoff(String department)
    {
        ListIterator lit=null;
        try
        {
            Session s=NewHibernateUtil.getSessionFactory().openSession();
            trans=s.beginTransaction();
            if(department.equals("All Departments"))
            {
                q=s.createQuery("From DDSR where WriteOff_Status='wo'");
                
            }
            else
            {
                q=s.createQuery("From DDSR where Department='"+department+"' AND WriteOff_Status='wo'");
            }
            
            lit=q.list().listIterator();
            s.close();
        }
        catch(HibernateException he)
        {
            he.printStackTrace();
        }
        return (ListIterator)lit;
    }                                                    
   public static ListIterator FiltershowYearwithwriteoff(String department,String start_year,String end_year)
    {
        ListIterator lit=null;
        try
        {
            Session s=NewHibernateUtil.getSessionFactory().openSession();
            trans=s.beginTransaction();
            if(department.equals("All Departments"))
            {
                q=s.createQuery("FROM DDSR WHERE Date_of_receive Between'"+start_year+"' AND '"+end_year+"' AND WriteOff_Status='wo'");
            }
            else
            {
                q=s.createQuery("FROM DDSR WHERE Department='"+department+"' AND Date_of_receive Between'"+start_year+"' AND '"+end_year+"' AND WriteOff_Status='wo'");
            }
            
            lit=q.list().listIterator();
            s.close();
        }
        catch(HibernateException he)
        {
            he.printStackTrace();
        }
        return (ListIterator)lit;
    }                                                          
    public static ListIterator FiltershowCategorywithwriteoff(String department,String category)
    {
        ListIterator lit=null;
        try
        {
            Session s=NewHibernateUtil.getSessionFactory().openSession();
            trans=s.beginTransaction();
            if(!department.equals("All Departments"))
           {
               q=s.createQuery("FROM DDSR WHERE Department='"+department+"' AND Product_Category='"+category+"' AND WriteOff_Status='wo'");
           }
           else
           {
            q=s.createQuery("FROM DDSR WHERE Product_Category='"+category+"' AND WriteOff_Status='wo'");
           }
            lit=q.list().listIterator();
            s.close();
        }
        catch(HibernateException he)
        {
            he.printStackTrace();
        }
        return (ListIterator)lit;
    }       
    
    //function for displaying records with the date filter
    public static List FiltershowYear(String department,String criteria,String start_year,String end_year)
    {
       try
       {
       Session s=NewHibernateUtil.getSessionFactory().openSession();
       trans=s.beginTransaction();
       if(department.equals("All Departments"))
       {
           q=s.createQuery("FROM DDSR WHERE Date_of_receive Between'"+start_year+"' AND '"+end_year+"' AND WriteOff_Status='NULL'");
       }
       else
       {
           q=s.createQuery("FROM DDSR WHERE Department='"+department+"' AND Date_of_receive Between'"+start_year+"' AND '"+end_year+"' AND WriteOff_Status='NULL'");
       }
       li=q.list();
       s.close();
       }
       catch(HibernateException he)
       {
           he.printStackTrace();
       }
       return (List)li;
    }
    
    //function for displaying records with the category filter
    public static List FiltershowCategory(String department,String criteria,String category)
    {
       try
       {
           Session s=NewHibernateUtil.getSessionFactory().openSession();
           trans=s.beginTransaction();
           if(!department.equals("All Departments"))
           {
               q=s.createQuery("FROM DDSR WHERE Department='"+department+"' AND Product_Category='"+category+"' AND WriteOff_Status='NULL'");
               
           }
           else
           {
            q=s.createQuery("FROM DDSR WHERE Product_Category='"+category+"' AND WriteOff_Status='NULL'");
           }
           li=q.list();
           s.close();
       }
       catch(HibernateException he)
       {
           he.printStackTrace();
       }
       return (List)li;
    }
    
    //function for displaying records with all records filter i.e. without using any filter
    public static List FiltershowAll(String department,String criteria)
    {
        try
        {
            Session s=NewHibernateUtil.getSessionFactory().openSession();
            trans=s.beginTransaction();
            if(department.equals("All Departments"))
            {
                q=s.createQuery("From DDSR Where WriteOff_Status='NULL'");
            }
            else
            {
                q=s.createQuery("From DDSR where Department='"+department+"' AND WriteOff_Status='NULL'");
            }
            
            li=q.list();
            s.close();
        }
        catch(HibernateException he)
        {
            he.printStackTrace();
        }
        return (List)li;
    }
}
