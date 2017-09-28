package com.hsbc.hbmx.payroll.agenda.beans;

import java.io.Serializable;

public class DatosADD implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private GeneralData datGen;
	private DomiciliaryData datDomi;
	private ContactData datContra;
	private BeneficiariesData datBene;
	private Promotor datProm;


	/**
	 * @return the datGen
	 */
	public GeneralData getDatGen() {
		return datGen;
	}
	/**
	 * @param datGen the datGen to set
	 */
	public void setDatGen(GeneralData datGen) {
		this.datGen = datGen;
	}
	/**
	 * @return the datDomi
	 */
	public DomiciliaryData getDatDomi() {
		return datDomi;
	}
	/**
	 * @param datDomi the datDomi to set
	 */
	public void setDatDomi(DomiciliaryData datDomi) {
		this.datDomi = datDomi;
	}
	/**
	 * @return the datContra
	 */
	public ContactData getDatContra() {
		return datContra;
	}
	/**
	 * @param datContra the datContra to set
	 */
	public void setDatContra(ContactData datContra) {
		this.datContra = datContra;
	}
	/**
	 * @return the datBene
	 */
	public BeneficiariesData getDatBene() {
		return datBene;
	}
	/**
	 * @param datBene the datBene to set
	 */
	public void setDatBene(BeneficiariesData datBene) {
		this.datBene = datBene;
	}
	/**
	 * @return the datProm
	 */
	public Promotor getDatProm() {
		return datProm;
	}
	/**
	 * @param datProm the datProm to set
	 */
	public void setDatProm(Promotor datProm) {
		this.datProm = datProm;
	}
}
