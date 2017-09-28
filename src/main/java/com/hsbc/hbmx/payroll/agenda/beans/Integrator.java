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
 * <b> TODO : Insert description of the class's responsibility/role. </b>
 * </p>
 */
public class Integrator implements Serializable {

    /**
     * <p>
     * <b> serialVersionUID. </b>
     * </p>
     */
    private static final long serialVersionUID = 1L;

    private User user;

    private String totAssigned;

    private String totPending;

    private String totAttended;

    private String totAssignedToday;

    /**
     * @return the user
     */
    public User getUser() {
        return this.user;
    }

    /**
     * @param user
     *            the user to set
     */
    public void setUser(final User user) {
        this.user = user;
    }

    /**
     * @return the totAssigned
     */
    public String getTotAssigned() {
        return this.totAssigned;
    }

    /**
     * @param totAssigned
     *            the totAssigned to set
     */
    public void setTotAssigned(final String totAssigned) {
        this.totAssigned = totAssigned;
    }

    /**
     * @return the totPending
     */
    public String getTotPending() {
        return this.totPending;
    }

    /**
     * @param totPending
     *            the totPending to set
     */
    public void setTotPending(final String totPending) {
        this.totPending = totPending;
    }

    /**
     * @return the totAttended
     */
    public String getTotAttended() {
        return this.totAttended;
    }

    /**
     * @param totAttended
     *            the totAttended to set
     */
    public void setTotAttended(final String totAttended) {
        this.totAttended = totAttended;
    }

    /**
     * @return the totAssignedToday
     */
    public String getTotAssignedToday() {
        return this.totAssignedToday;
    }

    /**
     * @param totAssignedToday
     *            the totAssignedToday to set
     */
    public void setTotAssignedToday(final String totAssignedToday) {
        this.totAssignedToday = totAssignedToday;
    }
}
