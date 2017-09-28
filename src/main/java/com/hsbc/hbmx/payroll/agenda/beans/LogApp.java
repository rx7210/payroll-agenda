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
 * <b> LogApp. </b>
 * </p>
 */
public class LogApp implements Serializable {

    /**
     * <p>
     * <b> serialVersionUID. </b>
     * </p>
     */
    private static final long serialVersionUID = 1L;

    private User user;

    /**
     * Date task.
     */
    private Timestamp dateActivity;

    /**
     * Description task.
     */
    private String descActivity = "";

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
     * @return the dateActivity
     */
    public Timestamp getDateActivity() {
        return this.dateActivity;
    }

    /**
     * @param dateActivity
     *            the dateActivity to set
     */
    public void setDateActivity(final Timestamp dateActivity) {
        this.dateActivity = dateActivity;
    }

    /**
     * @return the descActivity
     */
    public String getDescActivity() {
        return this.descActivity;
    }

    /**
     * @param descActivity
     *            the descActivity to set
     */
    public void setDescActivity(final String descActivity) {
        this.descActivity = descActivity;
    }

}
