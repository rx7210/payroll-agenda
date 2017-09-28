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
import java.sql.Timestamp;

/**
 * <p>
 * <b> ThSesionAgenda. </b>
 * </p>
 */
public class ThSesionAgenda implements Serializable {

    /**
     * <p>
     * <b> Serial Version UID. </b>
     * </p>
     */
    private static final long serialVersionUID = -2847996739199335956L;

    private String cveSession;

    private String userId;

    private String userIP;

    private Timestamp startDate;

    private Timestamp endDate;

    private int staSesion;

    /**
     * @return the cveSession
     */
    public String getCveSession() {
        return this.cveSession;
    }

    /**
     * @param cveSession
     *            the cveSession to set
     */
    public void setCveSession(final String cveSession) {
        this.cveSession = cveSession;
    }

    /**
     * @return the userId
     */
    public String getUserId() {
        return this.userId;
    }

    /**
     * @param userId
     *            the userId to set
     */
    public void setUserId(final String userId) {
        this.userId = userId;
    }

    /**
     * @return the userIP
     */
    public String getUserIP() {
        return this.userIP;
    }

    /**
     * @param userIP
     *            the userIP to set
     */
    public void setUserIP(final String userIP) {
        this.userIP = userIP;
    }

    /**
     * @return the startDate
     */
    public Timestamp getStartDate() {
        return this.startDate;
    }

    /**
     * @param startDate
     *            the startDate to set
     */
    public void setStartDate(final Timestamp startDate) {
        this.startDate = startDate;
    }

    /**
     * @return the endDate
     */
    public Timestamp getEndDate() {
        return this.endDate;
    }

    /**
     * @param endDate
     *            the endDate to set
     */
    public void setEndDate(final Timestamp endDate) {
        this.endDate = endDate;
    }

    /**
     * @return the staSesion
     */
    public int getStaSesion() {
        return this.staSesion;
    }

    /**
     * @param staSesion
     *            the staSesion to set
     */
    public void setStaSesion(final int staSesion) {
        this.staSesion = staSesion;
    }
}
