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
 * <b> Visit. </b>
 * </p>
 */
public class Visit implements Serializable {

    /**
     * <p>
     * <b> serialVersionUID. </b>
     * </p>
     */
    private static final long serialVersionUID = 1L;

    private String numFolio;

    private String companyName;

    private String userId;

    private String dateAssignmen;

    private String dateVisit;

    private String status;

    /**
     * @return the numFolio
     */
    public String getNumFolio() {
        return this.numFolio;
    }

    /**
     * @param numFolio
     *            the numFolio to set
     */
    public void setNumFolio(final String numFolio) {
        this.numFolio = numFolio;
    }

    /**
     * @return the companyName
     */
    public String getCompanyName() {
        return this.companyName;
    }

    /**
     * @param companyName
     *            the companyName to set
     */
    public void setCompanyName(final String companyName) {
        this.companyName = companyName;
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
     * @return the dateAssignmen
     */
    public String getDateAssignmen() {
        return this.dateAssignmen;
    }

    /**
     * @param dateAssignmen
     *            the dateAssignmen to set
     */
    public void setDateAssignmen(final String dateAssignmen) {
        this.dateAssignmen = dateAssignmen;
    }

    /**
     * @return the dateVisit
     */
    public String getDateVisit() {
        return this.dateVisit;
    }

    /**
     * @param dateVisit
     *            the dateVisit to set
     */
    public void setDateVisit(final String dateVisit) {
        this.dateVisit = dateVisit;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return this.status;
    }

    /**
     * @param status
     *            the status to set
     */
    public void setStatus(final String status) {
        this.status = status;
    }


}
