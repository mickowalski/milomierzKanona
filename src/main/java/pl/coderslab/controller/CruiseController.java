package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.entity.Cruise;
import pl.coderslab.entity.Details;
import pl.coderslab.repository.CruiseRepository;
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

    @RequestMapping("")
    public String unspecified(){
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
        return "redirect: /cruises";
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
        for (Details detail : details) {
            detailsRepository.delete(detail);
        }
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
