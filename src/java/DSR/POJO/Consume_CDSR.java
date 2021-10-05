package DSR.POJO;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Consume_CDSR",catalog="deadstockregister")

public class Consume_CDSR implements Serializable {
   
    private long consume_CDSR_Id;
    private int consume_CDSR_sr_no;
    private int consume_CDSR_no;
    private int consume_CDSR_page_no;
    private String consume_product_name;
    private int Consume_order_no;
    private String consume_date_of_purchase;
    private long consume_purchase_quantity;
    private long consume_cost_per_unit;
    private int consume_total;
    private String consume_supplier_name;
    private String consume_purchase_year;
    //private long consume_remaining_quantity;
    private String product_grant;
    private String product_unit;
    private long final_product_quantity;
    
    
    @Id@GeneratedValue(strategy=IDENTITY)
    @Column(name="Consume_CDSR_Id",unique = true, nullable = true)
    public long getConsume_CDSR_Id() {
        return consume_CDSR_Id;
    }

    public void setConsume_CDSR_Id(long consume_CDSR_Id) {
        this.consume_CDSR_Id = consume_CDSR_Id;
    }
   
    @Column(name="ConsumeCDSR_Sr_No")
    public int getConsume_CDSR_sr_no() {
        return consume_CDSR_sr_no;
    }

    public void setConsume_CDSR_sr_no(int consume_CDSR_sr_no) {
        this.consume_CDSR_sr_no = consume_CDSR_sr_no;
    }

    @Column(name="ConsumeCDSR_No")
    public int getConsume_CDSR_no() {
        return consume_CDSR_no;
    }

    public void setConsume_CDSR_no(int consume_CDSR_no) {
        this.consume_CDSR_no = consume_CDSR_no;
    }

    @Column(name="ConsumeCDSR_Page_No")
    public int getConsume_CDSR_page_no() {
        return consume_CDSR_page_no;
    }

    public void setConsume_CDSR_page_no(int consume_CDSR_page_no) {
        this.consume_CDSR_page_no = consume_CDSR_page_no;
    }

    @Column(name="ConsumeCDSR_Product_Name")
    public String getConsume_product_name() {
        return consume_product_name;
    }

    public void setConsume_product_name(String consume_product_name) {
        this.consume_product_name = consume_product_name;
    }

   @Column(name="Consume_Order_No")
    public int getConsume_order_no() {
        return Consume_order_no;
    }

    public void setConsume_order_no(int Consume_order_no) {
        this.Consume_order_no = Consume_order_no;
    }

    @Column(name="Consume_Date_Of_Purchase")
    public String getConsume_date_of_purchase() {
        return consume_date_of_purchase;
    }

    public void setConsume_date_of_purchase(String consume_date_of_purchase) {
        this.consume_date_of_purchase = consume_date_of_purchase;
    }

    @Column(name="Consume_Cost_Per_Unit")
    public long getConsume_cost_per_unit() {
        return consume_cost_per_unit;
    }

    public void setConsume_cost_per_unit(long consume_cost_per_unit) {
        this.consume_cost_per_unit = consume_cost_per_unit;
    }

    @Column(name="Consume_Total")
    public int getConsume_total() {
        return consume_total;
    }

    public void setConsume_total(int consume_total) {
        this.consume_total = consume_total;
    }

    @Column(name="Consume_Supplier_Name")
    public String getConsume_supplier_name() {
        return consume_supplier_name;
    }

    public void setConsume_supplier_name(String consume_supplier_name) {
        this.consume_supplier_name = consume_supplier_name;
    }

    @Column(name="Consume_Purchase_Year")
    public String getConsume_purchase_year() {
        return consume_purchase_year;
    }

    public void setConsume_purchase_year(String consume_purchase_year) {
        this.consume_purchase_year = consume_purchase_year;
    }
        
    @Column(name="Product_grant")
    public String getProduct_grant() {
        return product_grant;
    }


    public void setProduct_grant(String product_grant) {
        this.product_grant = product_grant;
    }
    
    @Column(name="Product_unit")
    public String getProduct_unit() {
        return product_unit;
    }

    public void setProduct_unit(String product_unit) {
        this.product_unit = product_unit;
    }
    
    @Column(name="Consume_purchase_quantity")
    public long getConsume_purchase_quantity() {
        return consume_purchase_quantity;
    }

    public void setConsume_purchase_quantity(long consume_purchase_quantity) {
        this.consume_purchase_quantity = consume_purchase_quantity;
    }

    @Column(name="final_product_quantity")
    public long getFinal_product_quantity() {
        return final_product_quantity;
    }

    public void setFinal_product_quantity(long final_product_quantity) {
        this.final_product_quantity = final_product_quantity;
    }
    
    
}
