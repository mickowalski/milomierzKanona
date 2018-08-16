package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.entity.Details;


public interface DetailsRepository extends JpaRepository<Details, Long> {

//    @Query(nativeQuery = true, value = "SELECT * FROM cruise_details LEFT JOIN cruises ON cruise_details.cruise_id=cruises.id WHERE cruises.id=?1")
//    List<Details> findAllDetailsByCruiseId(Long id);
//
//    List<Details> findAllByCruiseId(Long id);
//
//    @Query("SELECT COUNT (d) FROM Details d JOIN d.cruise c WHERE c.id=?1")
//    String detailsCount(Long id);
}
