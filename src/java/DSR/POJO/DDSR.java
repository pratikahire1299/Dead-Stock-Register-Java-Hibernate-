package DSR.POJO;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="DDSR",catalog="deadstockregister")
public class DDSR implements Serializable {
    private long ddsr_id;
    private int cdsr_no; 
    private int cdsr_sr_no;
    private int cdsr_pg_no;
    private String department;
    private String year_of_buy;
    private int ddsr_no;
    private int ddsr_sr_no;
    private int ddsr_pg_no;
    private String product_description;
    private int product_quantity;
    private String date_of_receive;
    private String product_type;
    private String product_category;
    private String WriteOff_status;
    private String cost_unit;
    private String total_cost;
    private int realAcceptedProduct_Quantity;
    private String CDSR_name;
    private String supplier_name;
    private long cdsr_table_id;
  
    
    @Id@GeneratedValue(strategy=IDENTITY)
    @Column(name="DDSR_Id",unique = true, nullable = true)
    public long getDdsr_id() {
        return ddsr_id;
    }

    public void setDdsr_id(long ddsr_id) {
        this.ddsr_id = ddsr_id;
    }
    
    @Column(name="CDSR_No")
    public int getCdsr_no() {
        return cdsr_no;
    }

    public void setCdsr_no(int cdsr_no) {
        this.cdsr_no = cdsr_no;
    }

    @Column(name="CDSR_Sr_No")
    public int getCdsr_sr_no() {
        return cdsr_sr_no;
    }

    public void setCdsr_sr_no(int cdsr_sr_no) {
        this.cdsr_sr_no = cdsr_sr_no;
    }

    @Column(name="CDSR_Page_No")
    public int getCdsr_pg_no() {
        return cdsr_pg_no;
    }

    public void setCdsr_pg_no(int cdsr_pg_no) {
        this.cdsr_pg_no = cdsr_pg_no;
    }

    @Column(name="Department")
    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    @Column(name="Year_of_buy")
    public String getYear_of_buy() {
        return year_of_buy;
    }

    public void setYear_of_buy(String year_of_buy) {
        this.year_of_buy = year_of_buy;
    }

    @Column(name="DDSR_No")
    public int getDdsr_no() {
        return ddsr_no;
    }

    public void setDdsr_no(int ddsr_no) {
        this.ddsr_no = ddsr_no;
    }
    
    @Column(name="DDSR_Sr_No")
    public int getDdsr_sr_no() {
        return ddsr_sr_no;
    }

    public void setDdsr_sr_no(int ddsr_sr_no) {
        this.ddsr_sr_no = ddsr_sr_no;
    }

    @Column(name="DDSR_Pg_No")
    public int getDdsr_pg_no() {
        return ddsr_pg_no;
    }

    public void setDdsr_pg_no(int ddsr_pg_no) {
        this.ddsr_pg_no = ddsr_pg_no;
    }

    @Column(name="Product_Description")
    public String getProduct_description() {
        return product_description;
    }

    public void setProduct_description(String product_description) {
        this.product_description = product_description;
    }

    @Column(name="Product_Quantity")
    public int getProduct_quantity() {
        return product_quantity;
    }

    public void setProduct_quantity(int product_quantity) {
        this.product_quantity = product_quantity;
    }

    @Column(name="Date_of_receive")
    public String getDate_of_receive() {
        return date_of_receive;
    }

    public void setDate_of_receive(String date_of_receive) {
        this.date_of_receive = date_of_receive;
    }

    @Column(name="Product__Type")
    public String getProduct_type() {
        return product_type;
    }

    public void setProduct_type(String product_type) {
        this.product_type = product_type;
    }   
    
    @Column(name="Product_Category")
    public String getProduct_category() {
        return product_category;
    }

    public void setProduct_category(String product_category) {
        this.product_category = product_category;
    }
    
    @Column(name="WriteOff_Status")
    public String getWriteOff_status() {
        return WriteOff_status;
    }

    public void setWriteOff_status(String WriteOff_status) {
        this.WriteOff_status = WriteOff_status;
    }
    
    @Column(name="Cost_unit")
    public String getCost_unit() {
        return cost_unit;
    }

    public void setCost_unit(String cost_unit) {
        this.cost_unit = cost_unit;
    }
    
    @Column(name="Total_cost")
    public String getTotal_cost() {
        return total_cost;
    }

    public void setTotal_cost(String total_cost) {
        this.total_cost = total_cost;
    }
      
    @Column(name="AcceptedProduct_Quantity")
    public int getRealAcceptedProduct_Quantity() {
        return realAcceptedProduct_Quantity;
    }

    public void setRealAcceptedProduct_Quantity(int realAcceptedProduct_Quantity) {
        this.realAcceptedProduct_Quantity = realAcceptedProduct_Quantity;
    }
    
    @Column(name="Cdsr_Name")
    public String getCDSR_name() {
        return CDSR_name;
    }

    public void setCDSR_name(String CDSR_name) {
        this.CDSR_name = CDSR_name;
    }

    @Column(name="Supplier_Name")
    public String getSupplier_name() {
        return supplier_name;
    }

    public void setSupplier_name(String supplier_name) {
        this.supplier_name = supplier_name;
    }

    @Column(name="CDSR_TABLE_ID")
    public long getCdsr_table_id() {
        return cdsr_table_id;
    }

    public void setCdsr_table_id(long cdsr_table_id) {
        this.cdsr_table_id = cdsr_table_id;
    }
    
    
    
}
