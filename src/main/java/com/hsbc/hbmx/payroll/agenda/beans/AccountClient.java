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

import org.apache.commons.lang.StringUtils;

/**
 * <p>
 * <b> AccountsClient. </b>
 * </p>
 */
public class AccountClient implements Serializable {

    /**
     * <p>
     * <b> serialVersionUID. </b>
     * </p>
     */
    private static final long serialVersionUID = 1L;

    private String dda;

    private String folio;

    private String contract;

    private String clientName;

    private String company;

    private String dateAssigned;

    private String timeIntegration;

    /**
     * @return the dda
     */
    public String getDda() {
        return this.dda;
    }

    /**
     * @param dda
     *            the dda to set
     */
    public void setDda(final String dda) {
        this.dda = dda;
    }

    /**
     * @return the folio
     */
    public String getFolio() {
        return this.folio;
    }

    /**
     * @param folio
     *            the folio to set
     */
    public void setFolio(final String folio) {
        this.folio = folio;
    }

    /**
     * @return the contract
     */
    public String getContract() {
        return this.contract;
    }

    /**
     * @param contract
     *            the contract to set
     */
    public void setContract(final String contract) {
        this.contract = contract;
    }

    /**
     * @return the clientName
     */
    public String getClientName() {
        return this.clientName;
    }

    /**
     * @param clientName
     *            the clientName to set
     */
    public void setClientName(final String clientName) {
        this.clientName = clientName;
    }

    /**
     * @return the company
     */
    public String getCompany() {
        return this.company;
    }

    /**
     * @param company
     *            the company to set
     */
    public void setCompany(final String company) {
        this.company = company;
    }

    /**
     * @return the dateAssigned
     */
    public String getDateAssigned() {
        return this.dateAssigned;
    }

    /**
     * @param dateAssigned
     *            the dateAssigned to set
     */
    public void setDateAssigned(final String dateAssigned) {
        this.dateAssigned = dateAssigned;
    }

    /**
     * @return the timeIntegration
     */
    public String getTimeIntegration() {
        return this.timeIntegration;
    }

    /**
     * @param timeIntegration
     *            the timeIntegration to set
     */
    public void setTimeIntegration(final String timeIntegration) {
        if (StringUtils.isBlank(timeIntegration)) {
            this.timeIntegration = "-";
        } else {
            this.timeIntegration = timeIntegration;
        }
    }
}
