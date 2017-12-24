package com.shetai.dao.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Repository;

import com.shetai.dao.PhotoDao;
import com.shetai.entity.Photo;

@Repository
public class PhotoDaoImpl extends BaseDaoImpl<Photo> implements PhotoDao{

	private File file;
	
	
	@Override
	public String uploadpic(File orignalfile,String userid) throws IOException {
		String picPath = "";
		file = orignalfile;
		try {
			InputStream in = new FileInputStream(file);
		
		
	    HttpServletRequest request = ServletActionContext.getRequest();
	    String root = request.getRealPath("/shetai_image");//图片要上传到的服务器路径
	    root = root+"/"+userid;
	    System.out.println("root："+root);
	    String fileName="";
	    fileName=getRandomString(20)+".png";
	    picPath=userid+"/"+fileName;//图片保存到数据库的路径
	    
	      System.out.println("开始");
	    
	      File fileLocation = new File(root); 
	      //此处也可以在应用根目录手动建立目标上传目录 
	      if(!fileLocation.exists()){ 
	  	      System.out.println("目录不存在！开始创建");
	        boolean isCreated = fileLocation.mkdir(); 
	        if(!isCreated) { 
		  	      System.out.println("创建失败");
	          //目标上传目录创建失败,可做其他处理,例如抛出自定义异常等,一般应该不会出现这种情况。 
	          return null; 
	        } 
	      }else {
	  	      System.out.println("目录存在！");
	      }
	      
	      File uploadFile = new File(root, fileName);
	      OutputStream out = new FileOutputStream(uploadFile);  
	      byte[] buffer = new byte[1024 * 1024];  
	      int length;  
	      while ((length = in.read(buffer)) > 0) {  
	        out.write(buffer, 0, length);  
	      }
	      in.close();  
	      out.close(); 
	      System.out.println(picPath);
	      
	      
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			
		}
	    return picPath;
	}  
	  
	  public String getRandomString(int length) { //length表示生成字符串的长度 
		    String base = "abcdefghijklmnopqrstuvwxyz0123456789";   
		    Random random = new Random();   
		    StringBuffer sb = new StringBuffer();   
		    for (int i = 0; i < length; i++) {   
		      int number = random.nextInt(base.length());   
		      sb.append(base.charAt(number));   
		    }   
		    return sb.toString();   
		   }

	@Override
	public Photo getPhoto(String pid) {
		Photo p = new Photo();
		p.setPid(pid);
		List<Photo> plist = query("Photo", p);
		return plist.get(0);
	}  
}
