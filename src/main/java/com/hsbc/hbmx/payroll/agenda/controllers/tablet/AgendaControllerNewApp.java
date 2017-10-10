package com.hsbc.hbmx.payroll.agenda.controllers.tablet;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.hsbc.hbmx.payroll.agenda.beans.User;

/**
 * <p>
 * <b> AgendaController. </b>
 * </p>
 */
@Controller
@SessionAttributes({"user"})
public class AgendaControllerNewApp {
	
	/**
     * Logger.
     */
    private final Logger LOGGER = Logger.getLogger(AgendaController.class.getName());

    /**
     * <p>
     * <b> Model and View. </b>
     * </p>
     */
    private ModelAndView mav = null;
    
    /**
     * Firma.
     */
    private static final String FIRMA = "FIRMA";
    
    /**
     * <p>
     * <b> send to my profile page. Multiplica</b>
     * </p>
     * 
     * @param request
     *            HttpServletRequest
     * @return ModelAndView
     */
    @RequestMapping(value = "/myProfile", method = RequestMethod.POST)
    public final ModelAndView splashPage(final HttpServletRequest request) {
        this.mav = new ModelAndView("tablet/myProfile", "command", new User());
        return this.mav;
    }

}
