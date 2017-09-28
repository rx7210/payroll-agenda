package com.hsbc.hbmx.payroll.agenda.beans;

import java.io.Serializable;

public class FieldsWaterMark implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int heightImg = 0;

	private String font = "";

	private int fontStyle = 0;

	private int fontSize = 0;

	private String waterMark = "";
	
	private int posX = 0;

	private int posYWaterMark = 0;

	private int posYUserName = 0;
	
	private String appWaterMark = "";
	
	private int posYUserID = 0;

	/**
	 * @return the heightImg
	 */
	public int getHeightImg() {
		return this.heightImg;
	}

	/**
	 * @param heightImg the heightImg to set
	 */
	public void setHeightImg(int heightImg) {
		this.heightImg = heightImg;
	}

	/**
	 * @return the font
	 */
	public String getFont() {
		return this.font;
	}

	/**
	 * @param font the font to set
	 */
	public void setFont(String font) {
		this.font = font;
	}

	/**
	 * @return the fontStyle
	 */
	public int getFontStyle() {
		return this.fontStyle;
	}

	/**
	 * @param fontStyle the fontStyle to set
	 */
	public void setFontStyle(int fontStyle) {
		this.fontStyle = fontStyle;
	}

	/**
	 * @return the fontSize
	 */
	public int getFontSize() {
		return this.fontSize;
	}

	/**
	 * @param fontSize the fontSize to set
	 */
	public void setFontSize(int fontSize) {
		this.fontSize = fontSize;
	}

	/**
	 * @return the waterMark
	 */
	public String getWaterMark() {
		return this.waterMark;
	}

	/**
	 * @param waterMark the waterMark to set
	 */
	public void setWaterMark(String waterMark) {
		this.waterMark = waterMark;
	}

	/**
	 * @return the appWaterMark
	 */
	public String getAppWaterMark() {
		return this.appWaterMark;
	}

	/**
	 * @param appWaterMark the appWaterMark to set
	 */
	public void setAppWaterMark(String appWaterMark) {
		this.appWaterMark = appWaterMark;
	}

	/**
	 * @return the posX
	 */
	public int getPosX() {
		return this.posX;
	}

	/**
	 * @param posX the posX to set
	 */
	public void setPosX(int posX) {
		this.posX = posX;
	}

	/**
	 * @return the posYWaterMark
	 */
	public int getPosYWaterMark() {
		return this.posYWaterMark;
	}

	/**
	 * @param posYWaterMark the posYWaterMark to set
	 */
	public void setPosYWaterMark(int posYWaterMark) {
		this.posYWaterMark = posYWaterMark;
	}

	/**
	 * @return the posYUserName
	 */
	public int getPosYUserName() {
		return this.posYUserName;
	}

	/**
	 * @param posYUserName the posYUserName to set
	 */
	public void setPosYUserName(int posYUserName) {
		this.posYUserName = posYUserName;
	}

	/**
	 * @return the posYUserID
	 */
	public int getPosYUserID() {
		return this.posYUserID;
	}

	/**
	 * @param posYUserID the posYUserID to set
	 */
	public void setPosYUserID(int posYUserID) {
		this.posYUserID = posYUserID;
	}
}
