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
 * <b> CameraProperties. </b>
 * </p>
 */
public class CameraProperties implements Serializable{

	/**
     * <p>
     * <b> serialVersionUID. </b>
     * </p>
     */
	private static final long serialVersionUID = -3243527129889027084L;
	
	private String width = "800";
	
	private String height = "600";
	
	private String destWidth = "800";
	
	private String destHeight = "600";
	
	private String imageFormat = "jpeg";
	
	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getDestWidth() {
		return destWidth;
	}

	public void setDestWidth(String destWidth) {
		this.destWidth = destWidth;
	}

	public String getDestHeight() {
		return destHeight;
	}

	public void setDestHeight(String destHeight) {
		this.destHeight = destHeight;
	}

	public String getImageFormat() {
		return imageFormat;
	}

	public void setImageFormat(String imageFormat) {
		this.imageFormat = imageFormat;
	} 

}
