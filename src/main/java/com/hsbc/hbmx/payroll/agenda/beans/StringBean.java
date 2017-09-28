/*
 * COPYRIGHT. HSBC HOLDINGS PLC 2017. ALL RIGHTS RESERVED.
 * 
 * This software is only to be used for the purpose for which it has been
 * provided. No part of it is to be reproduced, disassembled, transmitted,
 * stored in a retrieval system nor translated in any human or computer
 * language in any way or for any other purposes whatsoever without the prior
 * written consent of HSBC Holdings plc.
 */
package com.hsbc.hbmx.payroll.agenda.beans;

import java.io.Serializable;

/**
 * <p>
 * <b> StringBean. </b>
 * </p>
 */
public class StringBean implements Serializable {

    /**
     * <p>
     * <b> serialVersionUID. </b>
     * </p>
     */
    private static final long serialVersionUID = 1L;

    /**
     * <p>
     * <b> String. </b>
     * </p>
     */
    private String string = "";

    /**
     * @return the string
     */
    public String getString() {
        return this.string;
    }

    /**
     * @param string
     *            the string to set
     */
    public void setString(final String string) {
        this.string = string;
    }
}
