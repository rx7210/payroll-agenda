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
 * <b> Schedule. </b>
 * </p>
 */
public class Schedule implements Serializable {

    /**
     * <p>
     * <b> serialVersionUID. </b>
     * </p>
     */
    private static final long serialVersionUID = 1L;

    private int cveVisit;

    private String companyName;

    private String noteCompany;

    private Timestamp dateVisit;

    private String noteDate;

    private int staVisit;

    private String descStatus;

    private String link;

    private String proposedDate;

    /**
     * @return the cveVisit
     */
    public int getCveVisit() {
        return this.cveVisit;
    }

    /**
     * @param cveVisit
     *            the cveVisit to set
     */
    public void setCveVisit(final int cveVisit) {
        this.cveVisit = cveVisit;
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
     * @return the noteCompany
     */
    public String getNoteCompany() {
        return this.noteCompany;
    }

    /**
     * @param noteCompany
     *            the noteCompany to set
     */
    public void setNoteCompany(final String noteCompany) {
        this.noteCompany = noteCompany;
    }

    /**
     * @return the dateVisit
     */
    public Timestamp getDateVisit() {
        return this.dateVisit;
    }

    /**
     * @param dateVisit
     *            the dateVisit to set
     */
    public void setDateVisit(final Timestamp dateVisit) {
        this.dateVisit = dateVisit;
    }

    /**
     * @return the noteDate
     */
    public String getNoteDate() {
        return this.noteDate;
    }

    /**
     * @param noteDate
     *            the noteDate to set
     */
    public void setNoteDate(final String noteDate) {
        this.noteDate = noteDate;
    }

    /**
     * @return the staVisit
     */
    public int getStaVisit() {
        return this.staVisit;
    }

    /**
     * @param staVisit
     *            the staVisit to set
     */
    public void setStaVisit(final int staVisit) {
        this.staVisit = staVisit;
    }

    /**
     * @return the descStatus
     */
    public String getDescStatus() {
        return this.descStatus;
    }

    /**
     * @param descStatus
     *            the descStatus to set
     */
    public void setDescStatus(final String descStatus) {
        this.descStatus = descStatus;
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
     * @return the proposedDate
     */
    public String getProposedDate() {
        return this.proposedDate;
    }

    /**
     * @param proposedDate
     *            the proposedDate to set
     */
    public void setProposedDate(final String proposedDate) {
        this.proposedDate = proposedDate;
    }
}
