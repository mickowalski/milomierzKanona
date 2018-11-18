package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.entity.User;
import pl.coderslab.repository.UserRepository;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserRepository userRepository;

    @GetMapping("/login")
    public String showLogin(Model model) {
        model.addAttribute("user", new User());
        return "/user/login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute User user, Model model, HttpSession session) {
        User existingUser = userRepository.findFirstByEmail(user.getEmail());
        if (existingUser != null && existingUser.getEmail().equals(user.getEmail())
                && existingUser.getPassword().equals(user.getPassword())) {
            session.setAttribute("logged", existingUser);
            return "redirect:/cruises";
        } else {
            model.addAttribute("loginError", "Nieprawidłowy email lub hasło");
            return "user/login";
        }
    }

    @GetMapping("/edit")
    public String showEditUserForm(@RequestParam Long id, Model model) {
        User editedUser = userRepository.getOne(id);
        model.addAttribute("editedUser", editedUser);
        return "user/form";
    }

    @GetMapping("/add")
    public String showEditUserForm(Model model) {
        User editedUser = new User();
        model.addAttribute("editedUser", editedUser);
        return "user/form";
    }

    @PostMapping("/edit")
    public String EditUser(@Valid User user, BindingResult result) {
        if (!user.getPassword().equals(user.getConfirmPass())) {
            FieldError passwordMismatch = new FieldError("user", "password", "Hasła muszą być takie same");
            result.addError(passwordMismatch);
        }
        if (result.hasErrors()) {
            return "user/form";
        }

        userRepository.save(user);
        return "redirect:/cruises/list";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("logged");
        return "redirect:/";
    }

    @GetMapping("/delete")
    public String confirmDelete() {
        return "/user/delete";
    }

}
