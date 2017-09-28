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
 * <b> Employee. </b>
 * </p>
 */
public class User implements Serializable {

    /**
     * <p>
     * <b> Serial UID. </b>
     * </p>
     */
    private static final long serialVersionUID = 1L;

    private String userId = "";

    private String password = "";

    private String userName;

    private String userIP;

    private String cveEmail;

    private String userIdLider;

    private String phone;

    private String cellPhone;

    private String userRole;

    private int status;

    private String httpSession;

    private Role role;

    private boolean exist = false;

    private String userIdCatalog = "";

    private String userRoleCatalog = "";

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
     * @return the password
     */
    public String getPassword() {
        return this.password;
    }

    /**
     * @param password
     *            the password to set
     */
    public void setPassword(final String password) {
        this.password = password;
    }

    /**
     * @return the userName
     */
    public String getUserName() {
        return this.userName;
    }

    /**
     * @param userName
     *            the userName to set
     */
    public void setUserName(final String userName) {
        this.userName = userName;
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
     * @return the cveEmail
     */
    public String getCveEmail() {
        return this.cveEmail;
    }

    /**
     * @param cveEmail
     *            the cveEmail to set
     */
    public void setCveEmail(final String cveEmail) {
        this.cveEmail = cveEmail;
    }

    /**
     * @return the userIdLider
     */
    public String getUserIdLider() {
        return this.userIdLider;
    }

    /**
     * @param userIdLider
     *            the userIdLider to set
     */
    public void setUserIdLider(final String userIdLider) {
        this.userIdLider = userIdLider;
    }

    /**
     * @return the phone
     */
    public String getPhone() {
        return this.phone;
    }

    /**
     * @param phone
     *            the phone to set
     */
    public void setPhone(final String phone) {
        this.phone = phone;
    }

    /**
     * @return the cellPhone
     */
    public String getCellPhone() {
        return this.cellPhone;
    }

    /**
     * @param cellPhone
     *            the cellPhone to set
     */
    public void setCellPhone(final String cellPhone) {
        this.cellPhone = cellPhone;
    }

    /**
     * @return the userRole
     */
    public String getUserRole() {
        return this.userRole;
    }

    /**
     * @param userRole
     *            the userRole to set
     */
    public void setUserRole(final String userRole) {
        this.userRole = userRole;
    }

    /**
     * @return the status
     */
    public int getStatus() {
        return this.status;
    }

    /**
     * @param status
     *            the status to set
     */
    public void setStatus(final int status) {
        this.status = status;
    }

    /**
     * @return the httpSession
     */
    public String getHttpSession() {
        return this.httpSession;
    }

    /**
     * @param httpSession
     *            the httpSession to set
     */
    public void setHttpSession(final String httpSession) {
        this.httpSession = httpSession;
    }

    /**
     * @return the role
     */
    public Role getRole() {
        return this.role;
    }

    /**
     * @param role
     *            the role to set
     */
    public void setRole(final Role role) {
        this.role = role;
    }

    /**
     * @return the exist
     */
    public boolean isExist() {
        return this.exist;
    }

    /**
     * @param exist
     *            the exist to set
     */
    public void setExist(final boolean exist) {
        this.exist = exist;
    }

    /**
     * @return the userIdCatalog
     */
    public String getUserIdCatalog() {
        return this.userIdCatalog;
    }

    /**
     * @param userIdCatalog
     *            the userIdCatalog to set
     */
    public void setUserIdCatalog(final String userIdCatalog) {
        this.userIdCatalog = userIdCatalog;
    }

    /**
     * @return the userRoleCatalog
     */
    public String getUserRoleCatalog() {
        return this.userRoleCatalog;
    }

    /**
     * @param userRoleCatalog
     *            the userRoleCatalog to set
     */
    public void setUserRoleCatalog(final String userRoleCatalog) {
        this.userRoleCatalog = userRoleCatalog;
    }
}
