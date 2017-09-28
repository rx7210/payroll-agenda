/*
 * COPYRIGHT. HSBC HOLDINGS PLC 2017. ALL RIGHTS RESERVED.
 * 
 * This software is only to be used for the purpose for which it has been
 * provided. No part of it is to be reproduced, disassembled, transmitted,
 * stored in a retrieval system nor translated in any human or computer
 * language in any way or for any other purposes whatsoever without the prior
 * written consent of HSBC Holdings plc.
 */
package com.hsbc.hbmx.payroll.agenda.pdfs;

import java.io.Serializable;

/**
 * <p>
 * <b> FilePdf. </b>
 * </p>
 */
public class FieldPdf implements Serializable {

    /**
     * <p>
     * <b> serialVersionUID. </b>
     * </p>
     */
    private static final long serialVersionUID = 1L;

    private String tipo = "";

    private String nomCampo = "";

    private String text = "";

    private int posX = 0;

    private int posY = 0;

    private String font = "";

    private int fontSize = 0;

    private int scale = 0;

    /**
     * @return the tipo
     */
    public String getTipo() {
        return this.tipo;
    }

    /**
     * @param tipo
     *            the tipo to set
     */
    public void setTipo(final String tipo) {
        this.tipo = tipo;
    }

    /**
     * @return the nomCampo
     */
    public String getNomCampo() {
        return this.nomCampo;
    }

    /**
     * @param nomCampo
     *            the nomCampo to set
     */
    public void setNomCampo(final String nomCampo) {
        this.nomCampo = nomCampo;
    }

    /**
     * @return the text
     */
    public String getText() {
        return this.text;
    }

    /**
     * @param text
     *            the text to set
     */
    public void setText(final String text) {
        this.text = text;
    }

    /**
     * @return the posX
     */
    public int getPosX() {
        return this.posX;
    }

    /**
     * @param posX
     *            the posX to set
     */
    public void setPosX(final int posX) {
        this.posX = posX;
    }

    /**
     * @return the posY
     */
    public int getPosY() {
        return this.posY;
    }

    /**
     * @param posY
     *            the posY to set
     */
    public void setPosY(final int posY) {
        this.posY = posY;
    }

    /**
     * @return the font
     */
    public String getFont() {
        return this.font;
    }

    /**
     * @param font
     *            the font to set
     */
    public void setFont(final String font) {
        this.font = font;
    }

    /**
     * @return the fontSize
     */
    public int getFontSize() {
        return this.fontSize;
    }

    /**
     * @param fontSize
     *            the fontSize to set
     */
    public void setFontSize(final int fontSize) {
        this.fontSize = fontSize;
    }

    /**
     * @return the scale
     */
    public int getScale() {
        return this.scale;
    }

    /**
     * @param scale
     *            the scale to set
     */
    public void setScale(final int scale) {
        this.scale = scale;
    }
}
