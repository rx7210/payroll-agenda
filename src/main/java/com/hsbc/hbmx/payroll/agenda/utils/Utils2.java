/*
 * COPYRIGHT. HSBC HOLDINGS PLC 2017. ALL RIGHTS RESERVED.
 *
 * This software is only to be used for the purpose for which it has been
 * provided. No part of it is to be reproduced, disassembled, transmitted,
 * stored in a retrieval system nor translated in any human or computer
 * language in any way or for any other purposes whatsoever without the
 * prior written consent of HSBC Holdings plc.
 */
package com.hsbc.hbmx.payroll.agenda.utils;

import java.util.logging.Level;
import java.util.logging.Logger;

import org.springframework.http.ResponseEntity;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.HttpServerErrorException;

/**
 * <p><b>
 * Utils.
 * </b></p>
 */
public class Utils2 {
    /**
     * 
     * <p><b>
     * Print Response.
     * </b></p>
     *
     * @param response
     */
    static public <T> void printResponse(ResponseEntity<T> response){
        Logger.getLogger(Utils.class.getName()).log(Level.INFO, "Status Code: " + response.getStatusCodeValue() + " " + response.getStatusCode().getReasonPhrase());
        if(response.hasBody()){
        	Logger.getLogger(Utils.class.getName()).log(Level.INFO, "Body: " + response.getBody().toString());
        }
    }
    
    /**
     * 
     * <p><b>
     * Print Exception Response.
     * </b></p>
     *
     * @param e
     */
    static public void printExceptionResponse(HttpClientErrorException e){
        Logger.getLogger(Utils.class.getName()).log(Level.INFO, "Status Code: " + e.getMessage());
        Logger.getLogger(Utils.class.getName()).log(Level.INFO, "Body: " + e.getResponseBodyAsString());
    }
    
    /**
     * 
     * <p><b>
     * Print Exception Response.
     * </b></p>
     *
     * @param e
     */
    static public void printExceptionResponse(HttpServerErrorException e){
        Logger.getLogger(Utils.class.getName()).log(Level.INFO, "Status Code: " + e.getMessage());
        Logger.getLogger(Utils.class.getName()).log(Level.INFO, "Body: " + e.getResponseBodyAsString());
    }
}
