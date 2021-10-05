package DSR.POJO;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="Login", catalog="deadstockregister")
public class Login implements Serializable {

    @Id@GeneratedValue(strategy=IDENTITY)
    private int lid;
    private String usname;
    private String passw;
    
    @Column(name="LID", unique=true)
    public int getLid() {
        return lid;
    }

    public void setLid(int lid) {
        this.lid = lid;
    }
    
    //@Column(name="Username",unique=true)
    public String getUsname() {
        return usname;
    }

    public void setUsname(String usname) {
        this.usname = usname;
    }
    
    //@Column(name="Password", unique=true)
    public String getPassw() {
        return passw;
    }

    public void setPassw(String passw) {
        this.passw = passw;
    }

}
