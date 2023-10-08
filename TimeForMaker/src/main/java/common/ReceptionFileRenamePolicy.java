package main.java.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class ReceptionFileRenamePolicy implements FileRenamePolicy{
	@Override
	public File rename(File originFile) {
		
		String originName = originFile.getName();
		
		// 수정파일명 :  + 파일업로드된시간(년월일시분초)
		// 확장자 : 원본파일 확장자 그대로 
		
		// 1. 파일 업로드된 시간 -> String currentTime;
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 2. 4자리 랜덤값
		int ran = (int)(Math.random()*9000)+1000;
		
		// 3. 원본파일의 확장자(String ext)
		// 원본파일명에서 가장 마지막 위치의 .의 인덱스를 기준으로 확장자 구하기(파일명 중간에 .이 들어가는 케이스도 있기 때문)
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ran + ext;
		
		return new File(originFile.getParent(),changeName);
	}
}
