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
@RequestMapping("/details")
public class DetailsController {

    @Autowired
    DetailsRepository detailsRepository;
    @Autowired
    CruiseRepository cruiseRepository;
    @Autowired
    CustomerRepository customerRepository;

    @GetMapping("")
    public String unspecified(@RequestParam Long cruiseId, Model model) {
        model.addAttribute("count", detailsRepository.detailsCount(cruiseId));
        model.addAttribute("cruise", cruiseRepository.findOne(cruiseId));
        model.addAttribute("list", detailsRepository.findAllDetailsByCruiseId(cruiseId));
        return "details/list";
    }

    @GetMapping("/form")
    public String showForm(@RequestParam(required = false) Long id, @RequestParam Long cruiseId, Model model) {
        Details details = id == null ? new Details() : detailsRepository.findOne(id);
        Cruise cruise = cruiseRepository.findOne(cruiseId);
        details.setCruise(cruise);
        model.addAttribute("details", details);
        return "details/form";
    }

    @PostMapping("/form")
    public String save(@Valid Details details, BindingResult result) {
        if (result.hasErrors()) {
            return "details/form";
        }
        Long crId = details.getCruise().getId();
        List<Details> list = detailsRepository.findAllDetailsByCruiseId(crId);
        details.setCurPpl(list.size() + 1);
        detailsRepository.save(details);
        return "redirect: /details?cruiseId=" + crId;
    }

    @ModelAttribute("allDetails")
    public List<Details> getAllDetails() {
        return detailsRepository.findAll();
    }

    @GetMapping("/confirmDelete")
    public String confirmDelete(Model model) {
        return "details/delete";
    }

    @RequestMapping("/delete")
    public String deleteCruise(@RequestParam Long id) {
        Details details = detailsRepository.findOne(id);
        Long crId = details.getCruise().getId();
        details.setCruise(null);
        details.setCustomer(null);
        detailsRepository.delete(id);
        return "redirect:/details?cruiseId=" + crId;
    }

    @ModelAttribute("clients")
    public List<Customer> getClients() {
        return customerRepository.findAll();
    }

}
