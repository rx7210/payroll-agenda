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

/**
 * <p>
 * <b> Constants. </b>
 * </p>
 */
public class Constants {

    public static final String SERVLET = "PayrrolAgenda";

    /**
     * <p>
     * <b> Mexico Timezone. </b>
     * </p>
     */
    public static final String TIMEZONEMX = "America/Mexico_City";

    /**
     * <p>
     * <b> Language. </b>
     * </p>
     */
    public static final String LANGUAGE = "es";

    /**
     * <p>
     * <b> Mexico. </b>
     * </p>
     */
    public static final String MEX = "MX";

    /**
     * <p>
     * <b> Date format dd/MM/yyyy HH:mm:ss a. </b>
     * </p>
     */
    public static final String DDMMYYHHMMSS = "dd/MM/yyyy HH:mm:ss a";

    /**
     * <p>
     * <b> Date format dd/MM/yyyy. </b>
     * </p>
     */
    public static final String DDMMYY = "dd/MM/yyyy";

    public static final int NUM1 = 1;

    public static final int NUM2 = 2;

    public static final int KEY_ASSIGNED = 1;

    public static final int KEY_START_DIGIT = 2;

    public static final int KEY_COMPLETE_DIGIT = 3;

    public static final int KEY_PENDING_IWH = 4;

    public static final int KEY_COMPLETE_INTEG = 5;

    public static final String ASSIGNED = "Asignadas";

    public static final String ATTENDED = "Atendidas";

    public static final String PENDING = "Pendientes";

    public static final String ASSIGNED_TODAY = "Asignadas Hoy";

    public static final int VISIT_NEW = 0;

    public static final int VISIT_SCHEDULE = 1;

    public static final int VISIT_PENDING = 2;

    public static final int VISIT_PENDING_IWH = 3;

    public static final int VISIT_COMPLETED = 4;

    public static final String FMT_MMDDYYYY = "MM/dd/yyyy";

    public static final String FMT_DDMMYYYY = "dd/MM/yyyy";

    public static final String FMT_MMDDYYYY_HHMMSS_A = "MM/dd/yyyy HH:mm:ss a";

    public static final String FMT_DDMMYYYY_HHMMSS_A = "dd/MM/yyyy HH:mm:ss a";

    public static final String KEY_DOC_IDPERSON = "KEY_DOC_IDPERSON";

    public static final String KEY_DOC_COMPDOM = "KEY_DOC_COMPDOM";

    public static final String KEY_DOC_SOLICITUD = "KEY_DOC_SOLICITUD";

    public static final String KEY_DOC_FIRMAS = "KEY_DOC_FIRMAS";

    public static final String KEY_DOC_ADD = "KEY_DOC_ADD";

    public static final String KEY_DOC_CONTRATO = "KEY_DOC_CONTRATO";

    public static final String KEY_DOC_FOTOCLIENTE = "KEY_DOC_FOTOCLIENTE";
    
    public static final String KEY_DOC_GLOBAL_STANDARD = "KEY_DOC_GLOBAL_STANDARD";

    public static final String URL_CUENTA = "URL_CUENTA";

    public static final String URL_CLIENTE = "URL_CLIENTE";

    public static final String URL_BRANCH = "URL_BRANCH";

    public static final String URL_DOC_REQ = "URL_DOC_REQ";

    public static final String URL_INTEGRA_EXP = "URL_INTEGRA_EXP";

    public static final String ID_PRODUCTO = "ID_PRODUCTO";

    public static final String ID_SUBPRODUCTO = "ID_SUBPRODUCTO";

    public static final String ID_RELACION1 = "ID_RELACION1";

    public static final String ID_RELACION2 = "ID_RELACION2";

    public static final String ID_RELACION3 = "ID_RELACION3";

    public static final String ID_SECCION = "ID_SECCION";

    public static final String ID_CATEGORIA1 = "ID_CATEGORIA1";

    public static final String ID_CATEGORIA2 = "ID_CATEGORIA2";

    public static final String ID_CATEGORIA3 = "ID_CATEGORIA3";

    public static final String TIPO_PERSONA = "TIPO_PERSONA";

    public static final String CAMERA_DIMENTION = "CAMERA_DIMENTION";

    public static final String CAMERA_DESIRE_DIMENTION = "CAMERA_DESIRE_DIMENTION";

    public static final String TIFF_RESOLUTION = "TIFF_RESOLUTION";

    public static final String IMAGE_FORMAT = "IMAGE_FORMAT";

    public static final String ID_TIPO_OPER = "ID_TIPO_OPER";

    public static final String CVE_TIPO_OPER = "CVE_TIPO_OPER";

    public static final String Client_Secret = "Client_Secret";
    
    public static final String COMPANIA = "COMPANIA";

    public static final String BRANCH = "BRANCH";

    public static final String DOSCIENTOS = "DOSCIENTOS";
    
    public static final String CUATROCIENTOS4 = "CUATROCIENTOS4";
    
    public static final String PROD_DDA = "PROD_DDA";

    public static final String PROD_FAT = "PROD_FAT";

    public static final String TIE = "TIE";

    public static final String NEXT = "NEXT";

    public static final String Client_Id = "Client_Id";

    public static final String PNG = "png";

    public static final String FILE_SYSTEM_NAS = "/nas/htsl-m318/nomina/";
    
    public static final String FILE_SYSTEM_IMAGES = "FILE_SYSTEM_IMAGES";

    public static final String TARJETA_FIRMAS = "TARJETA_FIRMAS";

    public static final String CAMPOS_TARJETA_FIRMAS = "CAMPOS_TARJETA_FIRMAS";

    public static final String PDF = ".pdf";

    public static final String CAMPOS_SOLICITUD_CONTRATO = "CAMPOS_SOLICITUD_CONTRATO";

    public static final String CODIFICACION="CODIFICACION";
    
    public static final String IMAGES_WITH_WATERMARK = "IMAGES_WITH_WATERMARK";
    
    public static final String CAMPOS_MARCA_AGUA = "CAMPOS_MARCA_AGUA";

    public static final String SOLICITUDPDF = "SOLICITUDPDF";
    
    public static final String CARATULAPDF = "CARATULAPDF";
    
    public static final String PAIS = "MEXICO ";

    public static final String CAMPOSSOLICITUDPDF = "CAMPOS_SOLICITUD_PDF";

    public static final String CAMPOSCARATULAPDF = "CAMPOS_CARATULA_PDF";
    
    public static final String CAMPOS_GLOBAL_STANDARD = "CAMPOS_GLOBAL_STANDARD";

    public static final String SOLICITUD = "Solicitud";

    public static final String CARATULA = "Caratula";
    
    public static final String PAGINACION_AGENDA = "PAGINACION_AGENDA";
    
    public static final String TERMINOS_Y_CONDICIONES = "TERMINOS_Y_CONDICIONES";
    
    public static final String INFORMACION_CREDITICIA = "INFORMACION_CREDITICIA";
    
    public static final String AUTORIZA_MERCADEO = "AUTORIZA_MERCADEO";
    
    public static final String MAX_SIZE_TO_RESIZE = "MAX_SIZE_TO_RESIZE";
    
    public static final String APPLY_GRAY_SCALE = "APPLY_GRAY_SCALE";
    
    public static final String COUNTRY_WITH_SANCTION = "COUNTRY_WITH_SANCTION";
    
    public static final String COUNTRY_OF_RESIDENCE = "COUNTRY_OF_RESIDENCE";
    
    public static final String GET_FILE_ENCODED = "GET_FILE_ENCODED";
    
    public static final String CAMPOSADDPDF = "CAMPOS_ADD_PDF";
    
    public static final String KEY_DOCU_ADD = "KEY_DOCU_ADD";
    
    public static final String SQL_CONSULTA_SOLICITUD = "SQL_CONSULTA_SOLICITUD";
    
    public static final String CAMPOS_ADD_PDF = "CAMPOS_ADD_PDF";
    
    public static final String DELETE_IMG_FS = "DELETE_IMG_FS";
    
    public static final String DELETE_PDF_FILES = "DELETE_PDF_FILES";
    
    public static final String D11 = "D11";
    
    public static final String D16 = "D16";
    
    public static final String D18 = "D18";
    
    public static final String GSTR = "GSTR";
    
    public static final String ADD = "ADD";
}
