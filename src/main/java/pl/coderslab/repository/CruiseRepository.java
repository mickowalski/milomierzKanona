package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.entity.Cruise;

import java.util.List;

public interface CruiseRepository extends JpaRepository<Cruise, Long> {
    @Query("SELECT c FROM Cruise c WHERE c.archive=false ORDER BY c.end DESC")
    List<Cruise> findAllNotArchive();

    @Query("SELECT c FROM Cruise c WHERE c.archive=true ORDER BY c.end DESC")
    List<Cruise> findAllArchive();

}
