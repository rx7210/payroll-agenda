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

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang.StringUtils;

/**
 * <p>
 * <b> EditPdf. </b>
 * </p>
 */
public class EncodeDecodeFile {

    /**
     * <p>
     * <b> Encode pdf. </b>
     * </p>
     * 
     * @param sourceFile
     *            Pdf file source
     * @return String Bytes in Base64
     * @throws Exception
     *             exception
     */
    public String encodePdf(final String sourceFile) throws Exception {
        byte[] base64EncodedData = Base64.encodeBase64(loadFileAsBytesArray(sourceFile), true);

        return new String(base64EncodedData);
    }

    /**
     * <p>
     * <b> Decode pdf. </b>
     * </p>
     * 
     * @param targetFile
     *            Target pdf
     * @param encodePdf
     *            String of bytes
     * @return String path file
     * @throws IOException
     */
    public String decodePdf(final String path, final String targetFile, final String encodePdf) throws IOException {
        byte[] decoded = org.apache.commons.codec.binary.Base64.decodeBase64(encodePdf.getBytes());

        return writeByteArraysToFile(path, targetFile, decoded);
    }

    /**
     * <p>
     * <b> Get byte of pdf file. </b>
     * </p>
     * 
     * @param fileName
     *            File name
     * @return byte[] Array
     * @throws Exception
     *             Exception
     */
    private byte[] loadFileAsBytesArray(final String fileName) throws Exception {
        File file = new File(fileName);
        int length = (int) file.length();
        BufferedInputStream reader = new BufferedInputStream(new FileInputStream(file));
        byte[] bytes = new byte[length];
        reader.read(bytes, 0, length);
        reader.close();

        return bytes;
    }

    /**
     * <p>
     * <b> Create file from an array. </b>
     * </p>
     * 
     * @param fileName
     *            File name
     * @param content
     *            content in byte[]
     * @return String path
     * @throws IOException
     *             Exception
     */
    private String writeByteArraysToFile(final String path, final String targetFile, final byte[] content) throws IOException {
        File file = new File(path, targetFile);

        if (file.exists()) {
            // if file exist, it is deleted
            file.delete();
        }

        BufferedOutputStream writer = new BufferedOutputStream(new FileOutputStream(file));
        writer.write(content);
        writer.flush();
        writer.close();

        return file.getAbsolutePath();
    }
    
    public String strDecode(final String strEncode) {
    	String strDecode = "";
    	if (StringUtils.isNotBlank(strEncode)) {
    		strDecode = org.apache.commons.codec.binary.StringUtils.newStringIso8859_1(Base64.decodeBase64(strEncode));
    	}
    	return strDecode;
    }
}
