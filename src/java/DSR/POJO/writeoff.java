package DSR.POJO;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="writeoff",catalog="deadstockregister")
public class writeoff implements Serializable {
  
    
    private long writeoff_Id;
    private int cdsr_no;
    private int cdsr_page_no;
    private int cdsr_sr_no;
    private int Product_quantity_wo;
    private String name_of_product;
    private String order_no;
    private String receipt_no;
    private String write_off_date;
    private String write_off_year;
    private String product_category;
    private String final_product_no;
    private String department;
    private int ddsr_no;
    private int ddsr_pg_no;
    private int ddsr_sr_no;
    private String dsr_name;
    private long cdsr_table_id;
    private long ddsr_table_id;

    @Id@GeneratedValue(strategy=IDENTITY)
    @Column(name="writeoff_Id",unique = true, nullable = true)
    public long getWriteoff_Id() {
        return writeoff_Id;
    }

    public void setWriteoff_Id(long writeoff_Id) {
        this.writeoff_Id = writeoff_Id;
    }
    
    @Column(name="cdsr_no")
    public int getCdsr_no() {
        return cdsr_no;
    }
    
    public void setCdsr_no(int cdsr_no) {
        this.cdsr_no = cdsr_no;
    }
       
    @Column(name="cdsr_page_no")
     public int getCdsr_page_no() {
        return cdsr_page_no;
    }

    public void setCdsr_page_no(int cdsr_page_no) {
        this.cdsr_page_no = cdsr_page_no;
    }
    @Column(name="cdsr_sr_no")   
    public int getCdsr_sr_no() {
        return cdsr_sr_no;
    }

    public void setCdsr_sr_no(int cdsr_sr_no) {
        this.cdsr_sr_no = cdsr_sr_no;
    }
      
    @Column(name="Product_quantity")
    public int getProduct_quantity_wo() {
        return Product_quantity_wo;
    }

    public void setProduct_quantity_wo(int Product_quantity_wo) {
        this.Product_quantity_wo = Product_quantity_wo;
    }
      
    @Column(name="Product_Name")
    public String getName_of_product() {
        return name_of_product;
    }

    public void setName_of_product(String name_of_product) {
        this.name_of_product = name_of_product;
    }
    @Column(name="order_no")
    public String getOrder_no() {
        return order_no;
    }

    public void setOrder_no(String order_no) {
        this.order_no = order_no;
    }
    @Column(name="receipt_no")
    public String getReceipt_no() {
        return receipt_no;
   }

    public void setReceipt_no(String receipt_no) {
        this.receipt_no = receipt_no;
    }
     @Column(name="write_off_date")
    public String getWrite_off_date() {
        return write_off_date;
    }

    public void setWrite_off_date(String write_off_date) {
        this.write_off_date = write_off_date;
    }
     @Column(name="write_off_year")
    public String getWrite_off_year() {
        return write_off_year;
    }

    public void setWrite_off_year(String write_off_year) {
        this.write_off_year = write_off_year;
    }
     @Column(name="product_category")
    public String getProduct_category() {
        return product_category;
    }

    public void setProduct_category(String product_category) {
        this.product_category = product_category;
    }
    
    @Column(name="Final_Product_No")
    public String getFinal_product_no() {
        return final_product_no;
    }

    public void setFinal_product_no(String final_product_no) {
        this.final_product_no = final_product_no;
    }
    
    @Column(name="Department")
    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }
    
    @Column(name="DDSR_no")
    public int getDdsr_no() {
        return ddsr_no;
    }

    public void setDdsr_no(int ddsr_no) {
        this.ddsr_no = ddsr_no;
    }

    @Column(name="DDSR_pg_no")
    public int getDdsr_pg_no() {
        return ddsr_pg_no;
    }

    public void setDdsr_pg_no(int ddsr_pg_no) {
        this.ddsr_pg_no = ddsr_pg_no;
    }

    @Column(name="DDSR_sr_no")
    public int getDdsr_sr_no() {
        return ddsr_sr_no;
    }

    public void setDdsr_sr_no(int ddsr_sr_no) {
        this.ddsr_sr_no = ddsr_sr_no;
    }

    @Column(name="CDSR_name")
    public String getDsr_name() {
        return dsr_name;
    }

    public void setDsr_name(String dsr_name) {
        this.dsr_name = dsr_name;
    }

    @Column(name="Cdsr_Table_Id")
    public long getCdsr_table_id() {
        return cdsr_table_id;
    }

    public void setCdsr_table_id(long cdsr_table_id) {
        this.cdsr_table_id = cdsr_table_id;
    }

    @Column(name="Ddsr_Table_Id")
    public long getDdsr_table_id() {
        return ddsr_table_id;
    }

    public void setDdsr_table_id(long ddsr_table_id) {
        this.ddsr_table_id = ddsr_table_id;
    }
    
    
    
    
}