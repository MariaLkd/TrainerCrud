/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.assignment.controllers;

import com.assignment.entities.Trainer;
import com.assignment.services.TrainerServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Maria
 */
@Controller("/")
@RequestMapping("/")
public class TrainerController {

    @Autowired
    private TrainerServiceImpl trainerService;

    @GetMapping("/")
    public String getTrainers(Model model) {
        List<Trainer> trainers = trainerService.getTrainers();
        model.addAttribute("trainers", trainers);
        return ("trainers");
    }

    @GetMapping("/new")
    public String newTrainer(Model model) {
        Trainer trainer = new Trainer();
        model.addAttribute("trainer", trainer);
        model.addAttribute("title", "New Trainer");
        model.addAttribute("h1", "New Trainer");
        model.addAttribute("action", "new");
        return ("new-edit");
    }

    @PostMapping("/new")
    public String insertTrainer(@ModelAttribute(name = "trainer") Trainer trainer, Model model) {
        if (trainerService.insertTrainer(trainer)) {
            List<Trainer> trainers = trainerService.getTrainers();
            model.addAttribute("trainers", trainers);
            return ("trainers");
        } else {
            return ("/new");
        }
    }

    @GetMapping("/edit/{trainerid}")
    public String editTrainer(@PathVariable(name = "trainerid") int id, Model model) {
        Trainer trainer = trainerService.getById(id);
        model.addAttribute("trainer", trainer);
        model.addAttribute("title", "Edit Trainer");
        model.addAttribute("h1", "Edit Trainer");
        model.addAttribute("action", "/update");
        return ("new-edit");
    }

    // GET or POST????
    @PostMapping("/update")
    public String updateTrainer(@ModelAttribute(name = "trainer") Trainer trainer, Model model) {
        trainerService.updateTrainer(trainer);
        List<Trainer> trainers = trainerService.getTrainers();
        model.addAttribute("trainers", trainers);
        return ("trainers");
    }

    @GetMapping("/delete/{trainerid}")
    public String deleteTrainer(@PathVariable(name = "trainerid") int id, Model model) {
        if (trainerService.findById(id)) {
            trainerService.deleteById(id);
            List<Trainer> trainers = trainerService.getTrainers();
            model.addAttribute("trainers", trainers);
            return ("trainers");
        } else {
            return ("redirect:/");
        }

    }

}
