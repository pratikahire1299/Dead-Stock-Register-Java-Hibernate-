package DSR.POJO;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ConsumeDDSR", catalog="deadstockregister")
public class ConsumeDDSR implements Serializable {
    private long consumeddsr_id;
    private String product_name;
    private String department;
    private long indent_no;
    private String date_of_issue;
    private String Quantity_issued;
    private int cdsr_pg_no;
    private int cdsr_sr_no;
    private int cdsr_no;
    private String purchase_year;
    private double ddsr_total;
     private String C_Purchase_Unit;
    private long final_product_quantity1;
    private String supplier;
    private long consumecdsr_id;
    
    @Id@GeneratedValue(strategy=IDENTITY)
    @Column(name="Consumeddsr_id",unique = true, nullable = true)
    public long getConsumeddsr_id() {
        return consumeddsr_id;
    }

    public void setConsumeddsr_id(long consumeddsr_id) {
        this.consumeddsr_id = consumeddsr_id;
    }
    
    @Column(name="Product_Name")
    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }
    
    @Column(name="Department")
    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }
    
    @Column(name="Indent_No")
    public long getIndent_no() {
        return indent_no;
    }

    public void setIndent_no(long indent_no) {
        this.indent_no = indent_no;
    }
    
    @Column(name="Date_of_issue")
    public String getDate_of_issue() {
        return date_of_issue;
    }

    public void setDate_of_issue(String date_of_issue) {
        this.date_of_issue = date_of_issue;
    }
    
    @Column(name="Quantity_Issued")
    public String getQuantity_issued() {
        return Quantity_issued;
    }

    public void setQuantity_issued(String Quantity_issued) {
        this.Quantity_issued = Quantity_issued;
    }
    
    @Column(name="Cdsr_Pg_No")
    public int getCdsr_pg_no() {
        return cdsr_pg_no;
    }

    public void setCdsr_pg_no(int cdsr_pg_no) {
        this.cdsr_pg_no = cdsr_pg_no;
    }
    
    @Column(name="Cdsr_Sr_No")
    public int getCdsr_sr_no() {
        return cdsr_sr_no;
    }

    public void setCdsr_sr_no(int cdsr_sr_no) {
        this.cdsr_sr_no = cdsr_sr_no;
    }
    
    @Column(name="Cdsr_no")
    public int getCdsr_no() {
        return cdsr_no;
    }

    public void setCdsr_no(int cdsr_no) {
        this.cdsr_no = cdsr_no;
    }
    
    @Column(name="Ddsr_purchase_year")
    public String getPurchase_year() {
        return purchase_year;
    }

    public void setPurchase_year(String purchase_year) {
        this.purchase_year = purchase_year;
    }

    public double getDdsr_total() {
        return ddsr_total;
    }

    public void setDdsr_total(double ddsr_total) {
        this.ddsr_total = ddsr_total;
    }
    
    @Column(name="C_Purchase_Unit")
    public String getC_Purchase_Unit() {
        return C_Purchase_Unit;
    }

    public void setC_Purchase_Unit(String C_Purchase_Unit) {
        this.C_Purchase_Unit = C_Purchase_Unit;
    }
    
    @Column(name="final_product_quantity1")
    public long getFinal_product_quantity1() {
        return final_product_quantity1;
    }

    public void setFinal_product_quantity1(long final_product_quantity1) {
        this.final_product_quantity1 = final_product_quantity1;
    }
    
    @Column(name="Supplier_Name")
    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    @Column(name="ConsumeCDSR_Id")
    public long getConsumecdsr_id() {
        return consumecdsr_id;
    }

    public void setConsumecdsr_id(long consumecdsr_id) {
        this.consumecdsr_id = consumecdsr_id;
    }
}
