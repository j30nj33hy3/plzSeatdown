package com.bg.plzSeatdown.common.vo;

import java.text.SimpleDateFormat;

public class FileRename {
   public static String rename(String originFileName) {
      
      // 국화.jpg
      // 200309124515123456.jpg
      // => 20.03.09.12:45:15 + 123456(랜덤6자리).jpg
      
      SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
      String date = sdf.format(new java.util.Date(System.currentTimeMillis()));
      
      StringBuffer sb = new StringBuffer();
      for(int i=0 ; i<6 ; i++) {
         sb.append((int)(Math.random()*10));
      }
      
      String ext = originFileName.substring(originFileName.lastIndexOf("."));
      
      return date + "_" + sb.toString() + ext;
   }
}