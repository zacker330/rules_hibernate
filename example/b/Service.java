package example.b;
import jakarta.persistence.*;
import org.hibernate.annotations.TenantId;

@Entity
@Table(name = "cp_services")
public class Service {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;


    @TenantId
    private String tenantId;

    public void receive(){
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTenantId() {
        return tenantId;
    }

    public void setTenantId(String tenantId) {
        this.tenantId = tenantId;
    }
}
