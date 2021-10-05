package DSR.DAO;

import DSR.Helper.NewHibernateUtil;
import DSR.POJO.ConsumeDDSR;
import DSR.POJO.writeoff;
import java.security.MessageDigest;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class UpdateDAO {
    static Transaction trans=null;
    static Query q=null;
    
    //update password in login table
    public static int Update_pass(String us,String pass)
    {
       int ans=0; 
       try
       {
      MessageDigest m=MessageDigest.getInstance("MD5");
          m.update((new String(pass).getBytes("UTF8")));
          String str=new String(m.digest());
          System.out.println("Hello");
        Session session1=NewHibernateUtil.getSessionFactory().openSession();
        trans=session1.beginTransaction();
        q=session1.createQuery("update Login set passw ='"+str+"' where usname='"+us+"'");
        ans=q.executeUpdate();
        trans.commit();
        session1.close();
        } catch(Exception e)
        {
            e.printStackTrace();
        }
        return (int)ans;
    }
    
    //writeoff product updation of products in cdsr, ddsr table
    public static int updateWriteoffProduct(writeoff writeoffobj,int Product_quantity_wo,int newcdsr_product_quantity,int newddsr_Product_quantity,long cdsr_table_id,long ddsr_table_id)
    {
        String wo="WO";
        int final_result=0;
        try
        {
            Session s=NewHibernateUtil.getSessionFactory().openSession();
            trans=s.beginTransaction();
            long i=(long)s.save(writeoffobj);
            if(i>0){
            if(newcdsr_product_quantity==0)
            {  
                q=s.createQuery("update CDSR set WriteOff_Status = 'wo', Active_product=0 where CDSR_Id="+cdsr_table_id);
            }
            else
            {
                q=s.createQuery("update CDSR set Active_product = "+newcdsr_product_quantity+" where CDSR_Id="+cdsr_table_id);
            }
            int result1=q.executeUpdate();
            int result2=0;
            if(result1>0)
            {
                if(newddsr_Product_quantity==0)
                {
                    q=s.createQuery("update DDSR set WriteOff_Status = 'wo',Product_Quantity=0 where CDSR_TABLE_ID="+cdsr_table_id+" AND DDSR_Id="+ddsr_table_id);
                }
                else
                {
                    q=s.createQuery("update DDSR set Product_Quantity = "+newddsr_Product_quantity+" where CDSR_TABLE_ID="+cdsr_table_id+" AND DDSR_Id="+ddsr_table_id);
                }
                result2=q.executeUpdate();
            }
            if(result1>0 && result2>0)
            {
                trans.commit();
                final_result=1;
            }
            else
            {
                trans.rollback();
                final_result=2;
            }
            s.close();
        }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return (int)final_result;
    }
    
    //function for updation for cdsr records 
     public static int updateCDSRRecords(long id,String supplier_name,String year_purchase,int cdsr_no,int cdsr_page_no,int cdsr_sr_no,String product_Description,int product_Quantity,String purchase_Authority,String date_Of_purchase,long cost_per_unit,long Total, String Product_category)
     {
        int result=0;
        try
        {
        Session s=NewHibernateUtil.getSessionFactory().openSession();
        trans=s.beginTransaction();
        q=s.createQuery("update CDSR set Supplier='"+supplier_name+"',Purchase_Year='"+year_purchase+"',CDSR_NO="+cdsr_no+",Remaining_Quantity="+product_Quantity+",CDSR_page_no="+cdsr_page_no+",CDSR_Sr_No="+cdsr_sr_no+",Active_product="+product_Quantity+",Product_Description='"+product_Description+"',Product_Quantity="+ product_Quantity+",Purchase_Authority='"+purchase_Authority+"',Date_of_Purchase='"+date_Of_purchase+"',Single_Cost="+cost_per_unit+",Total_Cost="+Total+",Product_Category='"+Product_category+"' where CDSR_Id="+id+"");
         result=q.executeUpdate();
         if(result>0){ trans.commit(); } else{ trans.rollback(); }
        s.close();
        } catch(HibernateException e)
        {
            e.printStackTrace();
        }
        return result;
     }
     
     //function for updation for ddsr records
     public static int updateConsumeCDSRRecords(String supplier_name,String product_name,int cdsr_no,int cdsr_page_no,int cdsr_sr_no,int order_no,int purchase_quantity,long cost_per_unit,int Total,String purchase_year,String date_of_purchase,long id,long final_qty_product,String product_unit)
     {
      int result=0;
      try
      {
          Session s=NewHibernateUtil.getSessionFactory().openSession();
          trans=s.beginTransaction();
          q=s.createQuery("Update Consume_CDSR set Consume_Supplier_Name='"+supplier_name+"',ConsumeCDSR_Product_Name='"+product_name+"',ConsumeCDSR_No="+cdsr_no+",COnsumeCDSR_Page_No="+cdsr_page_no+",ConsumeCDSR_Sr_No="+cdsr_sr_no+",Consume_Order_No="+order_no+",Consume_purchase_Quantity="+purchase_quantity+",Consume_Cost_Per_Unit="+cost_per_unit+",Consume_Total="+Total+",Consume_Purchase_Year='"+purchase_year+"',Consume_Date_Of_Purchase='"+date_of_purchase+"',final_product_quantity="+final_qty_product+", Product_unit='"+product_unit+"' WHERE Consume_CDSR_Id="+id+"");
          result=q.executeUpdate();
          if(result>0){ trans.commit(); } else{ trans.rollback(); }
          trans.commit();
          s.close();
      }
      catch(HibernateException he)
      {
          he.printStackTrace();
      }
       return result;
     }   
}
