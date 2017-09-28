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
 * <b> Insert description of the Promotor. </b>
 * </p>
 */
public class Promotor implements Serializable {

    /**
     * <p>
     * <b> serialVersionUID. </b>
     * </p>
     */
    private static final long serialVersionUID = 1L;

    private String clavePromo;
    private String nombrePromotor;
    private String sucursal;
    private String email;
	/**
	 * @return the clavePromo
	 */
	public String getClavePromo() {
		return clavePromo;
	}
	/**
	 * @param clavePromo the clavePromo to set
	 */
	public void setClavePromo(String clavePromo) {
		this.clavePromo = clavePromo;
	}
	/**
	 * @return the nombrePromotor
	 */
	public String getNombrePromotor() {
		return nombrePromotor;
	}
	/**
	 * @param nombrePromotor the nombrePromotor to set
	 */
	public void setNombrePromotor(String nombrePromotor) {
		this.nombrePromotor = nombrePromotor;
	}
	/**
	 * @return the sucursal
	 */
	public String getSucursal() {
		return sucursal;
	}
	/**
	 * @param sucursal the sucursal to set
	 */
	public void setSucursal(String sucursal) {
		this.sucursal = sucursal;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
}
