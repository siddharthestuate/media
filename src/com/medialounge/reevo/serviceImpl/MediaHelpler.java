package com.medialounge.reevo.serviceImpl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.medialounge.reevo.dto.UploadDto;

/**
 * @author Ramachandran R
 *
 */
@Service("mediaHelpler")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class MediaHelpler {

	private static Properties properties = new Properties();
	private static String uploadDir = null;
	private static String mapping = null; 
	private static String image = null;
	private static String audio = null;
	private static String video = null;
	private static String docs = null;
	private static String userSize = null;
	private static String location = null;
    private static String fileSeparator = null;

	public MediaHelpler() throws IOException {

		// Reading data from properties
		properties.load(getClass().getResourceAsStream("/resources/database.properties"));
		
		fileSeparator = properties.getProperty("upload.file.separator");
		mapping = properties.getProperty("upload.file.mapping");
	    location = fileSeparator + mapping;
	    
	    uploadDir = properties.getProperty("upload.file.path");
		//downloadDir = properties.getProperty("upload.file.path");
		
		image = properties.getProperty("upload.file.image");
		audio = properties.getProperty("upload.file.audio");
		video = properties.getProperty("upload.file.video");
		docs = properties.getProperty("upload.file.doc");
		
		userSize = properties.getProperty("upload.file.size");
	}
	
	String mediaFileName = "";
	String contentType = "";
	String destinatioPath = "";
	String contentPath = "";
	String ext = "";
	String fileNameWithOutExt = "";
	
	String uploadFileName = "";
	String docPath = "";
	String date_time = "";
	
	List<String> values = null;
	UploadDto uploadDto;
	int maxUserSize = 0;
	
	public UploadDto uploadFiles(int userId, List<MultipartFile> files) throws IOException  {
				
	    Calendar cal = Calendar.getInstance();
	  
	    int year = cal.get(Calendar.YEAR);
	    int month = cal.get(Calendar.MONTH);      // 0 to 11
	    int day = cal.get(Calendar.DAY_OF_MONTH);
	    int hour = cal.get(Calendar.HOUR_OF_DAY);
	    int minute = cal.get(Calendar.MINUTE);
	    int second = cal.get(Calendar.SECOND);
	    date_time = "-"+day+(month+1)+year+hour+minute+second;
		  
		
		uploadDto = new UploadDto();
		List<String> fileNames = new ArrayList<String>();
		maxUserSize = Integer.parseInt(userSize); // 52428800
	
		// checking parent directory available or not and creating directory if not
		File uploadDirectory = new File(uploadDir);
		if (!uploadDirectory.exists()) {
			uploadDirectory.mkdir();
		}
		
		// inside directory creating user directory
		File userDirectory = new File(uploadDirectory + fileSeparator + userId);
		if (!userDirectory.exists()) {
			userDirectory.mkdir();
		}
		
		if (null != files && files.size() > 0) {
			for (MultipartFile multipartFile : files) {
				mediaFileName = multipartFile.getOriginalFilename();
				contentType = multipartFile.getContentType();
				ext = FilenameUtils.getExtension(mediaFileName);
				fileNameWithOutExt = FilenameUtils.removeExtension(mediaFileName);

				// checking image, audio, video directory available or not and
				// creating directory if not
				if (contentType.equals("image/pjpeg")
						|| contentType.equals("image/jpeg")
						|| contentType.equals("image/gif")
						|| contentType.equals("image/png")
						|| contentType.equals("image/jpg")
						|| contentType.equals("image/tiff")
						|| contentType.equals("image/svg+xml")) {
					File imageDirectory = new File(uploadDirectory + fileSeparator + userId + fileSeparator + image);
					if (!imageDirectory.exists()) {
						imageDirectory.mkdir();
					}
					destinatioPath = uploadDir + fileSeparator + userId + fileSeparator + image + fileSeparator + fileNameWithOutExt + date_time+"."+ ext;
					contentPath = location + fileSeparator + userId + fileSeparator + image + fileSeparator + fileNameWithOutExt + date_time+"." + ext;
					//contentPath = contentPath.replace("\\", "/");
				} else if (contentType.equals("audio/mpeg")
						|| contentType.equals("audio/mp3")
						|| contentType.equals("audio/basic")
						|| contentType.equals("audio/L24")
						|| contentType.equals("audio/ogg")
						|| contentType.equals("audio/vorbis")
						|| contentType.equals("audio/vnd.rn-realaudio")
						|| contentType.equals("audio/vnd.wave")
						|| contentType.equals("audio/webm")) {
					File audioDirectory = new File(uploadDirectory + fileSeparator
							+ userId + fileSeparator + audio);
					if (!audioDirectory.exists()) {
						audioDirectory.mkdir();
					}
					destinatioPath = uploadDir + fileSeparator + userId + fileSeparator + audio + fileSeparator + fileNameWithOutExt + date_time+"."+ ext;
					contentPath = location + fileSeparator + userId + fileSeparator + audio + fileSeparator + fileNameWithOutExt + date_time+"." + ext;
					//contentPath = contentPath.replace("\\", "/");
				} else if (contentType.equals("video/x-ms-wmv")
						|| contentType.equals("video/mpeg")
						|| contentType.equals("video/mp4")
						|| contentType.equals("video/ogg")
						|| contentType.equals("video/quicktime")
						|| contentType.equals("video/webm")
						|| contentType.equals("video/x-matroska")
						|| contentType.equals("video/flv")
						|| contentType.equals("video/x-flv")) {
					File videoDirectory = new File(uploadDirectory + fileSeparator
							+ userId + fileSeparator + video);
					if (!videoDirectory.exists()) {
						videoDirectory.mkdir();
					}
					destinatioPath = uploadDir + fileSeparator + userId + fileSeparator + video + fileSeparator + fileNameWithOutExt + date_time+"."+ ext;
					contentPath = location + fileSeparator + userId + fileSeparator + video + fileSeparator + fileNameWithOutExt + date_time+"." + ext;
					//contentPath = contentPath.replace("\\", "/");
				}
				
				if (contentType.equals("text/plain")|| contentType.equals("text/enriched")
						|| contentType.equals("text/html")
						|| contentType.equals("text/rfc822-headers")
						|| contentType.equals("text/richtext")
						|| contentType.equals("text/sgml")
						|| contentType.equals("application/msword")
						|| contentType.equals("application/vnd.ms-excel")
						|| contentType.equals("text/cmd")
						|| contentType.equals("text/css")
						|| contentType.equals("text/csv")
						|| contentType.equals("text/jsp")
						|| contentType.equals("text/java")
						|| contentType.equals("text/javascript")
						|| contentType.equals("text/vcard")
						|| contentType.equals("text/xml")
						|| contentType.equals("text/txt")
						|| contentType.equals("text/rtf")
						|| contentType.equals("text/xlsx")	
						|| contentType.equals("application/octet-stream")
						|| contentType.equals("application/pdf")
						|| contentType.equals("application/vnd.ms-powerpoint")) {
					File docDirectory = new File(uploadDirectory + fileSeparator + userId + fileSeparator + docs);
					if (!docDirectory.exists()) {
						docDirectory.mkdir();
					}
					destinatioPath = uploadDir + fileSeparator + userId + fileSeparator + docs + fileSeparator + fileNameWithOutExt + date_time+"."+ ext;
					contentPath = location + fileSeparator + userId + fileSeparator + docs + fileSeparator + fileNameWithOutExt + date_time+"." + ext;
					//contentPath = contentPath.replace("\\", "/");
				}
					
				// write the file to disk
				try{
					if(!(destinatioPath==null)){
					
						InputStream inputStream = multipartFile.getInputStream();
						OutputStream outputStream = new FileOutputStream(destinatioPath);
						int readBytes = 0;
						byte[] buffer = new byte[maxUserSize]; // use buffer.length instead of 10000 
						while ((readBytes = inputStream.read(buffer, 0, buffer.length)) != -1) {
							outputStream.write(buffer, 0, readBytes);
						}
						outputStream.close();
						inputStream.close();
						fileNames.add(mediaFileName);
						}
					
				}catch(FileNotFoundException e){
					e.printStackTrace();
				}catch (Exception e) {
					e.printStackTrace();
				}
				
			}
		}
		
		uploadDto.setContentPath(contentPath);
		//uploadDto.setContentPath(destinatioPath);
		uploadDto.setContentType(contentType);
		return uploadDto;
	}

	public void downloadFiles(HttpServletRequest request,
			HttpServletResponse response, String mediaPath) throws IOException {
		
		maxUserSize =  Integer.parseInt(userSize);

		// get absolute path of the application
		ServletContext context = request.getServletContext();
		
		File downloadFile = new File(uploadDir+mediaPath.replace(mapping, ""));
		FileInputStream inputStream = new FileInputStream(downloadFile);

		// get MIME type of the file
		String mimeType = context.getMimeType(mediaPath);
		if (mimeType == null) {
			// set to binary type if MIME mapping not found
			mimeType = "application/octet-stream";
		}

		// set content attributes for the response
		response.setContentType(mimeType);
		response.setContentLength((int) downloadFile.length());
		
		// set headers for the response
		String headerKey = "Content-Disposition";
		String headerValue = String.format("attachment; filename=\"%s\"",
				downloadFile.getName());
		response.setHeader(headerKey, headerValue);

		// get output stream of the response
		OutputStream outStream = response.getOutputStream();

		byte[] buffer = new byte[maxUserSize];
		int bytesRead = -1;

		// write bytes read from the input stream into the output stream
		while ((bytesRead = inputStream.read(buffer)) != -1) {
			outStream.write(buffer, 0, bytesRead);
		}

		inputStream.close();
		outStream.close();
	}
	
}
