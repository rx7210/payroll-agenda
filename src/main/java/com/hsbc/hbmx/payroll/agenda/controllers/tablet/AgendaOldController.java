package com.hsbc.hbmx.payroll.agenda.controllers.tablet;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.hsbc.hbmx.payroll.agenda.beans.Accounts;
import com.hsbc.hbmx.payroll.agenda.beans.CameraProperties;
import com.hsbc.hbmx.payroll.agenda.beans.Document;
import com.hsbc.hbmx.payroll.agenda.beans.DocumentosImg;
import com.hsbc.hbmx.payroll.agenda.beans.ImageDocument;
import com.hsbc.hbmx.payroll.agenda.beans.Schedule;
import com.hsbc.hbmx.payroll.agenda.beans.Solicitud;
import com.hsbc.hbmx.payroll.agenda.beans.ThCuentasAgenda;
import com.hsbc.hbmx.payroll.agenda.beans.User;
import com.hsbc.hbmx.payroll.agenda.pdfs.EncodeDecodeFile;
//import com.hsbc.hbmx.payroll.agenda.process.ExecTask;
//import com.hsbc.hbmx.payroll.agenda.process.InsertImageProcess;
//import com.hsbc.hbmx.payroll.agenda.service.impl.AgendaServiceImpl;
//import com.hsbc.hbmx.payroll.agenda.beans.IwhImageDocumentsRequest; //Irving

//import com.hsbc.hbmx.payroll.agenda.service.AdminService; //Irving
//import com.hsbc.hbmx.payroll.agenda.service.AgendaService; //Irving
//import com.hsbc.hbmx.payroll.agenda.service.DocumentsService; //Irving
//import com.hsbc.hbmx.payroll.agenda.service.LogService; //Irving
//import com.hsbc.hbmx.payroll.agenda.service.SolicitudService; //Irving
//import com.hsbc.hbmx.payroll.agenda.service.impl.IwhServiceReadImpl; //Irving
//import com.hsbc.hbmx.payroll.agenda.service.impl.SqlsAgenda; //Irving
//import com.hsbc.hbmx.payroll.agenda.service.DocumentsRequiredDocumentsResponse; //Irving

import com.hsbc.hbmx.payroll.agenda.utils.Constants;
//import com.hsbc.hbmx.payroll.agenda.utils.IwhUtils; Irving
import com.hsbc.hbmx.payroll.agenda.utils.Utils;

@Controller
@SessionAttributes({"user"})
public class AgendaOldController extends Utils {
	
	/**
     * Logger.
     */
    private final Logger LOGGER = Logger.getLogger(AgendaOldController.class.getName());
    
    /**
     * <p>
     * <b> Model and View. </b>
     * </p>
     */
    private ModelAndView mav = null;
    
    @RequestMapping(value = "/loginTabletOld", method = RequestMethod.GET)
    public final ModelAndView splashPage(final HttpServletRequest request) {
        this.mav = new ModelAndView("tablet/loginTablet_old", "command", new User());

        return this.mav;
    }
    
    /**
     * <p>
     * <b> Send to welcome tablet page. Multiplica</b>
     * </p>
     * 
     * @param request
     *            HttpServletRequest
     * @return ModelAndView
     */
    @RequestMapping(value = "/loginValidOld", method = RequestMethod.POST)
    public final ModelAndView loginValidtPage(final HttpServletRequest request) {
        this.mav = new ModelAndView("tablet/welcome_old", "command", new User());

        return this.mav;
    }
    
    /**
     * <p>
     * <b> Show home tablet application. </b>
     * </p>
     * 
     * @param httpSession
     *            HttpSession
     * @return ModelAndView
     */
    @RequestMapping(value = "/homeAgendaOld", method = RequestMethod.POST)
    public final ModelAndView homeAgenda(final HttpSession httpSession) {
    	this.mav = new ModelAndView("tablet/agenda_old");
    	try {
	    	final User user = (User) httpSession.getAttribute("user");
	    	
	        List<Schedule> dataList = new ArrayList<Schedule>();
//	        dataList = this.agendaService.getCompanyList(user.getUserId());  //Irving
	        
	        MockGeneration mockGeneration = new MockGeneration();
	        dataList = mockGeneration.getCompanyList();

	        this.mav.addObject("regsXPage", pagination());
	        this.mav.addObject("lstCompanies", dataList);
	        this.mav.addObject("countCompanies", dataList.size());
	
	        log(user, "Consulta empresas con cuentas asignadas");
    	} catch(Exception exc) {
    		this.LOGGER.error(stackTracetoString(exc));
    		this.mav.addObject("message", "Ocurrio un error, Favor de dar click en el boton Mi Agenda y Actividades");
    		
    	}
        return this.mav;
    }
    
    /**
     * Get the number of records by page.
     * 
     * @return String
     */
    private String pagination() {
        String regsXPage = "";
//        		this.adminService.getValVariable(Constants.PAGINACION_AGENDA); //Irving
        if (StringUtils.isBlank(regsXPage)) {
            regsXPage = "9";
        }

        return regsXPage;
    }
    
    /**
     * <p>
     * <b> Insert log. </b>
     * </p>
     * 
     * @param user
     *            User object
     * @param msg
     *            Message
     */
    private void log(final User user, final String msg) {
        this.LOGGER.info(msg);
//        this.logService.insertLog(user, msg.toUpperCase());
    }


}
