package DSR.POJO;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="CDSR", catalog="deadstockregister")
public class CDSR implements Serializable {
    
    private long cdsr_id;
    private int CDSR_no;
    private int CDSR_page_no;
    private int CDSR_Sr_No;
    private String supplier;
    private String product_description;
    private String purchase_authority;
    private String product_type;
    private String product_category;
    private int product_quantity;
    private String purchase_year;
    private int Remaining_Quantity;
    private String date_of_purchase;
    private long single_cost;
    private long total_cost;
    private String cdsr_name;
    private String WriteOff_status;
    private int Active_product;
    
    @Id@GeneratedValue(strategy=IDENTITY)
    @Column(name="CDSR_Id", unique=true, nullable=false)
    public long getCdsr_id() {
        return cdsr_id;
    }

    public void setCdsr_id(long cdsr_id) {
        this.cdsr_id = cdsr_id;
    }

    @Column(name="CDSR_NO")
    public int getCDSR_no() {
        return CDSR_no;
    }

    public void setCDSR_no(int CDSR_no) {
        this.CDSR_no = CDSR_no;
    }

    @Column(name="CDSR_Pg_No")
    public int getCDSR_page_no() {
        return CDSR_page_no;
    }

    public void setCDSR_page_no(int CDSR_page_no) {
        this.CDSR_page_no = CDSR_page_no;
    }

    @Column(name="CDSR_Sr_No")
    public int getCDSR_Sr_No() {
        return CDSR_Sr_No;
    }

    public void setCDSR_Sr_No(int CDSR_Sr_No) {
        this.CDSR_Sr_No = CDSR_Sr_No;
    }
    
    @Column(name="Supplier",length = 90)
    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    @Column(name="Product_Description", length=80)
    public String getProduct_description() {
        return product_description;
    }

    public void setProduct_description(String product_description) {
        this.product_description = product_description;
    }

    @Column(name="Purchase_Authority", length=80)
    public String getPurchase_authority() {
        return purchase_authority;
    }

    public void setPurchase_authority(String purchase_authority) {
        this.purchase_authority = purchase_authority;
    }

    @Column(name="Product_Type", length=80)
    public String getProduct_type() {
        return product_type;
    }

    public void setProduct_type(String product_type) {
        this.product_type = product_type;
    }

    @Column(name="Product_Category", length=80)
    public String getProduct_category() {
        return product_category;
    }

    public void setProduct_category(String product_category) {
        this.product_category = product_category;
    }

    @Column(name="Product_Quantity")
    public int getProduct_quantity() {
        return product_quantity;
    }

    public void setProduct_quantity(int product_quantity) {
        this.product_quantity = product_quantity;
    }

    @Column(name="Purchase_Year", length=40)
    public String getPurchase_year() {
        return purchase_year;
    }

    public void setPurchase_year(String purchase_year) {
        this.purchase_year = purchase_year;
    }

    @Column(name="Remaining_Quantity",nullable = false)
    public int getRemaining_Quantity() {
        return Remaining_Quantity;
    }

    public void setRemaining_Quantity(int Remaining_Quantity) {
        this.Remaining_Quantity = Remaining_Quantity;
    }

    @Column(name="Date_of_Purchase", length=80)
    public String getDate_of_purchase() {
        return date_of_purchase;
    }

    public void setDate_of_purchase(String date_of_purchase) {
        this.date_of_purchase = date_of_purchase;
    }
    
    @Column(name="Single_Cost")
    public long getSingle_cost() {
        return single_cost;
    }

    public void setSingle_cost(long single_cost) {
        this.single_cost = single_cost;
    }

    @Column(name="Total_Cost")
    public long getTotal_cost() {
        return total_cost;
    }

    public void setTotal_cost(long total_cost) {
        this.total_cost = total_cost;
    }

    @Column(name="CDSR_Name")
    public String getCdsr_name() {
        return cdsr_name;
    }

    public void setCdsr_name(String cdsr_name) {
        this.cdsr_name = cdsr_name;
    }
    
    @Column(name="WriteOff_Status")
    public String getWriteOff_status() {
        return WriteOff_status;
    }

    public void setWriteOff_status(String WriteOff_status) {
        this.WriteOff_status = WriteOff_status;
    }
    @Column(name="Active_product")
    public int getActive_product() {
        return Active_product;
    }

    public void setActive_product(int Active_product) {
        this.Active_product = Active_product;
    }
    
    
}
