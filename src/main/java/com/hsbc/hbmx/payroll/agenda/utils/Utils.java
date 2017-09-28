/*
 * COPYRIGHT. HSBC HOLDINGS PLC 2017. ALL RIGHTS RESERVED.
 * 
 * This software is only to be used for the purpose for which it has been
 * provided. No part of it is to be reproduced, disassembled, transmitted,
 * stored in a retrieval system nor translated in any human or computer
 * language in any way or for any other purposes whatsoever without the prior
 * written consent of HSBC Holdings plc.
 */
package com.hsbc.hbmx.payroll.agenda.utils;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.TimeZone;

import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.util.Base64Utils;

//import com.hsbc.hbmx.payroll.agenda.service.AgendaService;

/**
 * <p>
 * <b> Utils </b>
 * </p>
 */
public class Utils extends ComponentsHtml {

    /**
     * Logger.
     */
    private final Logger LOGGER = Logger.getLogger(Utils.class.getName());

    /**
     * Get client IP.
     * 
     * @param request
     *            HttpServletRequest
     * @return String Client IP
     */
    public final String getUserIP(final HttpServletRequest request) {
        final String userIpAddress = request.getHeader("CLIENT_IP_ADDRESS");

        if (StringUtils.isEmpty(userIpAddress) || StringUtils.equalsIgnoreCase("null", userIpAddress)) {
            return request.getRemoteAddr();
        } else {
            return userIpAddress;
        }
    }

    /**
     * <p>
     * <b> Delete JSESSIONID cookies when the application start. </b>
     * </p>
     * 
     * @param request
     *            HttpServletRequest
     * @param response
     *            HttpServletResponse
     */
    protected void deleteCookies(final HttpServletRequest request, final HttpServletResponse response) {
        final Cookie[] cookies = request.getCookies();
        if (cookies != null) {

            for (int i = 0; i < cookies.length; i++) {
                this.LOGGER.debug("Delete cookie: " + cookies[i].getName());
                cookies[i].setValue("");
                cookies[i].setPath("/");
                cookies[i].setMaxAge(0);
                cookies[i].setSecure(true);
                response.addCookie(cookies[i]);
            }
        }
    }

    /**
     * <p>
     * <b> Get the EAR version. </b>
     * </p>
     * 
     * @param request
     *            HttpServletRequest
     * @return String Ear version
     * @throws PayrollAgendaException
     */
    protected String getEarVersion(final HttpServletRequest request) {
        String earVersion = "";
        try {
            String realPath = request.getSession().getServletContext().getRealPath("/");
            String osName = System.getProperty("os.name");
            boolean isVersion = false;
            InetAddress local = InetAddress.getLocalHost();
            int lastPoint;
            int warPosEnd = realPath.indexOf(".war");
            if (warPosEnd != -1) {
                String version = realPath.substring(0, warPosEnd);
                int warPosStart;
                if (osName.toUpperCase().indexOf("WINDOWS") != -1) {
                    warPosStart = version.lastIndexOf("\\");
                } else {
                    warPosStart = version.lastIndexOf("/");
                }
                if (warPosStart != -1) {
                    version = version.substring(warPosStart + 1).replace("payroll-agenda-", "");

                    earVersion = version;

                    isVersion = true;
                }
            }

            lastPoint = local.getHostAddress().lastIndexOf(".");
            if (lastPoint != -1) {
                if (isVersion) {
                    earVersion = earVersion + "/";
                }
                earVersion = earVersion + local.getHostAddress().substring(lastPoint + 1);
            }
        } catch (UnknownHostException exc) {
            this.LOGGER.info(stackTracetoString(exc));
        } catch (IndexOutOfBoundsException exc) {
            this.LOGGER.info(stackTracetoString(exc));
        }
        return earVersion;
    }

    /**
     * Throwable a string.
     * 
     * @param throwable
     *            Throwable
     * @return String Exception
     */
    public final String stackTracetoString(final Throwable throwable) {
        final Writer result = new StringWriter();
        final PrintWriter printWriter = new PrintWriter(result);
        throwable.printStackTrace(printWriter);
        return result.toString();
    }

    /**
     * <p>
     * <b> Valid if a string is number. </b>
     * </p>
     * 
     * @param value
     *            Value
     * @return boolean True/False
     */
    public boolean isNumber(final String value) {
        boolean isNumber = false;

        if (!StringUtils.isEmpty(value) && StringUtils.isNumeric(value)) {
            isNumber = true;
        }

        return isNumber;
    }

    /**
     * <p>
     * <b> Gets the actual date based in the value of format parameter. </b>
     * </p>
     * 
     * @param format
     *            Date format
     * @return String Date with format
     */
    public final String getActualDate(final String format) {
        // Set the time zone and locale for Mexico
        TimeZone.setDefault(TimeZone.getTimeZone(Constants.TIMEZONEMX));
        Locale locale = new Locale(Constants.LANGUAGE, Constants.MEX);

        return new SimpleDateFormat(format, locale).format(new Date());
    }

    /**
     * <p>
     * <b> Convert string to date. </b>
     * </p>
     * 
     * @param date
     *            String date
     * @param format
     *            Format
     * @return Date
     */
    public final Date stringToDate(final String date, final String format) {
        Date newDate = null;
        try {
            TimeZone.setDefault(TimeZone.getTimeZone(Constants.TIMEZONEMX));
            Locale locale = new Locale(Constants.LANGUAGE, Constants.MEX);

            SimpleDateFormat sdf = new SimpleDateFormat(format, locale);
            newDate = sdf.parse(date);
        } catch (ParseException exc) {
            this.LOGGER.error(exc);
        }
        return newDate;
    }

    /**
     * <p>
     * <b> Convert date to string. </b>
     * </p>
     * 
     * @param date
     *            Date
     * @param format
     *            Format
     * @return String Date
     */
    public final String dateToString(final Date date, final String format) {
        TimeZone.setDefault(TimeZone.getTimeZone(Constants.TIMEZONEMX));
        Locale locale = new Locale(Constants.LANGUAGE, Constants.MEX);

        SimpleDateFormat sdf = new SimpleDateFormat(format, locale);
        return sdf.format(date);
    }

    /**
     * <p>
     * <b> Give format at date. </b>
     * </p>
     * 
     * @param date
     *            Date
     * @param format
     *            Format
     * @return Date
     */
    public final Date dateToDateWithFormat(final Date date, final String format) {
        return stringToDate(dateToString(date, format), format);
    }

    /**
     * <p>
     * <b> Get de actual date in timestamp format. </b>
     * </p>
     * 
     * @return
     */
    public final Timestamp actualDateTS() {
        return new Timestamp(new Date().getTime());
    }

    /**
     * <p>
     * <b> Validate date for schedule a company. </b>
     * </p>
     * 
     * @param dateToCompare
     * @return
     */
    public boolean isValidDateForSchedule(final String dateToValidate) {
        boolean isValid = false;
        if (StringUtils.isNotBlank(dateToValidate)) {

            final Date date = stringToDate(dateToValidate, Constants.FMT_MMDDYYYY_HHMMSS_A);
            final Date actualDate = stringToDate(getActualDate(Constants.FMT_MMDDYYYY) + " " + getActualHour(),
                Constants.FMT_MMDDYYYY_HHMMSS_A);

            if ((date != null) && (actualDate != null)) {
                if (date.after(actualDate)) {
                    isValid = true;
                }
            }
        }

        return isValid;
    }

    /**
     * <p>
     * <b> Validate if datePoc is lower than dateSchedule. </b>
     * </p>
     * 
     * @param datePoc
     *            Date
     * @param dateSchedule
     *            Date
     * @return boolean
     */
    public boolean isValidDateForSchedule(final Date datePoc, final Date dateSchedule) {
        boolean isValid = false;
        if ((datePoc != null) && (dateSchedule != null)) {
            if (dateSchedule.after(datePoc) || dateSchedule.equals(datePoc)) {
                isValid = true;
            }
        }

        return isValid;
    }

    /**
     * <p>
     * <b> Get actual hour in 12 hours format. Seconds are always 00 </b>
     * </p>
     * 
     * @return String hour
     */
    public String getActualHour() {
        Calendar cal = new GregorianCalendar();
        String ampm = "PM";
        if (0 == cal.get(Calendar.AM_PM)) {
            ampm = "AM";
        }

        int hour = cal.get(Calendar.HOUR);
        if (0 == hour) {
            hour = 12;
        }

        return hour + ":" + cal.get(Calendar.MINUTE) + ":00 " + ampm;
    }

    /**
     * <p>
     * <b> Increase poc days at the assigned date. </b>
     * </p>
     * 
     * @param date
     *            Assigned Date
     * @param totDays
     * @return Date
     */
    public Date datePoc(final Date date, final int totDays) {
        Date newDate = date;
        if (totDays > 0) {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            calendar.add(Calendar.DAY_OF_YEAR, totDays);
            newDate = calendar.getTime();
        }
        return newDate;
    }

    /**
     * Create a png image.
     * @param encodeImg Encoded
     * @param nameImg Name
     * @param fsImages File system
     * @return String Path to image
     */
    public String createPngImage(final String encodeImg, final String nameImg, final String fsImages) {
        String pathImg = "";
        try {
            final String fileName = nameImg + "." + Constants.PNG;

            ByteArrayInputStream bais = new ByteArrayInputStream(Base64Utils.decodeFromString(encodeImg));
            BufferedImage image = ImageIO.read(bais);

            File outputfile = new File(fsImages, fileName);
            ImageIO.write(image, Constants.PNG, outputfile);

            pathImg = outputfile.getAbsolutePath();

        } catch (Exception exc) {
            this.LOGGER.debug(stackTracetoString(exc));
        }

        return pathImg;
    }

    /**
     * Eliminate files of file system
     * @param pathFile File to Eliminate
     */
    public void deleteFile(final String pathFile) {
        try {
            File file = new File(pathFile);
            file.delete();
            this.LOGGER.info("ARCHIVO " + pathFile + " ELIMINADO");
        } catch (SecurityException exc) {
            this.LOGGER.error(stackTracetoString(exc));
        } catch (Exception exc) {
            this.LOGGER.error(stackTracetoString(exc));
        }
    }
 
    /**
     * Completa ceros a la izquierda
     * 
     * @param longTotal
     *            Longitud total
     * @param valor
     *            Valor
     * @return String Valor completo
     */
    public String completaCeros(final int longTotal, final int valor) {
        String numCompleto = String.valueOf(valor);
        int total = longTotal - numCompleto.length();

        for (int cont = 0; cont < total; cont++) {
            numCompleto = "0" + numCompleto;
        }
        return numCompleto;
    }
    
    public int getYear(final String fecha, final String formatoEntrada) throws ParseException{
		int retVal = 0;
		Date fecNac = getDate(fecha, formatoEntrada);
		
		fecNac = mayorAHoy(fecNac);
		
		retVal = getCalendarField(fecNac,Calendar.YEAR);
		
		return retVal;
	}
	
	private Date mayorAHoy(final Date date) {
		Date dAux = null;
		Calendar hoy = Calendar.getInstance();
		Calendar fecha = Calendar.getInstance();
		fecha.setTime(date);

		if (fecha.getTimeInMillis() > hoy.getTimeInMillis()) {
			fecha.add(Calendar.YEAR,-100);
			dAux = fecha.getTime();
		} else {
			dAux = date;
		}

		return dAux;
	}
	
	public Date getDate(final String fecha, final String formatoEntrada) throws ParseException{
    	SimpleDateFormat inputFormat = new SimpleDateFormat(formatoEntrada);
    	java.util.Date retVal = null;
        try {
            retVal = inputFormat.parse(fecha);
        } catch (ParseException e) {
            e.printStackTrace();
            throw e;
        }
        return retVal;
    }
	
    public int getCalendarField(final Date inDate, final int field){
    	int retVal = 0;
    	Calendar cal = Calendar.getInstance();
		cal.setTime(inDate);
		retVal = cal.get(field);
    	return retVal;
    }
    
	/**
	 * Valida Campos.
	 * 
	 * @param cad
	 *            Cad.
	 * @return String.
	 */
	public String valnull(final String cad) {
		String cadres = "";
		if (cad == null) {
			cadres = "";
		} else {
			cadres = cad;
		}
		return cadres;
	}
	
	/**
	 * Valida checkbox
	 * @param request HttpServletRequest
	 * @param param Param name
	 * @return boolean True / False
	 */
	public boolean validCheck(final HttpServletRequest request, final String param) {
        boolean isChecked = false;
        try {
            final String value = request.getParameterValues(param)[0];
            if (StringUtils.equalsIgnoreCase("on", value)) {
                isChecked = true;
            }
        } catch (NullPointerException exc) {
            this.LOGGER.debug("Checkbox " + param + " no seleccionado");
        }

        return isChecked;
    }
	
    /**
     * Set default values for integration
     * @param httpSession HttpSession
     * @param request HttpServletRequest
     * @param agendaService AgendaService
     */
    public void setDefaultValuesView(final HttpSession httpSession, final HttpServletRequest request, final String agendaService) {
    	String account = getAccount(httpSession, request);
    	String nameClient = request.getParameter("nameClient");
        String keyVisit = request.getParameter("keyVisit");
        String nameCompany = request.getParameter("nameCompany");
//        final String subproducto = agendaService.getSubproducto(account);

        if (StringUtils.isBlank(nameClient)) {
            nameClient = (String) httpSession.getAttribute("nameClient");
        }
        if (StringUtils.isBlank(keyVisit)) {
            keyVisit = (String) httpSession.getAttribute("keyVisit");
        }
        if (StringUtils.isBlank(nameCompany)) {
            nameCompany = (String) httpSession.getAttribute("nameCompany");
        }
        
        httpSession.setAttribute("account", account);
        httpSession.setAttribute("nameClient", nameClient);
        httpSession.setAttribute("keyVisit", keyVisit);
        httpSession.setAttribute("nameCompany", nameCompany);
        httpSession.setAttribute("subproducto", ""); // subproducto); Irving
    }
    
    /**
     * Complete hrs and minutes to two digits.
     * @param value Value to complete
     * @return String Value completed
     */
    public String completeHourMinute(final String value) {
        String valComplete = value;

        if (10 > Integer.parseInt(value)) {
            valComplete = "0" + valComplete;
        }

        return valComplete;
    }
    
	/**
	 * Get account from HttpServletRequest or HttpSession
	 * @param httpSession HttpSession
	 * @param request HttpServletRequest
	 * @return String Account
	 */
	public String getAccount(final HttpSession httpSession, final HttpServletRequest request) {
    	String account = request.getParameter("account");
        if (StringUtils.isBlank(account)) {
            account = (String) httpSession.getAttribute("account");
        }
        return account;
    }
	
    /**
     * Delete account files.
     * @param account Account
     * @param deleteFSImages Variable 
     * @param fileSystem File system
     * @param endWith Suffix
     */
    public void deleteFiles(final String account, final String deleteFSImages, final String fileSystem, final String endWith) {
        if (StringUtils.isBlank(deleteFSImages) || StringUtils.equalsIgnoreCase("Y", deleteFSImages)) {
            final File file = new File(fileSystem);
            final String[] files = file.list();

            for (int cont = 0; cont < files.length; cont++) {
                final String fileName = files[cont];
                
                if (StringUtils.isBlank(endWith)) {
                	if (fileName.startsWith(account + "_")) {
                        deleteFile(fileSystem + fileName);
                    }
                } else {
                	if (fileName.startsWith(account + "_") && (fileName.endsWith(endWith))) {
                        deleteFile(fileSystem + fileName);
                    }
                }
            }
        }
    }
}
