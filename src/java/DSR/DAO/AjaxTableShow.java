package DSR.DAO;

import DSR.Helper.NewHibernateUtil;
import java.util.ListIterator;
import org.hibernate.Query;
import org.hibernate.Session;

public class AjaxTableShow {
    
    //function for displaying cdsr table records for updating on ajax click on distribution.jsp page
    public static ListIterator deadstockDistribution(String supplier,String date_of_purchase)
    {
        ListIterator lit=null;
        try
        {
            Session s=NewHibernateUtil.getSessionFactory().openSession();
            Query q=s.createQuery("from CDSR where Supplier=:supplier AND Date_of_Purchase=:date_of_purchase");
            q.setParameter("supplier", supplier);
            q.setParameter("date_of_purchase",date_of_purchase);
            lit=q.list().listIterator();
            s.close();
        } catch(Exception ae)
        {
            ae.printStackTrace();
        }
        return (ListIterator)lit;
    }
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
    //function for displaying cdsr table records for displaying on ajax click on transferinventory.jsp page
    public static ListIterator deadstockTransfer(String supplier,String date_of_purchase)
    {
        ListIterator lit=null;
        try
        {
            Session s=NewHibernateUtil.getSessionFactory().openSession();
            Query q=s.createQuery("from CDSR where Supplier=:supplier AND Date_of_Purchase=:date_of_purchase AND Remaining_Quantity>0");
            q.setParameter("supplier", supplier);
            q.setParameter("date_of_purchase",date_of_purchase);
            lit=q.list().listIterator();
            s.close();
            
        } catch(Exception ae)
        {
            ae.printStackTrace();
        }
        return (ListIterator)lit;
    }
   
    //function for displaying consumable entry for transfer on ajax click in consumedistribute.jsp page
    public static ListIterator consumableTransfer(String product_name,String supplier)
    {
        ListIterator lit=null;
        try
        {
            Session s=NewHibernateUtil.getSessionFactory().openSession();
            Query q=s.createQuery("from Consume_CDSR where ConsumeCDSR_Product_Name=:product_name AND Consume_Supplier_Name=:supplier");
            q.setParameter("product_name", product_name);
            q.setParameter("supplier", supplier);
            lit=q.list().listIterator();
            s.close();
        } catch(Exception ae)
        {
            ae.printStackTrace();
        }
        return (ListIterator)lit;
    }
    
    //function for displaying consumable_cdsr record for updation on consumeacceptance_cdsr.jsp
    public static ListIterator consumableDistribution(String supplier,String date_of_purchase)
    {
        ListIterator lit=null;
        try
        {
            Session s=NewHibernateUtil.getSessionFactory().openSession();
            Query q=s.createQuery("FROM Consume_CDSR where Consume_Supplier_Name=:supplier AND Consume_Date_Of_Purchase=:date_of_purchase");
            q.setParameter("supplier",supplier);
            q.setParameter("date_of_purchase",date_of_purchase);
            lit=q.list().listIterator();
            s.close();
        } catch(Exception ae)
        {
            ae.printStackTrace();
        }
        return (ListIterator)lit;
    }
    
    //function for displaying entry for writeoff on writeoff.jsp page in ajax click
    public static ListIterator writeOffProduct(int cdsr_no,int cdsr_pg_no,int cdsr_sr_no,String department,String cdsr_name)
    {
        ListIterator lit=null;
        try
        {
            Session s=NewHibernateUtil.getSessionFactory().openSession();
            Query q=s.createQuery("from DDSR where CDSR_No=:cdsr_no AND CDSR_Page_No=:cdsr_pg_no AND CDSR_Sr_No=:cdsr_sr_no AND WriteOff_Status='NULL' AND Department=:department AND Cdsr_Name=:cdsr_name");
            
            q.setParameter("cdsr_no", cdsr_no);
            q.setParameter("cdsr_pg_no",cdsr_pg_no);
            q.setParameter("cdsr_sr_no",cdsr_sr_no);
            q.setParameter("department",department);
            q.setParameter("cdsr_name",cdsr_name);
            lit=q.list().listIterator();
            s.close();
        } catch(Exception ae)
        {
            ae.printStackTrace();
        }
        return (ListIterator)lit;
    }
    
    //function for printing cdsr data report
    public static ListIterator printCDSRdata(String cdsr_name,int cdsr_no,int page_no)
    {
        ListIterator lit=null;
        try
        {
            Session s=NewHibernateUtil.getSessionFactory().openSession();
            Query q=s.createQuery("from CDSR where CDSR_Name=:cdsr_name AND CDSR_NO=:cdsr_no AND CDSR_Pg_No>=:page_no");
            q.setParameter("cdsr_name", cdsr_name);
            q.setParameter("cdsr_no",cdsr_no);
            q.setParameter("page_no",page_no);
            lit=q.list().listIterator();
            s.close();
        } catch(Exception ae)
        {
            ae.printStackTrace();
        }
        return (ListIterator)lit;
    }
    
    //function for printing consumecdsr data report
    public static ListIterator printConsumeCDSRdata(int cdsr_no,int page_no)
    {
        ListIterator lit=null;
        try
        {
            Session s=NewHibernateUtil.getSessionFactory().openSession();
            Query q=s.createQuery("from Consume_CDSR where ConsumeCDSR_No=:cdsr_no AND ConsumeCDSR_Page_No>=:pg_no");
            q.setParameter("cdsr_no",cdsr_no);
            q.setParameter("pg_no",page_no);
            lit=q.list().listIterator();
            s.close();
        } catch(Exception e)
        {
            e.printStackTrace();
        }
        return (ListIterator)lit;
    }
}
