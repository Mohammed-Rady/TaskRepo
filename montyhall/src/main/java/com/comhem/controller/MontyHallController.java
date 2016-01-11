package com.comhem.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.comhem.model.Box;
import com.comhem.model.BoxValue;
import com.comhem.model.GameSession;

@Controller
@Scope("session")
public class MontyHallController {

    @Autowired
    private GameSession gameSession;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getHomePage(Model model, @RequestParam(value = "boxNumber", required = false) Integer boxNumber,
            @RequestParam(value = "round", required = false) Integer round) {

        if (null == round || 0 == round) {
            performRound0();
        } else if (round == 1) {
            performRound1(boxNumber);
        } else if (round == 2) {
            performRound2(model, boxNumber);
        }

        model.addAttribute("gameSession", gameSession);
        return "home";
    }

    private void performRound2(Model model, Integer boxNumber) {
        for (int i = 0; i < gameSession.getBoxes().size(); i++) {
            gameSession.getBoxes().get(i).setSelected(false);
        }
        gameSession.getBoxes().get(boxNumber).setSelected(true);
        gameSession.setRound(2);

        for (int i = 0; i < gameSession.getBoxes().size(); i++) {
            if (gameSession.getBoxes().get(i).isSelected()
                    && gameSession.getBoxes().get(i).getBoxValue() == BoxValue.MONEY) {
                model.addAttribute("result", "success");
            }
        }
    }

    private void performRound1(Integer boxNumber) {
        gameSession.getBoxes().get(boxNumber).setSelected(true);
        for (int i = 0; i < gameSession.getBoxes().size(); i++) {
            if (gameSession.getBoxes().get(i).isSelected() == false
                    && gameSession.getBoxes().get(i).getBoxValue() != BoxValue.MONEY) {
                gameSession.getBoxes().get(i).setEmptyAndOpened(true);
                break;
            }
        }
        gameSession.setRound(1);
    }

    private void performRound0() {
        gameSession = new GameSession();
        // Initialize the game
        for (int i = 0; i < 3; i++) {
            Box box = new Box();
            box.setBoxNumber(i);
            gameSession.getBoxes().add(box);
        }

        gameSession.setRound(0);

        Random rand = new Random();
        int randomNum = rand.nextInt(3);
        gameSession.getBoxes().get(randomNum).setBoxValue(BoxValue.MONEY);
    }

}
