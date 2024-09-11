package com.yorizip.myapp;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    /**
     * Simply selects the home view to render by returning its name.
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Locale locale, Model model) {
        logger.info("Welcome home! The client locale is {}.", locale);

        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

        String formattedDate = dateFormat.format(date);

        model.addAttribute("serverTime", formattedDate);

        return "Index";
    }

    @RequestMapping(value = "/Index", method = RequestMethod.POST)
    public String Index(Locale locale, Model model) {
        logger.info("Index ����", locale);

        return "Index";
    }

    // ���� GET �޼���
    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String mainGet(Locale locale, Model model) {
        // GET ��û ó�� ����
        return "minigame/main";  // JSP ���� ��� ��ȯ
    }

    // POST ��û ó�� �޼��� �߰�
    @RequestMapping(value = "/main", method = RequestMethod.POST)
    public String mainPost(Locale locale, Model model) {
        // POST ��û ó�� ����
        return "minigame/main";  // JSP ���� ��� ��ȯ
    }

    @RequestMapping(value = "/result", method = RequestMethod.GET)
    public String result(Locale locale, Model model) {

        return "/minigame/result";
    }


}



