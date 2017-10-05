/*
 * COPYRIGHT. HSBC HOLDINGS PLC 2017. ALL RIGHTS RESERVED.
 * 
 * This software is only to be used for the purpose for which it has been
 * provided. No part of it is to be reproduced, disassembled, transmitted,
 * stored in a retrieval system nor translated in any human or computer
 * language in any way or for any other purposes whatsoever without the prior
 * written consent of HSBC Holdings plc.
 */
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

/**
 * <p>
 * <b> AgendaController. </b>
 * </p>
 */
@Controller
@SessionAttributes({"user"})
public class AgendaController extends Utils {

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
     * <p>
     * <b> LogService. </b>
     * </p>
     */
//    @Autowired //Irving
//    private LogService logService; //Irving

    /**
     * <p>
     * <b> AgendaService. </b>
     * </p>
     */
//    @Autowired //Irving
//    private AgendaService agendaService; //Irving

    /**
     * <p>
     * <b> DocumentsService. </b>
     * </p>
     */
//    @Autowired //Irving
//    private DocumentsService documentsService; //Irving

    /**
     * <p>
     * <b> AdminService. </b>
     * </p>
     */
//    @Autowired //Irving
//    private AdminService adminService; //Irving

    /**
     * <p>
     * <b> SolicitudService. </b>
     * </p>
     */
//    @Autowired //Irving
//    private SolicitudService solicitudService; //Irving

    /**
     * Firma.
     */
    private static final String FIRMA = "FIRMA";

    
    /**
     * <p>
     * <b> Send to splash before login tablet page. Multiplica</b>
     * </p>
     * 
     * @param request
     *            HttpServletRequest
     * @return ModelAndView
     */
    @RequestMapping(value = "/loginTablet", method = RequestMethod.GET)
    public final ModelAndView splashPage(final HttpServletRequest request) {
        this.mav = new ModelAndView("tablet/splash", "command", new User());

        return this.mav;
    }
    
    
    /**
     * <p>
     * <b> Send to login tablet page. Multiplica</b>
     * </p>
     * 
     * @param request
     *            HttpServletRequest
     * @return ModelAndView
     */
    @RequestMapping(value = "/loginTabletAfter", method = RequestMethod.POST)
    public final ModelAndView loginTabletPage(final HttpServletRequest request) {
        this.mav = new ModelAndView("tablet/loginTablet", "command", new User());

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
    @RequestMapping(value = "/loginValid", method = RequestMethod.POST)
    public final ModelAndView loginValidtPage(final HttpServletRequest request) {
        this.mav = new ModelAndView("tablet/welcome", "command", new User());

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
    @RequestMapping(value = "/homeAgenda", method = RequestMethod.POST)
    public final ModelAndView homeAgenda(final HttpSession httpSession) {
    	this.mav = new ModelAndView("tablet/agenda");
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
     * <p>
     * <b> Schedule company. </b>
     * </p>
     * 
     * @param httpSession
     * @param request
     * @return
     */
    @RequestMapping(value = "/agendar", method = RequestMethod.POST)
    public final ModelAndView agendar(final HttpSession httpSession, final HttpServletRequest request) {
        this.mav = new ModelAndView("tablet/agenda");
        try {
        	final User user = (User) httpSession.getAttribute("user");
        	
        	System.out.println("*******************************  /agendar nameCompany:" + request.getParameter("nameCompany"));
        	System.out.println("*******************************  /agendar keyVisit:" + request.getParameter("keyVisit"));
        	System.out.println("*******************************  /agendar datepicker:" + request.getParameter("datepicker"));
        	System.out.println("*******************************  /agendar hours:" + request.getParameter("hours"));
        	System.out.println("*******************************  /agendar minutes:" + request.getParameter("minutes"));
        	System.out.println("*******************************  /agendar ampm:" + request.getParameter("ampm"));
        	
//	        final String nameCompany = request.getParameter("nameCompany");
//	        final String keyVisit = request.getParameter("keyVisit");
//	        final String date = request.getParameter("datepicker");
//	        final String hours = request.getParameter("hours");
//	        final String minutes = request.getParameter("minutes");
//	        String ampm = request.getParameter("ampm");
	
//	        int horas = Integer.parseInt(hours);
//	        if (StringUtils.equalsIgnoreCase("PM", ampm)) {
//	            if (Integer.parseInt(hours) < 12) {
//	                horas = Integer.parseInt(hours) + 12;
//	            }
//	        }
//	        if (StringUtils.equalsIgnoreCase("AM", ampm)) {
//	            if (Integer.parseInt(hours) == 12) {
//	                horas = 0;
//	            }
//	        }
//	
//	        final String agendaDate = date + " " + completeHourMinute(String.valueOf(horas)) + ":" + completeHourMinute(minutes)
//	            + ":00 " + ampm;
	
	        try {
//	        	int totDays = 10;
//	            int totDays = this.agendaService.getIntValue(SqlsAgenda.GET_DAYS_POC, keyVisit); //Irving
//	        	Date dateCreateAccount = new Date();
//	        	dateCreateAccount = this.agendaService.getDateCreateAccount(keyVisit) //Irving
//	            Date datePoc = datePoc(dateCreateAccount, totDays);
//	            Date dateSchedule = stringToDate(agendaDate, Constants.FMT_DDMMYYYY_HHMMSS_A);
	
//	            if (isValidDateForSchedule(dateToDateWithFormat(datePoc, Constants.FMT_DDMMYYYY),
//	                dateToDateWithFormat(dateSchedule, Constants.FMT_DDMMYYYY))) {
	
//	                this.agendaService.schedule(agendaDate, nameCompany, user.getUserId(), keyVisit); //Irving
	
//	                log(user, "Agendo Empresa " + nameCompany);
//	            } else {
//	                this.mav.addObject("message", "No es posible agendar la visita, por favor intenta con otra fecha");
//	            }
	        } catch (Exception exc) {
	            this.LOGGER.error(exc);
	            this.mav.addObject("message", "No es posible agendar la visita, verifique la fecha");
	        }
	
	        List<Schedule> dataList = new ArrayList<Schedule>();
	        MockGeneration mockGeneration = new MockGeneration();
	        dataList = mockGeneration.getCompanyList();
//	        dataList = this.agendaService.getCompanyList(user.getUserId()); //Irving
	
	        this.mav.addObject("regsXPage", pagination());
	        this.mav.addObject("lstCompanies", dataList);
	        this.mav.addObject("countCompanies", dataList.size());

        } catch(Exception exc) {
    		this.LOGGER.error(stackTracetoString(exc));
    		this.mav.addObject("message", "Ocurrio un error, " + exc.getMessage());
    		
    	}
        return this.mav;
    }

    /**
     * <p>
     * <b> Start visit. </b>
     * </p>
     * 
     * @param httpSession
     *            HttpSession
     * @param request
     *            HttpServletRequest
     * @return ModelAndView
     */
    @RequestMapping(value = "/startVisit", method = RequestMethod.POST)
    public final ModelAndView startVisit(final HttpSession httpSession, final HttpServletRequest request) {
        this.mav = new ModelAndView("tablet/company");
        try {
//	        final User user = (User) httpSession.getAttribute("user");
	        String keyVisit = request.getParameter("keyVisit");
	        String nameCompany = request.getParameter("nameCompany");
	        System.out.println("*******************************  /startVisit nameCompany:" + request.getParameter("nameCompany"));
        	System.out.println("*******************************  /startVisit keyVisit:" + request.getParameter("keyVisit"));
        	
//	
//	        if (StringUtils.isBlank(keyVisit) || StringUtils.isBlank(nameCompany)) {
//	            keyVisit = (String) httpSession.getAttribute("keyVisit");
//	            nameCompany = (String) httpSession.getAttribute("nameCompany");
//	        }
//	        if (1 == this.agendaService.getIntValue(SqlsAgenda.GET_STATUS_VISIT, keyVisit)) {  //Irving
//	        int valor = 1;
//	        if (1 == valor) {
//	            log(user, "Inicia visita Empresa " + nameCompany);
//	
// 	            this.agendaService.pendingVisit(keyVisit, nameCompany, user.getUserId());  //Irving
//	        }
	
	        List<Accounts> dataList = new ArrayList<Accounts>();
	        MockGeneration mockGeneration = new MockGeneration();
	        dataList = mockGeneration.getAccounts();
	        
//	        dataList = this.agendaService.accountsCompany(user.getUserId(), keyVisit);  //Irving
	
	        this.mav.addObject("regsXPage", pagination());
	        this.mav.addObject("nameCompany", nameCompany);
	        this.mav.addObject("keyVisit", keyVisit);
	        this.mav.addObject("lstAccounts", dataList);
        } catch(Exception exc) {
    		this.LOGGER.error(stackTracetoString(exc));
    		this.mav.addObject("error", "Ocurrio un error, " + exc.getMessage());
    		
    	}
        return this.mav;
    }

    /**
     * <p>
     * <b> Start account integration. </b>
     * </p>
     * 
     * @param httpSession
     *            HttpSession
     * @param request
     *            HttpServletRequest
     * @return ModelAndView
     */
    @RequestMapping(value = "/startIntegration", method = RequestMethod.POST)
    public final ModelAndView startIntegration(final HttpSession httpSession, final HttpServletRequest request) {
    	try {
	        final User user = (User) httpSession.getAttribute("user");
	        final String account = getAccount(httpSession, request);
	
	        log(user, "********** INICIA INTEGRACION CUENTA " + account + " **********");
	
	        // Delete documents if exist
//	        this.adminService.deleteDocuments(account); //Irving
	
	        // Set default values for integration
	        setDefaultValuesView(httpSession, request, new String());//Irving
	
	        //Register the Start integration
//	        this.adminService.adminAccountHistory(fillThCuentasAgenda(account, user.getUserId(), Constants.KEY_START_DIGIT, //Irving
//	            (String) httpSession.getAttribute("keyVisit"), "INICIA DIGITALIZACION"));  //Irving
	
	        showPersonalID(httpSession);
    	} catch(Exception exc) {
    		this.LOGGER.error(stackTracetoString(exc));
    		this.mav.addObject("error", "Ocurrio un error, " + exc.getMessage());
    		
    	}
        return this.mav;
    }

    /**
     * Show page for Personal ID.
     * @param httpSession HttpSession
     */
    private void showPersonalID(final HttpSession httpSession) {
    	Document document = new Document ();
//    	document = this.agendaService.getDocument(1);  //Irving
        
    	this.mav = new ModelAndView("tablet/integrar");
        this.mav.addObject("keyDocument", document.getCveDocument());
        this.mav.addObject("desDocument", document.getDesDocument());
        
        httpSession.setAttribute("typeDocument", "1");
        
        this.LOGGER.info("MUESTRA PAGINA PARA DIGITALIZAR IDENTIFICACION PERSONAL");
    }
    
    /**
     * Show page for Proof of Address.
     * @param httpSession HttpSession
     */
    private void showProofOfAddress(final HttpSession httpSession) {
    	Document document = new Document ();
//    	document = this.agendaService.getDocument(2); //Irving

    	
    	this.mav = new ModelAndView("tablet/integrar");
    	this.mav.addObject("keyDocument", document.getCveDocument());
        this.mav.addObject("desDocument", document.getDesDocument());
        
    	httpSession.setAttribute("typeDocument", "3");
    	
    	this.LOGGER.info("MUESTRA PAGINA PARA DIGITALIZAR COMPROBANTE DE DOMICILIO");
    }
    
    /**
     * Show page for Add format.
     * @param httpSession HttpSession
     */
    private void showADD(final HttpSession httpSession) {
   	 	// Formato ADD
       this.mav = new ModelAndView("tablet/add");
       this.mav.addObject("isOptional", 1);
       
       final String countriesOfResidence = "";
//       countriesOfResidence	= this.agendaService.getValueOf(Constants.COUNTRY_OF_RESIDENCE); //Irving
       List<String> countries = new ArrayList<String>(Arrays.asList(countriesOfResidence.split(",")));

       this.mav.addObject("countries", countries);
   }
    
    /**
     * Show page for Global Standard format.
     * @return ModelAndView View
     */
    @RequestMapping(value = "/globalStandard", method = RequestMethod.POST)
    public ModelAndView globalStandard() {
    	//Global standard
        this.mav = new ModelAndView("tablet/globalStandars");
        
        try {
	        List<String> countriesWithSanction = new ArrayList<String>(); 
//	        		new ArrayList<String>(Arrays.asList(this.agendaService.getValueOf( //Irving
//	                Constants.COUNTRY_WITH_SANCTION).split(","))); //Irving
	        List<String> countriesOfResidence = new ArrayList<String>(); 
//	        		new ArrayList<String>(Arrays.asList(this.agendaService.getValueOf( //Irving
//	                Constants.COUNTRY_OF_RESIDENCE).split(","))); //Irving
	
	        this.mav.addObject("countriesWithSanction", countriesWithSanction);
	        this.mav.addObject("countriesOfResidence", countriesOfResidence);
        } catch(Exception exc) {
    		this.LOGGER.error(stackTracetoString(exc));
    		this.mav.addObject("error", "Ocurrio un error, " + exc.getMessage());
    		
    	}
        return this.mav;
    }
    
    /**
     * Save data of Global Standard and send view for Sign Card.
     * @param globalStandarsVM Values for Global Standard
     * @param httpSession HttpSession
     * @return ModelAndView View
     */
    @RequestMapping(value = "/saveGlobalStandard", method = RequestMethod.POST)
    public ModelAndView saveGlobalStandard(@RequestBody final String globalStandarsVM, final HttpSession httpSession) {
    	try {
	    	//Put global standard values on session
	    	httpSession.setAttribute("globalStandarsVM", globalStandarsVM);
	    	
	    	this.LOGGER.info("GUARDA DATOS DE GLOBAL STANDARD EN SESION");
	    	
	    	//Show view for sign card
	    	showSignCard(httpSession);
    	} catch(Exception exc) {
    		this.LOGGER.error(stackTracetoString(exc));
    		this.mav.addObject("error", "Ocurrio un error, " + exc.getMessage());
    		
    	}
        return this.mav;
    }
 
    /**
     * how view for sign card
     * @param httpSession HttpSession
     */
    private void showSignCard(final HttpSession httpSession) {
    	// Tarjeta de firmas
        this.mav = new ModelAndView("tablet/tarjetaFirmas");
        
        final String account = (String) httpSession.getAttribute("account");
        
        final String subproducto = (String) httpSession.getAttribute("subproducto");
        final String dateApertura = "";
//        		this.agendaService.getDateApertura(account); //Irving

        getMsgsSingCard(subproducto, dateApertura);
    }
    
    /**
     * Get help messages for signature card.
     * @param subproducto Subproducto
     * @param dateApertura Opening date.
     */
    private void getMsgsSingCard(final String subproducto, final String dateApertura) {
    	EncodeDecodeFile encodeDecode = new EncodeDecodeFile();
    	this.mav.addObject("txtTermCond", "");//encodeDecode.strDecode(this.agendaService.getFileEncoded("TXT1", subproducto, dateApertura))); //Irving
        this.mav.addObject("txtInfoCred", "");//encodeDecode.strDecode(this.agendaService.getFileEncoded("TXT2", subproducto, dateApertura))); //Irving
        this.mav.addObject("txtAutMercadeo", "");//encodeDecode.strDecode(this.agendaService.getFileEncoded("TXT3", subproducto, dateApertura))); //Irving
        this.mav.addObject("txtGS", "");//encodeDecode.strDecode(this.agendaService.getFileEncoded("TXT4", subproducto, dateApertura))); //Irving
        this.mav.addObject("txtADD", "");//encodeDecode.strDecode(this.agendaService.getFileEncoded("TXT5", subproducto, dateApertura))); //Irving
    }

    /**
     * Save client signature and generate pdf files.
     * 
     * @param httpSession
     *            HttpSession
     * @param request
     *            HttpServletRequest
     * @return ModelAndView View
     */
    @RequestMapping(value = "/saveSignature", method = RequestMethod.POST)
    public final ModelAndView saveSignature(final HttpSession httpSession, final HttpServletRequest request) {
    	this.mav = new ModelAndView("tablet/tarjetaFirmas");
    	
    	try {
	    	final User user = (User) httpSession.getAttribute("user");
	        final String account = (String) httpSession.getAttribute("account");
	        //final String keyDocument = request.getParameter("keyDocument");
	        final String encodeImage = request.getParameter("encodedImage");
	        String signature = "";
	        
	        
	        boolean error = false;
	        StringBuffer msgError = new StringBuffer();
	        
	        // Insert signature
	        if (StringUtils.isNotBlank(encodeImage)) {
	            // Delete document if exist
//	            this.adminService.deleteDocument(account, AgendaController.FIRMA);
	            insertSignature(account, AgendaController.FIRMA, encodeImage);
	            
	            signature = getImageSignature(account);
	            
	            if (StringUtils.isBlank(signature)) {
	            	msgError.append("No es posible continuar, no se pudo procesar la firma, intente nuevamente");
	            	error = true;
	            }
	        } else {
	        	msgError.append("No es posible continuar, se presento problema con la firma, intente nuevamente");
	        	error = true;
	        }
	        if (!error) {
		        final String subproducto = (String) httpSession.getAttribute("subproducto");
		        final String dateApertura = "";//this.agendaService.getDateApertura(account);
		        final String keyCaratula = "";//this.agendaService.getValueOf(Constants.KEY_DOC_CONTRATO);  //Irving
		        final String keySolicitud = "";//this.agendaService.getValueOf(Constants.KEY_DOC_SOLICITUD);  //Irving
		        final String keySignCard = "";//this.agendaService.getValueOf(Constants.KEY_DOC_FIRMAS);  //Irving
		        final String keyGS = "";//this.agendaService.getValueOf(Constants.KEY_DOC_GLOBAL_STANDARD);  //Irving
		        final String keyADD = "";//this.agendaService.getValueOf(Constants.KEY_DOC_ADD);  //Irving
		        
		        final String[] keyDocs = new String[]{keyCaratula, keySolicitud, keySignCard, keyGS, keyADD};
		        Map<String, String> docsEncodedMap = getPdfFormat(keyDocs, subproducto, dateApertura, msgError);
		        
		        if (StringUtils.isBlank(msgError.toString())) {
		        	final String fieldsCaratula = "";//this.agendaService.getValueOf(Constants.CAMPOSCARATULAPDF);  //Irving
		        	final String fieldsSolicitud = "";//this.agendaService.getValueOf(Constants.CAMPOSSOLICITUDPDF);  //Irving
		        	final String fieldsSignCard = "";//this.agendaService.getValueOf(Constants.CAMPOS_TARJETA_FIRMAS);  //Irving
		        	final String fieldsGS = "";//this.agendaService.getValueOf(Constants.CAMPOS_GLOBAL_STANDARD);  //Irving
		        	final String fieldsADD = "";//this.agendaService.getValueOf(Constants.CAMPOS_ADD_PDF);  //Irving
		        	final String sucAsignacion = "";//this.agendaService.getSucAsignacion(account);  //Irving
		        	final String nomEmpresa = "";//this.agendaService.getNomEmpresa(account);  //Irving
		        	final String clientName = "";//this.agendaService.getClientName(account);  //Irving
		        	final String sqlConsul = "";//this.agendaService.getValueOf(Constants.SQL_CONSULTA_SOLICITUD);  //Irving
			        
		        	Solicitud dtsSolicitud = new Solicitud();// this.solicitudService.getDatosSolicitud(account, sqlConsul);  //Irving
		        	final String fileSystem = getValueOf(Constants.FILE_SYSTEM_IMAGES);
	
		        	Map<String, String> caratulaMap = new HashMap<String, String>();
			        Map<String, String> solicitudMap = new HashMap<String, String>();
			        Map<String, String> signCardMap = new HashMap<String, String>();
			        Map<String, String> gsMap = new HashMap<String, String>();
			        Map<String, String> addMap = new HashMap<String, String>();
			        
			        caratulaMap.put("account", account);
			        caratulaMap.put("keyCaratula", keyCaratula);
			        caratulaMap.put("encodedFile", docsEncodedMap.get(keyCaratula));
			        caratulaMap.put("clientName", clientName);
			        caratulaMap.put("fields", fieldsCaratula);
			        caratulaMap.put("fileSystem", fileSystem);
			        
			        solicitudMap.put("account", account);
			        solicitudMap.put("keySolicitud", keySolicitud);
			        solicitudMap.put("encodedFile", docsEncodedMap.get(keySolicitud));
			        solicitudMap.put("fields", fieldsSolicitud);
			        solicitudMap.put("branch", completaCeros(7, Integer.parseInt(sucAsignacion)));
			        solicitudMap.put("nomEmpresa", nomEmpresa);
			        solicitudMap.put("dateApertura", dateApertura);
			        solicitudMap.put("fileSystem", fileSystem);
			        
			        String verifyInfo = "off";
			        if (validCheck(request, "verifyInfo")) {
			        	verifyInfo = "on";
			        }
			        
			        String marketingAndPublicity = "off";
			        if (validCheck(request, "marketingAndPublicity")) {
			        	marketingAndPublicity = "on";
			        }
			        
			        signCardMap.put("account", account);
			        signCardMap.put("keySignCard", keySignCard);
			        signCardMap.put("encodedFile", docsEncodedMap.get(keySignCard));
			        signCardMap.put("userId", user.getUserId());
			        signCardMap.put("userName", user.getUserName().toUpperCase());
			        signCardMap.put("signature", signature);
			        signCardMap.put("fieldsSignCard", fieldsSignCard);
			        signCardMap.put("openingDate", dateApertura);
		        	signCardMap.put("verifyInfo", verifyInfo);
			       	signCardMap.put("marketingAndPublicity", marketingAndPublicity);
			        signCardMap.put("fileSystem", fileSystem);
			        signCardMap.put("clientName", clientName);
			        signCardMap.put("sucAsignacion","");	//this.agendaService.getSucAsignacion(account));   //Irving
			        
			        gsMap.put("account", account);
			        gsMap.put("keyGS", keyGS);
			        gsMap.put("encodedFile", docsEncodedMap.get(keyGS));
			        gsMap.put("gsValuesForm", (String) httpSession.getAttribute("globalStandarsVM"));
			        gsMap.put("signature", signature);
			        gsMap.put("clientName", clientName);
			        gsMap.put("fields", fieldsGS);
			        gsMap.put("fileSystem", fileSystem);
			        
			        addMap.put("account", account);
			        addMap.put("keyAdd", keyADD);
			        addMap.put("encodedFile", docsEncodedMap.get(keyADD));
			        addMap.put("fields", fieldsADD);
			        addMap.put("dateApertura", dateApertura);
			        addMap.put("fileSystem", fileSystem);
	
//			        ExecTask execTask = new ExecTask();
//			        execTask.runTask(Constants.D11, signCardMap);
//			        execTask.runTask(Constants.D16, solicitudMap, dtsSolicitud);
//			        execTask.runTask(Constants.D18, caratulaMap);	
//			        execTask.runTask(Constants.GSTR, gsMap);
			        
			        String banAdd = (String) httpSession.getAttribute("GeneraADD");
			        if (banAdd.equalsIgnoreCase("1")) {
			        	httpSession.setAttribute("genADD", "1");
			        	
//			        	execTask.runTask(Constants.ADD, addMap,httpSession);
			        }
		        } else {
		        	final String descError = msgError.toString();
		        	msgError = new StringBuffer("No es posible continuar. ");
		        	msgError.append(descError);
		        	msgError.append("Verifique con el Administrador");
		        	error = true;
		        }
		        
		        // Delete files generated
		        deleteFiles(account, getValueOf(Constants.DELETE_IMG_FS), getValueOf(Constants.FILE_SYSTEM_IMAGES), "");
	        }
	        if (error) {
	        	showSignCard(httpSession);
	            this.mav.addObject("error", msgError.toString());
	        } else {
	        	//Show view for take the customet photo
	        	customerPhoto(httpSession);
	        }

	    } catch(Exception exc) {
			this.LOGGER.error(stackTracetoString(exc));
			this.mav.addObject("error", "Ocurrio un error, " + exc.getMessage());
			
		}
        return this.mav;
    }
    
    /**
     * Show view for 
     * @param httpSession HttpSession
     */
    public void customerPhoto(final HttpSession httpSession) {
    	 // Foto cliente
    	this.mav = new ModelAndView("tablet/integrar");
    	final String keyDocument = "";
//    	keyDocument	= this.adminService.getValVariable(Constants.KEY_DOC_FOTOCLIENTE); //Irving	
        httpSession.setAttribute("typeDocument", "7");
        this.mav.addObject("finalDoc", 1);
        this.mav.addObject("isOptional", 1);
        this.mav.addObject("keyDocument", keyDocument);
        
        this.LOGGER.info("MUESTRA PAGINA PARA DIGITALIZAR LA FOTO DEL CLIENTE");
    }
    
    /**
     * <p>
     * <b> Display takePhoto page. </b>
     * </p>
     * 
     * @param httpSession
     *            HttpSession
     * @param request
     *            HttpServletRequest
     * @return ModelAndView
     */
    @RequestMapping(value = "/takePhoto", method = RequestMethod.POST)
    public final ModelAndView takePhoto(final HttpSession httpSession, final HttpServletRequest request) {
    	this.mav = new ModelAndView("tablet/takePhoto2");
    	
    	try {
	    	CameraProperties cameraProperties = new CameraProperties();
//	    	this.documentsService.getCameraProperties();	// Irving
	
	    	this.mav.addObject("cameraProps", cameraProperties);
	        final String keyDocument = request.getParameter("keyDocument");
	        final String typeDocument = (String) httpSession.getAttribute("typeDocument");
	        final String useAsDomiciliary = request.getParameter("useAs");
	
	        String page = request.getParameter("page");
	        if (StringUtils.isBlank(page)) {
	            page = "1";
	        }
	
	        this.mav.addObject("useAs", useAsDomiciliary);
	        this.mav.addObject("keyDocument", keyDocument);
	        this.mav.addObject("page", page);
	        
	        if (StringUtils.equals("7", typeDocument)) {
	            this.mav.addObject("finalDoc", 1);
	            request.setAttribute("finalDoc", 1);
	        }
    	 } catch(Exception exc) {
 			this.LOGGER.error(stackTracetoString(exc));
 			this.mav.addObject("error", "Ocurrio un error, " + exc.getMessage());
 		}

        return this.mav;
    }

    /**
     * Save picture.
     * @param httpSession HttpSession
     * @param request HttpServletRequest
     * @return ModelAndView View
     */
    @RequestMapping(value = "/saveDocument", method = RequestMethod.POST)
    public final ModelAndView saveDocument(final HttpSession httpSession, final HttpServletRequest request) {
    	try {
	        final User user = (User) httpSession.getAttribute("user");
	        final String account = (String) httpSession.getAttribute("account");
	        final String keyDocument = request.getParameter("keyDocument");
	        final String typeDocument = (String) httpSession.getAttribute("typeDocument");
	        final String newCaptureSameDocument = request.getParameter("newCaptureSameDocument");
	        final String page = request.getParameter("page");
	        String newPage = "";
	
//	        ExecTask execTask = new ExecTask();
	        
	        String encodedImage = request.getParameter("encodedImage");
	        if (StringUtils.contains(encodedImage, "base64")) {
	            encodedImage = encodedImage.split(",")[1];
	        }
	
	        if (newCaptureSameDocument.equals("true")) {
	            int intPage = Integer.parseInt(page);
	            newPage = String.valueOf(intPage + 1);
	            final String useAs = request.getParameter("useAs");
	            CameraProperties cameraProperties = new CameraProperties (); 
//	            cameraProperties = this.documentsService.getCameraProperties();
	
	            this.mav = new ModelAndView("tablet/takePhoto2");
	            this.mav.addObject("cameraProps", cameraProperties);
	            this.mav.addObject("keyDocument", keyDocument);
	            this.mav.addObject("page", newPage);
	            this.mav.addObject("useAs", useAs);
	
	            if (StringUtils.equals("7", typeDocument)) {
//	            	new InsertImageProcess(account, keyDocument, encodedImage, page, user).run();
	            } else {
//	            	execTask.runTask(account, keyDocument, encodedImage, page, user);
	            }
	            
	            if (validCheck(request, "useAs")) {
	                String temporalKeyDoc = "";
//	                temporalKeyDoc = this.agendaService.getDocument(2).getCveDocument(); // Irving
	                
	                log(user, "IDENTIFICACION COMO COMPROBANTE DE DOMICILIO CUENTA: " + account + ": KEY: " + temporalKeyDoc + " PAGE: " + page);
	                
//	                execTask.runTask(account, temporalKeyDoc, encodedImage, page, user);
	            }
	            if (StringUtils.equals("7", typeDocument)) {
	                this.mav.addObject("finalDoc", 1);
	                request.setAttribute("finalDoc", 1);
	            }
	        } else {
	            this.mav = new ModelAndView("tablet/integrar");
	
	            if (StringUtils.equals("7", typeDocument)) {
//	            	new InsertImageProcess(account, keyDocument, encodedImage, page, user).run();
	            } else {
//	            	execTask.runTask(account, keyDocument, encodedImage, page, user);
	            }
	            
	            if (StringUtils.equals("1", typeDocument)) {
	                if (validCheck(request, "useAs")) {
	                    // Insertar el comprobante
	                    String temporalKeyDoc = "";
//	                    temporalKeyDoc = this.agendaService.getDocument(2).getCveDocument(); // Irving
	                    log(user, "SE AGREGA DOCUMENTO: " + temporalKeyDoc + " PAGE: " + page);
	                    
//	                    execTask.runTask(account, temporalKeyDoc, encodedImage, page, user);
	                    
	                    //Show ADD
	                    showADD(httpSession);
	                } else { //Muestra Comprobante de domicilio
	                	showProofOfAddress(httpSession);
	                }
	            } else {
	                if (StringUtils.equals("3", typeDocument)) { //Show ADD
	                	showADD(httpSession);
	                }
	                if (StringUtils.equals("7", typeDocument)) {
	                    httpSession.removeAttribute("typeDocument");
	
	                    final String keyVisit = (String) httpSession.getAttribute("keyVisit");
	                    final String nameCompany = (String) httpSession.getAttribute("nameCompany");
	                    final String genADD = (String) httpSession.getAttribute("genADD");
	                    
	                    validImage(account, Constants.D11, "1");
	                    validImage(account, Constants.D16, "1");
	                    validImage(account, Constants.D18, "1");
	                    validImage(account, Constants.GSTR, "1");
	                    validImage(account, keyDocument, page); //Foto cliente
	                    
	                    if (StringUtils.isNotBlank(genADD) && StringUtils.equalsIgnoreCase("1", genADD)) {
	                    	validImage(account, Constants.ADD, "1");	
	                    }
	                    
	                    httpSession.removeAttribute("genADD");
	                    
	                    String ver = "";
//	                    documentsService.getValueOf("VER_DOCUMENTOS"); //  Irving	
	                    httpSession.removeAttribute("GeneraADD");
	                    httpSession.removeAttribute("beanAdd");
	                    if (ver.equalsIgnoreCase("1")) {
	                    	mostrarDocumentos(httpSession);
	                    } else {
	                    	completeIntegration(user, keyVisit, account, nameCompany);
	                    }
	                }
	            }
	        }
	
	        log(user, "DIGITALIZA DOCUMENTO: " + keyDocument);
	
	        request.setAttribute("idDocumento", (String) httpSession.getAttribute("typeDocument"));
    	} catch(Exception exc) {
    		this.LOGGER.error(stackTracetoString(exc));
    		this.mav.addObject("error", "Ocurrio un error, " + exc.getMessage());
    	}
        return this.mav;
    }
	
    /**
     * Valida si el hilo termino.
     */
    private void validImage(final String account, final String keyDocument, final String page) {
    	this.LOGGER.info("VALIDANDO IMAGEN GENERADA CUENTA: " + account + " KEY: " + keyDocument + " PAGE: "+ page);
    	boolean exist = false;
    	for (int cont = 1; cont <= 10; cont++) {
//    		if (this.agendaService.imageExist(account, keyDocument, page)) {  // Irving
    		if (exist) { //Irving  
    			exist = true;
    			break;
    		}
    		try {
         	    Thread.sleep(10000);
         	} catch(InterruptedException ex) {
         	    Thread.currentThread().interrupt();
         	}
    	}
    	
    	if (exist) {
    		this.LOGGER.info("IMAGEN CUENTA: " + account + " KEY: " + keyDocument + " PAGE: "+ page + " GENERADA");
    	} else {
    		this.LOGGER.info("IMAGEN CUENTA: " + account + " KEY: " + keyDocument + " PAGE: "+ page + " NO GENERADA");
    	}
    }
    
    /**
     * <p>
     * <b> Validate if is an optional document. </b>
     * </p>
     * 
     * @param httpSession
     *            HttpSession
     * @param request
     *            HttpServletRequest
     * @return ModelAndView
     */
    @RequestMapping(value = "/optionalDocument", method = RequestMethod.POST)
    public final ModelAndView optionalDocument(final HttpSession httpSession, final HttpServletRequest request) {
        final User user = (User) httpSession.getAttribute("user");
        final String typeDocument = (String) httpSession.getAttribute("typeDocument");
        final String account = (String) httpSession.getAttribute("account");
        final String nameCompany = (String) httpSession.getAttribute("nameCompany");
        final String keyVisit = (String) httpSession.getAttribute("keyVisit");
        
        if (StringUtils.equals("7", typeDocument)) {
        	final String genADD = (String) httpSession.getAttribute("genADD");
            httpSession.removeAttribute("typeDocument");
            httpSession.removeAttribute("GeneraADD");
            httpSession.removeAttribute("beanAdd");
            
            this.LOGGER.info("FOTO DEL CLIENTE NO DIGITALIZADA");
            
            validImage(account, Constants.D11, "1");
            validImage(account, Constants.D16, "1");
            validImage(account, Constants.D18, "1");
            validImage(account, Constants.GSTR, "1");
            
            if (StringUtils.isNotBlank(genADD) && StringUtils.equalsIgnoreCase("1", genADD)) {
            	validImage(account, Constants.ADD, "1");	
            }
            
            httpSession.removeAttribute("genADD");
            
            String ver = "";  //Irving
//            documentsService.getValueOf("VER_DOCUMENTOS"); //Irving
            if(ver.equalsIgnoreCase("1")){
            	mostrarDocumentos(httpSession);
            }else {
            	completeIntegration(user, keyVisit, account, nameCompany);
            }
        }

        return this.mav;
    }
    
    /**
     * <p>
     * <b> Mostrar documentos.</b>
     * </p>
     * @param httpSession
     */
    public void mostrarDocumentos(final HttpSession httpSession) {
    	this.mav = new ModelAndView("tablet/carrusel");
    	List<DocumentosImg> limagen  = new ArrayList <DocumentosImg> ();//Irving 
//    	this.documentsService.getImgDocumentos((String) httpSession.getAttribute("account")); // Irving
    	this.mav.addObject("limgEncode", limagen);
        this.LOGGER.info("MUESTRA PAGINA DE DOCUMENTOS");
   }
    
    
    /**
     * <p>
     * <b> Complete integration. </b>
     * </p>
     * @param httpSession httpSession
     * @param request request
     * @return ModelAndView
     */
    @RequestMapping(value = "/completeIntegration", method = RequestMethod.POST)
    public final ModelAndView completeIntegration(final HttpSession httpSession, final HttpServletRequest request) {
        final User user = (User) httpSession.getAttribute("user");
            completeIntegration(user, (String) httpSession.getAttribute("keyVisit"), (String) httpSession.getAttribute("account"),
                (String) httpSession.getAttribute("nameCompany"));

        return this.mav;
    }

    /**
     * <p>
     * <b> Complete integration. </b>
     * </p>
     * 
     * @param user
     *            User
     * @param keyVisit
     *            Key visit
     * @param account
     *            Account
     * @param nameCompany
     *            Company
     */
    private void completeIntegration(final User user, final String keyVisit, final String account, final String nameCompany) {
//        this.adminService.adminAccountHistory(fillThCuentasAgenda(account, user.getUserId(), Constants.KEY_COMPLETE_DIGIT, //Irving
//            keyVisit, "TERMINA DIGITALIZACION")); 		//Irving	

        this.mav = new ModelAndView("tablet/company");

        try {
            boolean sentToIWH = true; //this.sentToIWH(account, user, this.adminService); //Irving

            if (sentToIWH) {
//                this.adminService.updateAccount(user.getUserId(), Constants.KEY_COMPLETE_INTEG, keyVisit, account);   //Irving
//                this.adminService.adminAccountHistory(fillThCuentasAgenda(account, user.getUserId(), Constants.KEY_COMPLETE_INTEG, //Irving
//                    keyVisit, "INTEGRACION COMPLETA")); //Irving

//                this.agendaService.deleteImages(account); //Irving

                log(user, "********** INTEGRACION COMPLETA CUENTA " + account + " **********");
            } else {
                // Update status account to pending IWH
//                this.adminService.updateAccount(user.getUserId(), Constants.KEY_PENDING_IWH, keyVisit, account); //Irving

//                this.adminService.adminAccountHistory(fillThCuentasAgenda(account, user.getUserId(), Constants.KEY_PENDING_IWH, //Irving
//                    keyVisit, "IMAGENES PENDIENTES DE ENVIO A IWH"));  //Irving

                log(user, "********** ENVIO PENDIENTE A IWH CUENTA " + account + " **********");

                this.mav.addObject("error", "ERROR AL ENVIAR IMAGENES A IWH");
            }

            String msg = "";
            int total = 0; // this.agendaService.getIntValue(SqlsAgenda.GET_TOT_ACCOUNTS_PENDING, keyVisit); //Irving

            if (0 < total) {
//                this.agendaService.pendingVisit(keyVisit, nameCompany, user.getUserId()); //Irving
            } else {
//                total = this.agendaService.getIntValue(SqlsAgenda.GET_TOT_ACCOUNTS_PNDIWH, keyVisit);  //Irving

                if (0 < total) {
//                    this.adminService.updateVisit(user.getUserId(), Constants.VISIT_PENDING_IWH, keyVisit);  //Irving
                    msg = "VISITA CON IMAGENES PENDIENTES A ENVIAR";
                } else {
//                    this.adminService.updateVisit(user.getUserId(), Constants.VISIT_COMPLETED, keyVisit);  //Irving

                    msg = "VISITA COMPLETADA";
                }
//                this.adminService.addBitacoraCompany(Integer.parseInt(keyVisit), user.getUserId(), msg);  //Irving
            }
        } catch (RuntimeException exc) {
            this.mav.addObject("error", exc.getMessage().toUpperCase());
        } catch (Exception exc) {
            this.mav.addObject("error", exc.getMessage().toUpperCase());
        }

        List<Accounts> dataList = new ArrayList<Accounts>();
//        dataList = this.agendaService.accountsCompany(user.getUserId(), keyVisit);

        this.LOGGER.debug("Visita: " + keyVisit + " - Empresa " + nameCompany + " - Cuentas: " + dataList.size());

        this.mav.addObject("regsXPage", pagination());
        this.mav.addObject("nameCompany", nameCompany);
        this.mav.addObject("keyVisit", keyVisit);
        this.mav.addObject("lstAccounts", dataList);
    }

    /**
     * <p>
     * <b> ThCuentasAgenda. </b>
     * </p>
     * 
     * @param dda
     *            DDA
     * @param userId
     *            User Id
     * @param phase
     *            Phase
     * @param keyVisit
     *            Key Visit
     * @param description
     *            Description
     * @return ThCuentasAgenda Bean
     */
    private ThCuentasAgenda fillThCuentasAgenda(final String dda, final String userId, final int phase, final String keyVisit,
        final String description) {
        ThCuentasAgenda thCuentasAgenda = new ThCuentasAgenda();
        thCuentasAgenda.setDda(dda);
        thCuentasAgenda.setUserId(userId);
        thCuentasAgenda.setPhase(String.valueOf(phase));
        thCuentasAgenda.setKeyVisit(keyVisit);
        thCuentasAgenda.setDescription(description);

        return thCuentasAgenda;
    }

    /**
     * Send images to IWH
     * 
     * @param httpSession
     *            HttpSession
     * @param request
     *            HttpServletRequest
     * @return ModelAndView View
     */
    @RequestMapping(value = "/sendImages", method = RequestMethod.POST)
    public final ModelAndView sendImages(final HttpSession httpSession, final HttpServletRequest request) {
        final User user = (User) httpSession.getAttribute("user");
        final String account = request.getParameter("account");

        this.mav = new ModelAndView("tablet/company");

        final String keyVisit = request.getParameter("keyVisit");
        final String nameCompany = request.getParameter("nameCompany");

        try {
            log(user, "Re-envia imagenes a IWH - Cuenta: " + account);

            boolean sentToIWH = true; // this.sentToIWH(account, user, this.adminService);  //Irving

            if (sentToIWH) {
//                this.adminService.updateAccount(user.getUserId(), Constants.KEY_COMPLETE_INTEG, keyVisit, account); //Irving

//                this.adminService.adminAccountHistory(fillThCuentasAgenda(account, user.getUserId(), Constants.KEY_COMPLETE_INTEG, //Irving
//                    keyVisit, "INTEGRACION COMPLETA")); //Irving

//                this.agendaService.deleteImages(account); //Irving
            } else {
                this.mav.addObject("error", "ERROR AL ENVIAR IMAGENES A IWH");
            }

            String msg = "";
            int total = 0;// this.agendaService.getIntValue(SqlsAgenda.GET_TOT_ACCOUNTS_PENDING, keyVisit); //Irving

            if (0 < total) {
//                this.agendaService.pendingVisit(keyVisit, nameCompany, user.getUserId()); //Irving
            } else {
//                total = this.agendaService.getIntValue(SqlsAgenda.GET_TOT_ACCOUNTS_PNDIWH, keyVisit); //Irving

                if (0 < total) {
//                    this.adminService.updateVisit(user.getUserId(), Constants.VISIT_PENDING_IWH, keyVisit); //Irving
                    msg = "VISITA CON IMAGENES PENDIENTES A ENVIAR";
                } else {
//                    this.adminService.updateVisit(user.getUserId(), Constants.VISIT_COMPLETED, keyVisit); //Irving

                    msg = "VISITA COMPLETADA";
                }
//                this.adminService.addBitacoraCompany(Integer.parseInt(keyVisit), user.getUserId(), msg); //Irving
            }
        } catch (RuntimeException exc) {
            this.mav.addObject("error", exc.getMessage().toUpperCase());
        }

        List<Accounts> dataList = new ArrayList<Accounts>();
//        dataList = this.agendaService.accountsCompany(user.getUserId(), keyVisit);

        this.mav.addObject("regsXPage", pagination());
        this.mav.addObject("nameCompany", nameCompany);
        this.mav.addObject("keyVisit", keyVisit);
        this.mav.addObject("lstAccounts", dataList);

        return this.mav;
    }

    /**
     * <p>
     * <b> Send docs to IWH. </b>
     * </p>
     * 
     * @param account
     *            Account
     * @param user
     *            User
     * @return boolean
     */
/**    private boolean sentToIWH(final String account, final User user, final AdminService adminService) {
        boolean retVal = false;

        IwhImageDocumentsRequest iwhImageDocumentsRequest = null;
        LinkedMultiValueMap<String, Object> requestMap = null;
        List<DocumentsRequiredDocumentsResponse> documentsRequiredList = null;  Irving
        List<String> documentsRequiredList = null;

        List<ImageDocument> imageDocumentsList = this.documentsService.getAllDocuments(account);

        IwhServiceReadImpl iwhServiceReadImpl = new IwhServiceReadImpl();
        boolean deleteImg = false;
        try {
            iwhImageDocumentsRequest = IwhUtils.getIwhImageDocumentsRequest(imageDocumentsList,
                this.agendaService.getTiffResolution());

            // Si pasa este punto indica que las imagenes ya fueron escritas en
            // el FS e independientemente del resultado deben eliminarse
            deleteImg = true;
            requestMap = iwhImageDocumentsRequest.getRequestMap();
            documentsRequiredList = null; //iwhImageDocumentsRequest.getDocuments(); irving
            IwhServiceReadImpl cargaDoct = new IwhServiceReadImpl();

            retVal = true;// cargaDoct.iwhDoctosNom(account, documentsRequiredList, requestMap, iwhServiceReadImpl, user, adminService); irving
        } catch (Exception exc) {
            this.LOGGER.error(stackTracetoString(exc));
            throw new RuntimeException(exc);
        } finally {
            if (deleteImg) {
                try {
                    StringBuffer sbuffer = new StringBuffer();
                    if (documentsRequiredList != null) {
                        sbuffer.append("Cuenta:");
                        sbuffer.append(account);
                        sbuffer.append(",se recuperaron ");
                        sbuffer.append(imageDocumentsList.size());
                        sbuffer.append(" documentos con las siguientes claves:");
                        for (ImageDocument imageDocument : imageDocumentsList) {
                            sbuffer.append(imageDocument.getCveDocument());
                            sbuffer.append(",");
                        }
                    }
                    // Imprimer cuantos documentos se recuperaron de la cuenta
                    this.LOGGER.debug(sbuffer.toString());
                } catch (Exception exc) {
                    this.LOGGER.debug(stackTracetoString(exc));
                }
                String deleteFSImages = this.adminService.getValVariable("DELETE_IMG_FS");
                if (StringUtils.isBlank(deleteFSImages) || deleteFSImages.equalsIgnoreCase("Y")) {
                    IwhUtils.deleteImageFiles(requestMap);
                }
            }
        }

        return retVal;
    }
**/
    /**
     * Obtiene el formato a procesar.
     * @param keyDocs Key
     * @param subproducto Subproducto
     * @param dateApertura Fecha de apertura
     * @param msgError Mensaje de error
     * @return Map<String, String> Formatos
     */
    private Map<String, String> getPdfFormat(final String[] keyDocs, final String subproducto, final String dateApertura, final StringBuffer msgError) {
    	Map<String, String> docsEncodedMap = new HashMap<String, String>();
    	
    	for (int cont = 0; cont < keyDocs.length; cont++) {
    		final String encodeFile = "";
//    		encodeFile = this.agendaService.getFileEncoded(keyDocs[cont], subproducto, dateApertura);  //Irving
    		
    		if (StringUtils.isBlank(encodeFile)) {
                msgError.append("Formato " + keyDocs[cont] + " no valido. ");
                this.LOGGER.error("FORMATO " + keyDocs[cont] + " NO VALIDO");
            } else {
            	docsEncodedMap.put(keyDocs[cont], encodeFile);
            }
    	}
    	return docsEncodedMap;
    } 

    /**
     * <p>
     * <b> Insert signature in database. </b>
     * </p>
     * 
     * @param account
     *            Account
     * @param keyDocument
     *            Key document
     * @param encodedImage
     *            encoded
     */
    private void insertSignature(final String account, final String keyDocument, final String encodedImage) {
        ImageDocument imageDocument = new ImageDocument();
        imageDocument.setAccount(account);
        imageDocument.setIdDocument(keyDocument);
        imageDocument.setEncodedImage(encodedImage.substring(encodedImage.lastIndexOf(",") + 1));
        imageDocument.setPage("1");

//        this.documentsService.insertDocument(imageDocument); // Irving
    }

    /**
     * <p>
     * <b> Get signature images list. </b>
     * </p>
     * 
     * @param account
     *            Account
     * @return List<String>
     */
    private String getImageSignature(final String account) {
        String pathImgPng = "-";
        String imgEncode = "";
//        imgEncode = this.documentsService.getImgDocument(account, AgendaController.FIRMA); //Irving
        if (StringUtils.isNotEmpty(imgEncode)) {
            pathImgPng = createPngImage(imgEncode, account + "_" + AgendaController.FIRMA, getValueOf(Constants.FILE_SYSTEM_IMAGES));
        }

        return pathImgPng;
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
     * Get variable value. 
     * @param variable Variable
     * @return String value
     */
    private String getValueOf(final String variable) {
    	return "";//this.agendaService.getValueOf(variable);
    }
}
