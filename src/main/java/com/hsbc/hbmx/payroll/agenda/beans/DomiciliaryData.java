package com.hsbc.hbmx.payroll.agenda.beans;

import java.io.Serializable;

public class DomiciliaryData implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String postalcode;
	private String state;
	private String city;
	private String municipality;
	private String colony;
	private String street;
	private String changeCountry;
	private String oldcountry;
	private String numExt;
	private String numInt;
	/**
	 * @return the postalcode
	 */
	public String getPostalcode() {
		return postalcode;
	}
	/**
	 * @param postalcode the postalcode to set
	 */
	public void setPostalcode(String postalcode) {
		this.postalcode = postalcode;
	}
	/**
	 * @return the state
	 */
	public String getState() {
		return state;
	}
	/**
	 * @param state the state to set
	 */
	public void setState(String state) {
		this.state = state;
	}
	/**
	 * @return the city
	 */
	public String getCity() {
		return city;
	}
	/**
	 * @param city the city to set
	 */
	public void setCity(String city) {
		this.city = city;
	}
	/**
	 * @return the municipality
	 */
	public String getMunicipality() {
		return municipality;
	}
	/**
	 * @param municipality the municipality to set
	 */
	public void setMunicipality(String municipality) {
		this.municipality = municipality;
	}
	/**
	 * @return the colony
	 */
	public String getColony() {
		return colony;
	}
	/**
	 * @param colony the colony to set
	 */
	public void setColony(String colony) {
		this.colony = colony;
	}
	/**
	 * @return the street
	 */
	public String getStreet() {
		return street;
	}
	/**
	 * @param street the street to set
	 */
	public void setStreet(String street) {
		this.street = street;
	}
	/**
	 * @return the changeCountry
	 */
	public String getChangeCountry() {
		return changeCountry;
	}
	/**
	 * @param changeCountry the changeCountry to set
	 */
	public void setChangeCountry(String changeCountry) {
		this.changeCountry = changeCountry;
	}
	/**
	 * @return the oldcountry
	 */
	public String getOldcountry() {
		return oldcountry;
	}
	/**
	 * @param oldcountry the oldcountry to set
	 */
	public void setOldcountry(String oldcountry) {
		this.oldcountry = oldcountry;
	}
	/**
	 * @return the numExt
	 */
	public String getNumExt() {
		return numExt;
	}
	/**
	 * @param numExt the numExt to set
	 */
	public void setNumExt(String numExt) {
		this.numExt = numExt;
	}
	/**
	 * @return the numInt
	 */
	public String getNumInt() {
		return numInt;
	}
	/**
	 * @param numInt the numInt to set
	 */
	public void setNumInt(String numInt) {
		this.numInt = numInt;
	}
}
