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
 * <b> Workplace. </b>
 * </p>
 */
public class Workplace implements Serializable {

    /**
     * <p>
     * <b> serialVersionUID. </b>
     * </p>
     */
    private static final long serialVersionUID = 1L;

    private String keyWorkplace;

    private String nomWorkplace;

    private String dirWorkplace;

    private String emailWorkplace;

    private String telWorkplace;

    private String contactWorkplace;

    private int statusWorkplace;

    /**
     * @return the keyWorkplace
     */
    public String getKeyWorkplace() {
        return this.keyWorkplace;
    }

    /**
     * @param keyWorkplace
     *            the keyWorkplace to set
     */
    public void setKeyWorkplace(final String keyWorkplace) {
        this.keyWorkplace = keyWorkplace;
    }

    /**
     * @return the nomWorkplace
     */
    public String getNomWorkplace() {
        return this.nomWorkplace;
    }

    /**
     * @param nomWorkplace
     *            the nomWorkplace to set
     */
    public void setNomWorkplace(final String nomWorkplace) {
        this.nomWorkplace = nomWorkplace;
    }

    /**
     * @return the dirWorkplace
     */
    public String getDirWorkplace() {
        return this.dirWorkplace;
    }

    /**
     * @param dirWorkplace
     *            the dirWorkplace to set
     */
    public void setDirWorkplace(final String dirWorkplace) {
        this.dirWorkplace = dirWorkplace;
    }

    /**
     * @return the emailWorkplace
     */
    public String getEmailWorkplace() {
        return this.emailWorkplace;
    }

    /**
     * @param emailWorkplace
     *            the emailWorkplace to set
     */
    public void setEmailWorkplace(final String emailWorkplace) {
        this.emailWorkplace = emailWorkplace;
    }

    /**
     * @return the telWorkplace
     */
    public String getTelWorkplace() {
        return this.telWorkplace;
    }

    /**
     * @param telWorkplace
     *            the telWorkplace to set
     */
    public void setTelWorkplace(final String telWorkplace) {
        this.telWorkplace = telWorkplace;
    }

    /**
     * @return the contactWorkplace
     */
    public String getContactWorkplace() {
        return this.contactWorkplace;
    }

    /**
     * @param contactWorkplace
     *            the contactWorkplace to set
     */
    public void setContactWorkplace(final String contactWorkplace) {
        this.contactWorkplace = contactWorkplace;
    }

    /**
     * @return the statusWorkplace
     */
    public int getStatusWorkplace() {
        return this.statusWorkplace;
    }

    /**
     * @param statusWorkplace
     *            the statusWorkplace to set
     */
    public void setStatusWorkplace(final int statusWorkplace) {
        this.statusWorkplace = statusWorkplace;
    }
}
