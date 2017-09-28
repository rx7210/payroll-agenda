package com.hsbc.hbmx.payroll.agenda.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.apache.log4j.Logger;
import org.springframework.util.Base64Utils;

import com.hsbc.hbmx.payroll.agenda.beans.FieldsWaterMark;
import com.hsbc.hbmx.payroll.agenda.beans.User;

/**
 * WaterMark
 *
 */
public class WaterMark extends Utils {
	
	/**
	 * FieldsWaterMark bean.
	 */
	private FieldsWaterMark fieldsWaterMark;

	/**
	 * Constructor.
	 * @param fieldsWaterMark Fields for watermark
	 */
	public WaterMark(FieldsWaterMark fieldsWaterMark) {
		this.fieldsWaterMark = fieldsWaterMark;
	}
	
	/**
     * Logger.
     */
    private final Logger LOGGER = Logger.getLogger(WaterMark.class.getName());
    
	/**
	 * Add watermark to photo.
	 * @param encodedImage Encoded image
	 * @param user User
	 * @return String new encoded image
	 */
	public String addWaterMark(final String encodedImage, final User user) {
		String imageEncode = "";
		try {
			ByteArrayInputStream bais = new ByteArrayInputStream(Base64Utils.decodeFromString(encodedImage));
			BufferedImage biPhoto = ImageIO.read(bais);

			int widthPhoto = biPhoto.getWidth();
			int heightPhoto = biPhoto.getHeight();

			/*
			System.out.println("widthPhoto: " + widthPhoto);
			System.out.println("heightPhoto: " + heightPhoto);
			
			if (1600 < widthPhoto) {
				widthPhoto = 1600;
			}
			if (1290 < heightPhoto) {
				heightPhoto = 1200;
			}
			*/
			
			//Generate watermark in image 
			BufferedImage biWaterMark = imgWaterMark(widthPhoto, user);

			//Generate new image (photo and watermark)
			BufferedImage imgWithWaterMark = new BufferedImage(widthPhoto, heightPhoto + biWaterMark.getHeight(), BufferedImage.TYPE_INT_RGB);

			final boolean imgCreated = imgWithWaterMark.createGraphics().drawImage(biPhoto, 0, 0, null);
			if (imgCreated) {
				final boolean imgCreatedWM = imgWithWaterMark.createGraphics().drawImage(biWaterMark, 0, heightPhoto, null); 
				if (imgCreatedWM) {
					
					//For test generate photo with watermark on file system
					//ImageUtils.generateFileImage(imgWithWaterMark, "png", "temporal.png", "/nas/htsl-m318/nomina/");

					ByteArrayOutputStream bos = new ByteArrayOutputStream();

					ImageIO.write(imgWithWaterMark, "png", bos);
					byte[] imageBytes = bos.toByteArray();

					imageEncode = Base64Utils.encodeToString(imageBytes);
				}
			}

			this.LOGGER.info("FOTO CON MARCA DE AGUA AGREGADA");
		} catch (IOException exc) {
			this.LOGGER.debug(stackTracetoString(exc));
		}

		return imageEncode;
	}
	
	
	/**
	 * Generate watermark in image.
	 * @param widthImage Image width
	 * @param user User
	 * @return BufferedImage Image
	 */
	private BufferedImage imgWaterMark(final int widthImage, final User user) {
		BufferedImage bufferedImage = new BufferedImage(widthImage, this.fieldsWaterMark.getHeightImg(), BufferedImage.TYPE_INT_RGB);
		
		Graphics2D graphics2D = bufferedImage.createGraphics();
		graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
		graphics2D.setColor(Color.white);
		graphics2D.fillRect(0, 0, widthImage, this.fieldsWaterMark.getHeightImg());
		
		graphics2D.setColor(Color.black);
		graphics2D.setFont(new Font(this.fieldsWaterMark.getFont(), this.fieldsWaterMark.getFontStyle(), this.fieldsWaterMark.getFontSize()));
	
		graphics2D.drawString(this.fieldsWaterMark.getWaterMark(), this.fieldsWaterMark.getPosX(), this.fieldsWaterMark.getPosYWaterMark());
		graphics2D.drawString(user.getUserName().toUpperCase(), this.fieldsWaterMark.getPosX(), this.fieldsWaterMark.getPosYUserName());
		graphics2D.drawString(user.getUserId() + "   " +this.fieldsWaterMark.getAppWaterMark(), this.fieldsWaterMark.getPosX(), this.fieldsWaterMark.getPosYUserID());
		
		graphics2D.dispose();
		
		this.LOGGER.info("MARCA DE AGUA GENERADA COMO IMAGEN");
		
		return bufferedImage;
	}
	
}
