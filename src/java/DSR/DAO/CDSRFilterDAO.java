
package DSR.DAO;
import DSR.Helper.NewHibernateUtil;
import java.util.List;
import java.util.ListIterator;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

public class CDSRFilterDAO {
    
    static Query q=null;
    static List li=null;
    public static List CDSRshowRecords(String cdsr_name,int cdsr_no)
    {
       try
       {
       Session s=NewHibernateUtil.getSessionFactory().openSession();
       q=s.createQuery("FROM CDSR WHERE CDSR_Name=:cdsr_name AND CDSR_NO=:cdsr_no");
       q.setParameter("cdsr_name",cdsr_name);
       q.setParameter("cdsr_no",cdsr_no);
       li=q.list();
       s.close();
       }
       catch(HibernateException he)
       {
           he.printStackTrace();
       }
       return (List)li;
    }
    
    //function for fetching consumecdsr records from consumecdsr table in consumecdsrfilter.jsp page
    public static List ConsumeCDSRshowRecords(int consumecdsr_no)
      {
          try
          {
              Session s=NewHibernateUtil.getSessionFactory().openSession();   
              q=s.createQuery("FROM Consume_CDSR WHERE ConsumeCDSR_No=:consumecdsr_no");
              q.setParameter("consumecdsr_no", consumecdsr_no);
              li=q.list();
	      s.close();
          }
          catch(HibernateException he)
          {
              he.printStackTrace();
          }    
          return(List)li;
      } 
    
    //function for finding cdsrproductquantity for writeoff
    public static ListIterator findCDSRProductQuantityforwriteoff(long cdsr_table_id)
    {
        ListIterator lit=null;
        try
        {
            Session s=NewHibernateUtil.getSessionFactory().openSession();
            Query q=s.createQuery("from CDSR where CDSR_Id=:cdsr_table_id");
            q.setParameter("cdsr_table_id",cdsr_table_id);
            lit=q.list().listIterator();
            s.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return (ListIterator)lit;
    }
    
    //function for displaying records of consumeddsr table with filter of department name on dashboard
    public static List ConsumeDDSRrecords(String consume_department)
      {
          try
          {
             Session s=NewHibernateUtil.getSessionFactory().openSession();
             if(consume_department.equals("All Departments"))
             {
                 q=s.createQuery("From ConsumeDDSR");
             }
             else
             {
                 q=s.createQuery("From ConsumeDDSR WHERE Department=:consume_department");
                 q.setParameter("consume_department",consume_department);
             }
              li=q.list();
              s.close();
          }
          catch(HibernateException he)
          {
              he.printStackTrace();
          }  
          return(List)li;
      } 
    
    //function for displaying cdsr records on dashboard with special cdsr name criteria
    public static List CDSRshowbyonlyName(String cdsr_name)
    {
       try
       {
       Session s1=NewHibernateUtil.getSessionFactory().openSession();
       q=s1.createQuery("FROM CDSR WHERE CDSR_Name=:cdsr_name");
       q.setParameter("cdsr_name",cdsr_name);
       li=q.list();
       s1.close();
       }
       catch(HibernateException he)
       {
           he.printStackTrace();
       }
       return (List)li;
    }
     
    //function for displaying cdsr records on dashboard with All CDSR criteria
    public static List CDSRInfoDisplay()
      {
          try
          {
              Session s=NewHibernateUtil.getSessionFactory().openSession();   
              q=s.createQuery("FROM CDSR");
              li=q.list();
	      s.close();
          }
          catch(HibernateException he)
          {
              he.printStackTrace();
          }    
          return(List)li;
      } 
}
