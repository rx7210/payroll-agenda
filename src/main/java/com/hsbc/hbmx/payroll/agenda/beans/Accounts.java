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
 * <b> Accounts. </b>
 * </p>
 */
public class Accounts implements Serializable {

    /**
     * <p>
     * <b> serialVersionUID. </b>
     * </p>
     */
    private static final long serialVersionUID = 1L;

    private String dda;

    private String numFolio;

    private String userId;

    private int phase;

    private String pocKey;

    private String contract;

    private String company;

    private String clientName;

    private String link;

    private String status;

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
     * @return the phase
     */
    public int getPhase() {
        return this.phase;
    }

    /**
     * @param phase
     *            the phase to set
     */
    public void setPhase(final int phase) {
        this.phase = phase;
    }

    /**
     * @return the pocKey
     */
    public String getPocKey() {
        return this.pocKey;
    }

    /**
     * @param pocKey
     *            the pocKey to set
     */
    public void setPocKey(final String pocKey) {
        this.pocKey = pocKey;
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
     * @return the link
     */
    public String getLink() {
        return this.link;
    }

    /**
     * @param link
     *            the link to set
     */
    public void setLink(final String link) {
        this.link = link;
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
