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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.theme.AbstractThemeResolver;

/**
 * <p>
 * <b> ThemeResolver. </b>
 * </p>
 */
public class ThemeResolver extends AbstractThemeResolver {

    /*
     * (non-Javadoc)
     * 
     * @see
     * org.springframework.web.servlet.ThemeResolver#resolveThemeName(javax
     * .servlet.http.HttpServletRequest)
     */
    public String resolveThemeName(final HttpServletRequest request) {
        return "agenda";
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * org.springframework.web.servlet.ThemeResolver#setThemeName(javax.servlet
     * .http.HttpServletRequest, javax.servlet.http.HttpServletResponse,
     * java.lang.String)
     */
    public void setThemeName(final HttpServletRequest request, final HttpServletResponse response, final String string) {}
}
