package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.entity.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Long> {

    Customer findFirstByEmail(String email);

//    @Query(value = "SELECT c.id, c.firstName, c.lastName, SUM(d.miles) AS sumed FROM Customer c JOIN c.details d GROUP BY c.id Order BY sumed Desc")
//    List<Object[]> findAllForRanking();

//    @Query(value = "SELECT cu.id, cu.firstName, cu.lastName, cr.name, cr.start, cr.end, cr.yacht, cr.yachtDesc, d.curPpl, d.miles FROM Details d JOIN d.customer cu JOIN d.cruise cr WHERE cu.id=?1 Order BY cr.start ASC ")
//    List<Object[]> CruiseDetailsByUser(Long id);


}
