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
 * <b> Role of User. </b>
 * </p>
 */
public class Role implements Serializable {

    /**
     * <p>
     * <b> TODO : Insert description of the field. </b>
     * </p>
     */
    private static final long serialVersionUID = 1L;

    private String keyRole;

    private String roleName;

    private int statusRole;

    /**
     * @return the keyRole
     */
    public String getKeyRole() {
        return this.keyRole;
    }

    /**
     * @param keyRole
     *            the keyRole to set
     */
    public void setKeyRole(final String keyRole) {
        this.keyRole = keyRole;
    }

    /**
     * @return the roleName
     */
    public String getRoleName() {
        return this.roleName;
    }

    /**
     * @param roleName
     *            the roleName to set
     */
    public void setRoleName(final String roleName) {
        this.roleName = roleName;
    }

    /**
     * @return the statusRole
     */
    public int getStatusRole() {
        return this.statusRole;
    }

    /**
     * @param statusRole
     *            the statusRole to set
     */
    public void setStatusRole(final int statusRole) {
        this.statusRole = statusRole;
    }


}
