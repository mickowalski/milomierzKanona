package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.entity.Cruise;
import pl.coderslab.entity.Customer;
import pl.coderslab.entity.Details;
import pl.coderslab.repository.CruiseRepository;
import pl.coderslab.repository.CustomerRepository;
import pl.coderslab.repository.DetailsRepository;

import javax.validation.Valid;
import java.util.List;


@Controller
@RequestMapping("/cruises")
public class CruiseController {

    @Autowired
    CruiseRepository cruiseRepository;

    @Autowired
    DetailsRepository detailsRepository;

    @Autowired
    CustomerRepository customerRepository;

    @RequestMapping("")
    public String unspecified() {
        return "cruises/list";
    }

    @GetMapping("/form")
    public String showFom(@RequestParam(required = false) Long id, Model model) {
        Cruise cruise = id == null ? new Cruise() : cruiseRepository.findOne(id);
        model.addAttribute("cruise", cruise);
        return "cruises/form";
    }

    @PostMapping("/form")
    public String saveForm(@Valid Cruise cruise, BindingResult result) {
        if (result.hasErrors()) {
            return "cruises/form";
        }
        cruise.setArchive(false);
        cruiseRepository.save(cruise);
        return "redirect: /cruises";
    }

    @GetMapping("/toArchive")
    public String archive(@RequestParam Long id) {
        Cruise toArchive = cruiseRepository.findOne(id);
        toArchive.setArchive(true);
        cruiseRepository.save(toArchive);

        List<Cruise> lastCruises = cruiseRepository.findAllArchive();
        List<Long> prevRankingPosition = customerRepository.findCustomerIdForRankingByDate(lastCruises.get(1).getEnd());
        List<Long> lastRankingPosition = customerRepository.findCustomerIdForRankingByDate(lastCruises.get(0).getEnd());

        if (!prevRankingPosition.isEmpty()) {
            for (Long customerId : prevRankingPosition) {
                Customer customer = customerRepository.findOne(customerId);
                if (prevRankingPosition.indexOf(customerId) == lastRankingPosition.indexOf(customerId)) {
                    customer.setRankingChange(0);
                }
                if (prevRankingPosition.indexOf(customerId) > lastRankingPosition.indexOf(customerId)) {
                    customer.setRankingChange(1);
                }
                if (prevRankingPosition.indexOf(customerId) < lastRankingPosition.indexOf(customerId)) {
                    customer.setRankingChange(-1);
                }
                customerRepository.save(customer);
            }
        }
        return "redirect: /cruises/archive";
    }

    @RequestMapping("/archive")
    public String showArchiveList() {
        return "cruises/archive";
    }

    @GetMapping("/confirmDelete")
    public String confirmDelete() {
        return "cruises/delete";
    }

    @RequestMapping("/delete")
    public String deleteCruise(@RequestParam Long id) {
        List<Details> details = detailsRepository.findAllDetailsByCruiseId(id);
        detailsRepository.delete(details);
        cruiseRepository.delete(id);
        return "redirect:/cruises";
    }

    @ModelAttribute("cruises")
    public List<Cruise> getAllCruises() {
        return cruiseRepository.findAllNotArchive();
    }

    @ModelAttribute("archive")
    public List<Cruise> getArchive() {
        return cruiseRepository.findAllArchive();
    }

}
