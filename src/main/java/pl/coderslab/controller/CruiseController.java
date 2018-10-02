package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
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
import java.util.ArrayList;
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

    @Autowired
    private MailSender mailSender;

    @Autowired
    private SimpleMailMessage mailMessage;

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
        List<Long> prevRankingPosition = new ArrayList<>();
        List<Long> lastRankingPosition = new ArrayList<>();
        if (lastCruises.size() >= 2) {
            prevRankingPosition = customerRepository.findCustomerIdForRankingByDate(lastCruises.get(1).getEnd());
            lastRankingPosition = customerRepository.findCustomerIdForRankingByDate(lastCruises.get(0).getEnd());
        }
        if (!prevRankingPosition.isEmpty() && !lastRankingPosition.isEmpty()) {
            for (Long customerId : prevRankingPosition) {
                Customer customer = customerRepository.findOne(customerId);
                customer.setPrvRanking(prevRankingPosition.indexOf(customerId) + 1);
                customer.setCurRanking(lastRankingPosition.indexOf(customerId) + 1);
                if (customer.getPrvRanking() == customer.getCurRanking()) {
                    customer.setRankingChange(0);
                }
                if (customer.getPrvRanking() > customer.getCurRanking()) {
                    customer.setRankingChange(1);
                }
                if (customer.getPrvRanking() < customer.getCurRanking()) {
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

    @GetMapping("/sendEmail")
    public String sendEmail() {

        List<Customer> mailingList = customerRepository.findAllByMailingListIsTrueAndEmailIsNotNullAndRankingChangeIsNot(0);
        String rankingCheck = "Spadek";
        SimpleMailMessage msg = new SimpleMailMessage(mailMessage);
        msg.setSubject("Milomierz Kanona");
        for (Customer customer : mailingList) {
            if (customer.getRankingChange() == 1) {
                rankingCheck = "Wzrost";
            } else {
                rankingCheck = "spadek";
            }
            msg.setTo(customer.getEmail());
            msg.setText("Cześć Milomierzowcu." +
                    "\n\n Twoja aktualna pozycja w Milomierzu Kanona to " + customer.getCurRanking() + " miejsce." +
                    rankingCheck + " z " + customer.getPrvRanking() + "miejsca. " +
                    "Zapisuj się na rejsy. Płyniemy dalej. " +
                    "\n\n Pozdrowienia Kanon");
            mailSender.send(msg);
        }
        return "redirect:/cruises/archive";
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
