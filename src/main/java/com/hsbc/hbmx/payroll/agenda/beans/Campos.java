package com.hsbc.hbmx.payroll.agenda.beans;

import java.io.Serializable;

public class Campos implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String localidad;
	private String colonia;
	/**
	 * @return the localidad
	 */
	public String getLocalidad() {
		return localidad;
	}
	/**
	 * @param localidad the localidad to set
	 */
	public void setLocalidad(String localidad) {
		this.localidad = localidad;
	}
	/**
	 * @return the colonia
	 */
	public String getColonia() {
		return colonia;
	}
	/**
	 * @param colonia the colonia to set
	 */
	public void setColonia(String colonia) {
		this.colonia = colonia;
	}
}
