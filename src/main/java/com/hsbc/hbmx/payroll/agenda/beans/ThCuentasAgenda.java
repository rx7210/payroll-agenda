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
 * <b> ThCuentasAgenda. </b>
 * </p>
 */
public class ThCuentasAgenda implements Serializable {

    /**
     * <p>
     * <b> serialVersionUID. </b>
     * </p>
     */
    private static final long serialVersionUID = 1L;

    private String dda;

    private String userId;

    private String phase;

    private Timestamp date;

    private String keyVisit;

    private String description;

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
    public String getPhase() {
        return this.phase;
    }

    /**
     * @param phase
     *            the phase to set
     */
    public void setPhase(final String phase) {
        this.phase = phase;
    }

    /**
     * @return the date
     */
    public Timestamp getDate() {
        return this.date;
    }

    /**
     * @param date
     *            the date to set
     */
    public void setDate(final Timestamp date) {
        this.date = date;
    }

    /**
     * @return the keyVisit
     */
    public String getKeyVisit() {
        return this.keyVisit;
    }

    /**
     * @param keyVisit
     *            the keyVisit to set
     */
    public void setKeyVisit(final String keyVisit) {
        this.keyVisit = keyVisit;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return this.description;
    }

    /**
     * @param description
     *            the description to set
     */
    public void setDescription(final String description) {
        this.description = description;
    }


}
