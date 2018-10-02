package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.entity.Customer;
import pl.coderslab.repository.CustomerRepository;

import javax.validation.Valid;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("customers")
public class CustomerController {

    final
    CustomerRepository customerRepository;

    @Autowired
    public CustomerController(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    @RequestMapping("")
    public String unspecified() {
        return "customers/list";
    }

    @ModelAttribute("customers")
    public List<Customer> getAllCustomers() {
        return customerRepository.getAllByOrderByLastNameAsc();
    }

    @GetMapping("/form")
    public String addCustomer(@RequestParam(required = false) Long id, Model model) {
        Customer customer = id == null ? new Customer() : customerRepository.findOne(id);
        model.addAttribute("customer", customer);
        return "customers/form";
    }

    @PostMapping("/form")
    public String saveCustomer(@Valid Customer customer, BindingResult result) {
        if (result.hasErrors()) {
            return "customers/form";
        }
        Customer exisitingCustomer = customerRepository.findFirstByEmail(customer.getEmail());
        if (exisitingCustomer != null && customer.getId() == null) {
            FieldError error = new FieldError("customer", "email", "Email musi być unikalny");
            result.addError(error);
            return "customers/form";
        }
        customerRepository.save(customer);
        return "redirect:/customers";
    }

    @GetMapping("/confirmDelete")
    public String confirmDelete() {
        return "customers/delete";
    }

    @RequestMapping("/delete")
    public String deleteCustomer(@RequestParam Long id) {
        customerRepository.delete(id);
        return "redirect:/customers";
    }

    @GetMapping("/ranking")
    public String ranking(Model model) {
        Date dateForm = new Date();
        model.addAttribute("mom", customerRepository.findAllForRankingByDate(dateForm));
        return "/ranking/mom";
    }

    @PostMapping("/ranking")
    public String rankingPast(@RequestParam String pastDate, Model model) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date checkDate = null;
        try {
            checkDate = dateFormat.parse(pastDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if (checkDate == null) checkDate = new Date();
        model.addAttribute("mom", customerRepository.findAllForRankingByDate(checkDate));
        model.addAttribute("headerText", "Ranking stan na dzień " + pastDate);
        return "/ranking/pastMom";
    }

    @GetMapping("ranking/details")
    public String rankingDetails(@RequestParam Long id, Model model) {
        model.addAttribute("details", customerRepository.CruiseDetailsByUser(id));

        return "ranking/details";
    }

}
