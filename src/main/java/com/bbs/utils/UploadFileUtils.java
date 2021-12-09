package com.bbs.utils;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.apache.commons.fileupload.FileUpload;
import org.springframework.util.FileCopyUtils;
import net.coobird.thumbnailator.Thumbnails;

public class UploadFileUtils {
  
	static final int THUMB_WIDTH = 300;
	static final int THUMB_HEIGHT = 300;
 
public static String fileUpload(String uploadPath, String fileName, byte[] fileData) throws Exception {
	 
	String newFileName = "";
	 
	UUID uid = UUID.randomUUID();
	
	if(!fileName.isEmpty()) {
		
		newFileName = uid + "_" + fileName;
		
		System.out.println("============= fileData ========> "+fileData);
		
	}

	
		
  
	
  String imgPath = "C:\\beansFarm\\review";

  File target = new File(imgPath, newFileName);
  FileCopyUtils.copy(fileData, target);
  
  String thumbFileName = "s_" + newFileName;
	File image = new File(imgPath + File.separator + newFileName);

	File thumbnail = new File(imgPath + File.separator + thumbFileName);

	if (image.exists()) {
			thumbnail.getParentFile().mkdirs();
			Thumbnails.of(image).size(THUMB_WIDTH, THUMB_HEIGHT).toFile(thumbnail);
			
			}
	
	
		return newFileName;
		
		
	}


	public static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath, yearPath, monthPath, datePath);
		makeDir(uploadPath, yearPath, monthPath, datePath + "\\s");
		
		return datePath;
	}

 private static void makeDir(String uploadPath, String... paths) {

  if (new File(paths[paths.length - 1]).exists()) { return; }

  for (String path : paths) {
   File dirPath = new File(uploadPath + path);

   if (!dirPath.exists()) {
    dirPath.mkdir();
   }
  }
 }
}