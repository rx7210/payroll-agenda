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
public class Poc implements Serializable {

    /**
     * <p>
     * <b> serialVersionUID. </b>
     * </p>
     */
    private static final long serialVersionUID = 1L;

    private String keyPoc;

    private String namePoc;

    private String idManager;

    private String nameManager;

    private String idSupervisor;

    private String nameSupervisor;

    private int statusPoc;

    private String totBranches;

    private String totIntegrator;

    private String daysPoc;

    /**
     * @return the keyPoc
     */
    public String getKeyPoc() {
        return this.keyPoc;
    }

    /**
     * @param keyPoc
     *            the keyPoc to set
     */
    public void setKeyPoc(final String keyPoc) {
        this.keyPoc = keyPoc;
    }

    /**
     * @return the namePoc
     */
    public String getNamePoc() {
        return this.namePoc;
    }

    /**
     * @param namePoc
     *            the namePoc to set
     */
    public void setNamePoc(final String namePoc) {
        this.namePoc = namePoc;
    }

    /**
     * @return the idManager
     */
    public String getIdManager() {
        return this.idManager;
    }

    /**
     * @param idManager
     *            the idManager to set
     */
    public void setIdManager(final String idManager) {
        this.idManager = idManager;
    }

    /**
     * @return the nameManager
     */
    public String getNameManager() {
        return this.nameManager;
    }

    /**
     * @param nameManager
     *            the nameManager to set
     */
    public void setNameManager(final String nameManager) {
        this.nameManager = nameManager;
    }

    /**
     * @return the idSupervisor
     */
    public String getIdSupervisor() {
        return this.idSupervisor;
    }

    /**
     * @param idSupervisor
     *            the idSupervisor to set
     */
    public void setIdSupervisor(final String idSupervisor) {
        this.idSupervisor = idSupervisor;
    }

    /**
     * @return the nameSupervisor
     */
    public String getNameSupervisor() {
        return this.nameSupervisor;
    }

    /**
     * @param nameSupervisor
     *            the nameSupervisor to set
     */
    public void setNameSupervisor(final String nameSupervisor) {
        this.nameSupervisor = nameSupervisor;
    }

    /**
     * @return the statusPoc
     */
    public int getStatusPoc() {
        return this.statusPoc;
    }

    /**
     * @param statusPoc
     *            the statusPoc to set
     */
    public void setStatusPoc(final int statusPoc) {
        this.statusPoc = statusPoc;
    }

    /**
     * @return the totBranches
     */
    public String getTotBranches() {
        return this.totBranches;
    }

    /**
     * @param totBranches
     *            the totBranches to set
     */
    public void setTotBranches(final String totBranches) {
        this.totBranches = totBranches;
    }

    /**
     * @return the totIntegrator
     */
    public String getTotIntegrator() {
        return this.totIntegrator;
    }

    /**
     * @param totIntegrator
     *            the totIntegrator to set
     */
    public void setTotIntegrator(final String totIntegrator) {
        this.totIntegrator = totIntegrator;
    }

    /**
     * @return the daysPoc
     */
    public String getDaysPoc() {
        return this.daysPoc;
    }

    /**
     * @param daysPoc
     *            the daysPoc to set
     */
    public void setDaysPoc(final String daysPoc) {
        this.daysPoc = daysPoc;
    }

}
