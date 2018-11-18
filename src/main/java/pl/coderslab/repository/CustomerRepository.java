package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.entity.Customer;

import java.util.Date;
import java.util.List;

public interface CustomerRepository extends JpaRepository<Customer, Long> {

    Customer findFirstByEmail(String email);

    List<Customer> getAllByOrderByLastNameAsc();

    @Query(value = "SELECT cr.id, cr.name, cr.start, cr.end, cr.yacht, cr.yachtDesc, d.miles FROM Details d JOIN d.customer cu JOIN d.cruise cr WHERE cu.id=?1 Order BY cr.start ASC ")
    List<Object[]> CruiseDetailsByUser(Long id);

    @Query(value = "SELECT c.id, c.firstName, c.lastName, c.rankingChange, SUM(d.miles) AS sumed FROM Details d JOIN d.customer c JOIN d.cruise cr WHERE cr.end<=?1 AND cr.archive = true GROUP BY c.id ORDER BY sumed DESC")
    List<Object[]> findAllForRankingByDate(Date dateForm);

    @Query(value = "SELECT c.id FROM Details d JOIN d.customer c JOIN d.cruise cr WHERE cr.end<=?1 AND cr.archive = true GROUP BY c.id ORDER BY SUM (d.miles) DESC")
    List<Long> findCustomerIdForRankingByDate(Date dateForm);

    List<Customer> findAllByMailingListIsTrueAndEmailIsNotNullAndRankingChangeIsNot(int change);

//    @Query(value = "SELECT cr.name, cr.start, cr.end, cr.yacht, cr.yachtDesc, d.miles, cu.firstName, cu.lastName FROM Cruise cr JOIN cr.details d JOIN d.customer cu WHERE cu.id=?1 ORDER BY cr.start ASC")
//    List<Object[]> CruisesDetailsByUser(Long id);
}
