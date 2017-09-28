package com.hsbc.hbmx.payroll.agenda.beans;

import java.io.Serializable;

/**
 * <p>
 * <b> Branch. </b>
 * </p>
 */
public class Branch implements Serializable {

    /**
	 * 
	 */
    private static final long serialVersionUID = 1L;

    private String keyBranch;

    private String branchName;

    private String postCode;

    private String keyPoc;

    private String totIntegradores;

    private int status;

    /**
     * @return the keyBranch
     */
    public String getKeyBranch() {
        return this.keyBranch;
    }

    /**
     * @param keyBranch
     *            the keyBranch to set
     */
    public void setKeyBranch(final String keyBranch) {
        this.keyBranch = keyBranch;
    }

    /**
     * @return the branchName
     */
    public String getBranchName() {
        return this.branchName;
    }

    /**
     * @param branchName
     *            the branchName to set
     */
    public void setBranchName(final String branchName) {
        this.branchName = branchName;
    }

    /**
     * @return the postCode
     */
    public String getPostCode() {
        return this.postCode;
    }

    /**
     * @param postCode
     *            the postCode to set
     */
    public void setPostCode(final String postCode) {
        this.postCode = postCode;
    }

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
     * @return the totIntegradores
     */
    public String getTotIntegradores() {
        return this.totIntegradores;
    }

    /**
     * @param totIntegradores
     *            the totIntegradores to set
     */
    public void setTotIntegradores(final String totIntegradores) {
        this.totIntegradores = totIntegradores;
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
}
