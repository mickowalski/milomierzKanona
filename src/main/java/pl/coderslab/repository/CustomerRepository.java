package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.entity.Customer;

import java.util.Date;
import java.util.List;

public interface CustomerRepository extends JpaRepository<Customer, Long> {

    Customer findFirstByEmail(String email);

    @Query(value = "SELECT c.id, c.firstName, c.lastName, SUM(d.miles) AS sumed FROM Customer c JOIN c.details d GROUP BY c.id Order BY sumed Desc")
    List<Object[]> findAllForRanking();

    @Query(value = "SELECT cu.id, cu.firstName, cu.lastName, cr.name, cr.start, cr.end, cr.yacht, cr.yachtDesc, d.curPpl, d.miles FROM Details d JOIN d.customer cu JOIN d.cruise cr WHERE cu.id=?1 Order BY cr.start ASC ")
    List<Object[]> CruiseDetailsByUser(Long id);

    @Query(value = "SELECT c.id, c.firstName, c.lastName, SUM(d.miles) AS sumed FROM Details d JOIN d.customer c JOIN d.cruise cr WHERE cr.end<=?1 GROUP BY c.id ORDER BY sumed DESC")
    List<Object[]> findAllForRankingByDate(Date dateForm);
}
