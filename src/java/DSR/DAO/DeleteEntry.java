package DSR.DAO;

import DSR.Helper.NewHibernateUtil;
import DSR.POJO.CDSR;
import DSR.POJO.Consume_CDSR;
import java.util.ListIterator;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class DeleteEntry {
    static Query q=null;
    
    //function for deadstock entry deletion
    public static int EntryDeletion(int id,int qty,long cdsr_table_id)
    {
        int result=0;
        int final_result=0;
        try{
        Session s1=NewHibernateUtil.getSessionFactory().openSession();
        Transaction trans=s1.beginTransaction();
        q=s1.createQuery("delete from DDSR where Ddsr_id="+id);
        result=q.executeUpdate();
        ListIterator lit=DeleteEntry.getQuantityforddsrentrydeletion(cdsr_table_id);
        int cdsr_qnt=0;
            while(lit.hasNext())
            {
                CDSR cdsr=(CDSR)lit.next();
                cdsr_qnt=(int)cdsr.getRemaining_Quantity();
            }
        int result1=0;
            if(result>0)
            {
                int add=cdsr_qnt+qty;
                q=s1.createQuery("Update CDSR set Remaining_Quantity="+add+" Where CDSR_Id="+cdsr_table_id);
                result1=q.executeUpdate();
            }
            
            if(result1>0)
            {
                trans.commit();
                s1.close();
                final_result=1;
            }
            else
            {
                trans.rollback();
                s1.close();
                final_result=2;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return final_result;
    }
    
    //function for getting remaining quantity from cdsr table
    public static ListIterator getQuantityforddsrentrydeletion(long cdsr_table_id)
    {
        
        ListIterator lit=null;
        try{
            Session s1=NewHibernateUtil.getSessionFactory().openSession();
            q=s1.createQuery("From CDSR where CDSR_Id="+cdsr_table_id);
            lit=q.list().listIterator();
            
            
            s1.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return (ListIterator)lit;
    }
    
    //Delete Writeoff Entry get Product Quantity from cdsr table
    public static ListIterator getcdsrWriteoffQuantity(long cdsr_table_id)
    {
        ListIterator lit=null;
        try{
            Session s1=NewHibernateUtil.getSessionFactory().openSession();
            q=s1.createQuery("From CDSR where CDSR_Id="+cdsr_table_id);
            lit=q.list().listIterator();    
            s1.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return (ListIterator)lit;
    }
    
    //Delete Writeoff Entry get Product Quantity from ddsr table
   public static ListIterator getddsrwriteoffQuantity(long ddsr_table_id,long cdsr_table_id)
    {
        
        ListIterator lit=null;
        try{
            Session s1=NewHibernateUtil.getSessionFactory().openSession();
            q=s1.createQuery("From DDSR where CDSR_TABLE_ID=:cdsr_table_id AND DDSR_Id=:ddsr_table_id");
            q.setParameter("cdsr_table_id",cdsr_table_id);
            q.setParameter("ddsr_table_id",cdsr_table_id);
            lit=q.list().listIterator();
            
            s1.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return (ListIterator)lit;
    } 
   
    //function for getting current product quantity in consumecdsr table for this id which required for deleting consumable transfer entry
    public static ListIterator getUpdateQuantity(long cdsr_table_id)
    {
        ListIterator lit=null;
        try{
            Session s1=NewHibernateUtil.getSessionFactory().openSession();
            q=s1.createQuery("From Consume_CDSR where Consume_CDSR_Id="+cdsr_table_id);
            lit=q.list().listIterator();
            s1.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return (ListIterator)lit;
    }
    
    //Delete Consumable Entry
    public static int deleteConsumableEntry(long trans_id,long cdsr_table_id,long qty)
    {
        int final_result=0;
        int result=0;
        try
        {
           Session s1=NewHibernateUtil.getSessionFactory().openSession();
           Transaction trans=s1.beginTransaction();
           q=s1.createQuery("delete from ConsumeDDSR where Consumeddsr_id="+trans_id);
           result=q.executeUpdate();
           ListIterator lit=DeleteEntry.getUpdateQuantity(cdsr_table_id);
           long cdsr_qnt=0;
           while(lit.hasNext())
           {
               Consume_CDSR cdsr=(Consume_CDSR)lit.next();
               cdsr_qnt=(long)cdsr.getFinal_product_quantity();
           }
           int result1=0;
           if(result>0)
           {
               long remaining_quantity=cdsr_qnt+qty;
               q=s1.createQuery("Update Consume_CDSR set final_product_quantity="+remaining_quantity+" where Consume_CDSR_Id="+cdsr_table_id);
               result1=q.executeUpdate();
           }
           if(result1>0)
           {
               trans.commit();
               final_result=1;
           }
           else
           {
               trans.rollback();
               final_result=2;
           }
        } catch(Exception e)
        {
            e.printStackTrace();
        }
        return final_result;
    }
    
    //Delete Writeoff Entry
    public static int deletewriteoffProduct(long writeoff_id,long cdsr_table_id,long ddsr_table_id,int cdsr_product_qnt,int ddsr_product_qnt)
    {
        int final_result=0;
        try{
        Session s1=NewHibernateUtil.getSessionFactory().openSession();
        Transaction trans=s1.beginTransaction();
        q=s1.createQuery("delete from writeoff where writeoff_Id="+writeoff_id);
        int result=q.executeUpdate();
        int result1=0;
        int result2=0;
        if(result>0)
        {
             q=s1.createQuery("Update CDSR set Active_product="+cdsr_product_qnt+",WriteOff_Status = 'NULL' Where CDSR_Id="+cdsr_table_id);
             result1=q.executeUpdate();
             if(result1>0)
             {
                q=s1.createQuery("update DDSR set Product_Quantity ="+ddsr_product_qnt+",WriteOff_Status = 'NULL' where CDSR_TABLE_ID="+cdsr_table_id+" AND DDSR_Id="+ddsr_table_id);
                result2=q.executeUpdate();
             }
             if(result>0)
             {
                 trans.commit();
                 final_result=1;
             }
             else
             {
                 trans.rollback();
                 final_result=2;
             }
        }
        s1.close();
        
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return final_result;
    }
}
