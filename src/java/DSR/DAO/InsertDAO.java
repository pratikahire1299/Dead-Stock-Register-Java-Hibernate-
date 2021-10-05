package DSR.DAO;

import DSR.Helper.NewHibernateUtil;
import DSR.POJO.CDSR;
import DSR.POJO.ConsumeDDSR;
import DSR.POJO.Consume_CDSR;
import DSR.POJO.DDSR;
import DSR.POJO.writeoff;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class InsertDAO {
    static Transaction trans=null;
    
    //Accept Dead stock or semiconsumable entry and save it in cdsr table
    public static int AddDistribute(CDSR c)
    {
        long i=0;
        try
        {
            Session session1=NewHibernateUtil.getSessionFactory().openSession();
            trans=session1.beginTransaction();
            i=(Long)session1.save(c);
            if(i>0)
            {
                trans.commit();
            }
            else
            {
                trans.rollback();
            }
            session1.close();
        } catch(Exception e)
        {
            e.printStackTrace();
        } 
        return (int)i;
    }
    
    //function for transfer of dead stock or semiconsumable entry and minus remaining quantity
    public static int AddTransferinDDSR(DDSR d,int qty,int rem_item,long item_id)
    {
        long i=0;
        try
        {
            Session session1=NewHibernateUtil.getSessionFactory().openSession();
            trans=session1.beginTransaction();
            i=(Long)session1.save(d);
            if(i>0)
            {
                    int result=0;
                    Query q=session1.createQuery("update CDSR  set Remaining_Quantity ="+rem_item+" where CDSR_Id="+item_id);
                    result=q.executeUpdate();
                    if(result>0)
                    {
                        trans.commit();
                        i=1;
                    }
                    else
                    {
                        trans.rollback();
                        i=2;
                    }
            }
            else
            {
                System.out.println("<script>alert('Sorry');</script>");
            }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    return (int)i;
    }
    
    //function for adding entry of transfer consumable product in consume ddsr
    public static int AddConsumeTransfer(ConsumeDDSR c,long item_id,long remain_item)
    {
        int final_result=1;
        long i=0;
        try
        {
            Session session1=NewHibernateUtil.getSessionFactory().openSession();
            trans=session1.beginTransaction();
            i=(long)session1.save(c);
            int result=0;
            if(i>0)
            {
                Query q=session1.createQuery("update Consume_CDSR set final_product_quantity ="+remain_item+" where Consume_CDSR_Id="+item_id);          
                result=q.executeUpdate();
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
            session1.close();
        } catch(Exception e){
            e.printStackTrace();
        } 
        return (int)final_result;
    }
    
    //function for adding entry of acceptance of consumable entry
    public static int AcceptConsumableProduct(Consume_CDSR consumecdsr)
    {
        long i=0;

        try
        {
            Session session1=NewHibernateUtil.getSessionFactory().openSession();
            trans=session1.beginTransaction();
            i=(long)session1.save(consumecdsr);
            if(i>0)
            {
                trans.commit();
            }
            else
            {
                trans.rollback();
            }
            session1.close();
        } catch(Exception e)
        {
            e.printStackTrace();
        } 
        return (int)i;
    }
}
