/**
 * 
 */
package com.hsbc.hbmx.payroll.agenda.beans;

import java.io.Serializable;

/**
 * @author 43700225
 * 
 */
public class GlobalStandard implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String account = "";

	private String clientName = "";
	
	private String keyDoc = "";
	
	private String pdfEncoded = "";
	
	private String fieldsGS = "";
	
	private String depositNo = "X";
	
	private String depositYes = "";
	
	private String noTxnByMonth = "";
	
	private String totMxn = "";
	
	private String totUsd = "";

	private String sendReceiveNo = "X";
	
	private String sendReceiveYes = "";
	
	private String countryWithSanctionNo = "X";
	
	private String countryWithSanctionYes = "";
	
	private String countryWithSanction = "";

	private String changeContryNo = "X";
	
	private String changeContryYes = "";
	
	private String changedCountry = "";

	private String nameChangedNo = "X";
	
	private String nameChangedYes = "";
	
	private String oldNames = "";
	
	private String oldSurnames = "";

	/**
	 * @return the account
	 */
	public String getAccount() {
		return this.account;
	}

	/**
	 * @param account the account to set
	 */
	public void setAccount(final String account) {
		this.account = account;
	}
	
	/**
	 * @return the clientName
	 */
	public String getClientName() {
		return this.clientName;
	}

	/**
	 * @param clientName the clientName to set
	 */
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	/**
	 * @return the keyDoc
	 */
	public String getKeyDoc() {
		return this.keyDoc;
	}

	/**
	 * @param keyDoc the keyDoc to set
	 */
	public void setKeyDoc(String keyDoc) {
		this.keyDoc = keyDoc;
	}

	/**
	 * @return the pdfEncoded
	 */
	public String getPdfEncoded() {
		return this.pdfEncoded;
	}

	/**
	 * @param pdfEncoded the pdfEncoded to set
	 */
	public void setPdfEncoded(String pdfEncoded) {
		this.pdfEncoded = pdfEncoded;
	}

	/**
	 * @return the fieldsGS
	 */
	public String getFieldsGS() {
		return fieldsGS;
	}

	/**
	 * @param fieldsGS the fieldsGS to set
	 */
	public void setFieldsGS(String fieldsGS) {
		this.fieldsGS = fieldsGS;
	}

	/**
	 * @return the depositNo
	 */
	public String getDepositNo() {
		return depositNo;
	}

	/**
	 * @param depositNo the depositNo to set
	 */
	public void setDepositNo(String depositNo) {
		this.depositNo = depositNo;
	}

	/**
	 * @return the depositYes
	 */
	public String getDepositYes() {
		return depositYes;
	}

	/**
	 * @param depositYes the depositYes to set
	 */
	public void setDepositYes(String depositYes) {
		this.depositYes = depositYes;
	}

	/**
	 * @return the noTxnByMonth
	 */
	public String getNoTxnByMonth() {
		return noTxnByMonth;
	}

	/**
	 * @param noTxnByMonth the noTxnByMonth to set
	 */
	public void setNoTxnByMonth(String noTxnByMonth) {
		this.noTxnByMonth = noTxnByMonth;
	}

	/**
	 * @return the totMxn
	 */
	public String getTotMxn() {
		return totMxn;
	}

	/**
	 * @param totMxn the totMxn to set
	 */
	public void setTotMxn(String totMxn) {
		this.totMxn = totMxn;
	}

	/**
	 * @return the totUsd
	 */
	public String getTotUsd() {
		return totUsd;
	}

	/**
	 * @param totUsd the totUsd to set
	 */
	public void setTotUsd(String totUsd) {
		this.totUsd = totUsd;
	}

	/**
	 * @return the sendReceiveNo
	 */
	public String getSendReceiveNo() {
		return sendReceiveNo;
	}

	/**
	 * @param sendReceiveNo the sendReceiveNo to set
	 */
	public void setSendReceiveNo(String sendReceiveNo) {
		this.sendReceiveNo = sendReceiveNo;
	}

	/**
	 * @return the sendReceiveYes
	 */
	public String getSendReceiveYes() {
		return sendReceiveYes;
	}

	/**
	 * @param sendReceiveYes the sendReceiveYes to set
	 */
	public void setSendReceiveYes(String sendReceiveYes) {
		this.sendReceiveYes = sendReceiveYes;
	}

	/**
	 * @return the countryWithSanctionNo
	 */
	public String getCountryWithSanctionNo() {
		return countryWithSanctionNo;
	}

	/**
	 * @param countryWithSanctionNo the countryWithSanctionNo to set
	 */
	public void setCountryWithSanctionNo(String countryWithSanctionNo) {
		this.countryWithSanctionNo = countryWithSanctionNo;
	}

	/**
	 * @return the countryWithSanctionYes
	 */
	public String getCountryWithSanctionYes() {
		return countryWithSanctionYes;
	}

	/**
	 * @param countryWithSanctionYes the countryWithSanctionYes to set
	 */
	public void setCountryWithSanctionYes(String countryWithSanctionYes) {
		this.countryWithSanctionYes = countryWithSanctionYes;
	}

	/**
	 * @return the countryWithSanction
	 */
	public String getCountryWithSanction() {
		return countryWithSanction;
	}

	/**
	 * @param countryWithSanction the countryWithSanction to set
	 */
	public void setCountryWithSanction(String countryWithSanction) {
		this.countryWithSanction = countryWithSanction.replace("+", " ");
	}

	/**
	 * @return the changeContryNo
	 */
	public String getChangeContryNo() {
		return changeContryNo;
	}

	/**
	 * @param changeContryNo the changeContryNo to set
	 */
	public void setChangeContryNo(String changeContryNo) {
		this.changeContryNo = changeContryNo;
	}

	/**
	 * @return the changeContryYes
	 */
	public String getChangeContryYes() {
		return changeContryYes;
	}

	/**
	 * @param changeContryYes the changeContryYes to set
	 */
	public void setChangeContryYes(String changeContryYes) {
		this.changeContryYes = changeContryYes;
	}

	/**
	 * @return the changedCountry
	 */
	public String getChangedCountry() {
		return changedCountry;
	}

	/**
	 * @param changedCountry the changedCountry to set
	 */
	public void setChangedCountry(String changedCountry) {
		this.changedCountry = changedCountry.replace("+", " ");
	}

	/**
	 * @return the nameChangedNo
	 */
	public String getNameChangedNo() {
		return nameChangedNo;
	}

	/**
	 * @param nameChangedNo the nameChangedNo to set
	 */
	public void setNameChangedNo(String nameChangedNo) {
		this.nameChangedNo = nameChangedNo;
	}

	/**
	 * @return the nameChangedYes
	 */
	public String getNameChangedYes() {
		return nameChangedYes;
	}

	/**
	 * @param nameChangedYes the nameChangedYes to set
	 */
	public void setNameChangedYes(String nameChangedYes) {
		this.nameChangedYes = nameChangedYes;
	}

	/**
	 * @return the oldNames
	 */
	public String getOldNames() {
		return oldNames;
	}

	/**
	 * @param oldNames the oldNames to set
	 */
	public void setOldNames(String oldNames) {
		this.oldNames = oldNames;
	}

	/**
	 * @return the oldSurnames
	 */
	public String getOldSurnames() {
		return oldSurnames;
	}

	/**
	 * @param oldSurnames the oldSurnames to set
	 */
	public void setOldSurnames(String oldSurnames) {
		this.oldSurnames = oldSurnames;
	}
}
