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
 * <b> Document. </b>
 * </p>
 */
public class Document implements Serializable {

    /**
     * <p>
     * <b> serialVersionUID. </b>
     * </p>
     */
    private static final long serialVersionUID = 1L;

    private String idDocument;

    private String cveDocument;

    private String desDocument;

    private String isRequired;

    private String idProduct;

    private String idSubproduct;

    private String idRelation;

    private String idCategory;

    private String idSection;

    /**
     * @return the idDocument
     */
    public String getIdDocument() {
        return this.idDocument;
    }

    /**
     * @param idDocument
     *            the idDocument to set
     */
    public void setIdDocument(final String idDocument) {
        this.idDocument = idDocument;
    }

    /**
     * @return the cveDocument
     */
    public String getCveDocument() {
        return this.cveDocument;
    }

    /**
     * @param cveDocument
     *            the cveDocument to set
     */
    public void setCveDocument(final String cveDocument) {
        this.cveDocument = cveDocument;
    }

    /**
     * @return the desDocument
     */
    public String getDesDocument() {
        return this.desDocument;
    }

    /**
     * @param desDocument
     *            the desDocument to set
     */
    public void setDesDocument(final String desDocument) {
        this.desDocument = desDocument;
    }

    /**
     * @return the isRequired
     */
    public String getIsRequired() {
        return this.isRequired;
    }

    /**
     * @param isRequired
     *            the isRequired to set
     */
    public void setIsRequired(final String isRequired) {
        this.isRequired = isRequired;
    }

    /**
     * @return the idProduct
     */
    public String getIdProduct() {
        return this.idProduct;
    }

    /**
     * @param idProduct
     *            the idProduct to set
     */
    public void setIdProduct(final String idProduct) {
        this.idProduct = idProduct;
    }

    /**
     * @return the idSubproduct
     */
    public String getIdSubproduct() {
        return this.idSubproduct;
    }

    /**
     * @param idSubproduct
     *            the idSubproduct to set
     */
    public void setIdSubproduct(final String idSubproduct) {
        this.idSubproduct = idSubproduct;
    }

    /**
     * @return the idRelation
     */
    public String getIdRelation() {
        return this.idRelation;
    }

    /**
     * @param idRelation
     *            the idRelation to set
     */
    public void setIdRelation(final String idRelation) {
        this.idRelation = idRelation;
    }

    /**
     * @return the idCategory
     */
    public String getIdCategory() {
        return this.idCategory;
    }

    /**
     * @param idCategory
     *            the idCategory to set
     */
    public void setIdCategory(final String idCategory) {
        this.idCategory = idCategory;
    }

    /**
     * @return the idSection
     */
    public String getIdSection() {
        return this.idSection;
    }

    /**
     * @param idSection
     *            the idSection to set
     */
    public void setIdSection(final String idSection) {
        this.idSection = idSection;
    }


}
