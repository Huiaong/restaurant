package cn.hjc.util;

import org.apache.commons.lang3.time.DateUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;


public class ImgUploadUtil {

    public static String imgUpload(MultipartFile imgFile, HttpServletRequest request) throws IOException {
        String filePath = "d:\\image";//保存图片的路径
        // 获取原始图片的拓展名
        String originalFilename = imgFile.getOriginalFilename();
        //新的文件名字
        String newFileName = UUID.randomUUID()+originalFilename;
        //封装上传文件位置的全路径
        File targetFile=new File(filePath,newFileName);
        //把本地文件上传到封装上传文件位置的全路径
        imgFile.transferTo(targetFile);

        return newFileName;
    }
}
