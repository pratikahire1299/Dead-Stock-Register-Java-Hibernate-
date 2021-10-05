package DSR.DAO;

import DSR.Helper.NewHibernateUtil;
import java.util.ListIterator;
import org.hibernate.Query;
import org.hibernate.Session;

public class Display_distribution_DAO {
    public static ListIterator showDistribution(int cdsr_no,int cdsr_pg_no,int cdsr_sr_no)
    {
        ListIterator lit=null;
        try
        {
            Session s=NewHibernateUtil.getSessionFactory().openSession();
            Query q=s.createQuery("from ConsumeDDSR where cdsr_no=:cdsr_no AND cdsr_pg_no=:cdsr_pg_no AND cdsr_sr_no=:cdsr_sr_no");
            q.setParameter("cdsr_no",cdsr_no);
            q.setParameter("cdsr_pg_no",cdsr_pg_no);
            q.setParameter("cdsr_sr_no",cdsr_sr_no);
            lit=q.list().listIterator();
            s.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return (ListIterator)lit;
    }
    public static ListIterator showDistributionDeadStock(long cdsr_table_id)
    {
        ListIterator lit=null;
        try
        {
            Session s=NewHibernateUtil.getSessionFactory().openSession();
            Query q=s.createQuery("from DDSR where CDSR_TABLE_ID=:cdsr_table_id");
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
}
