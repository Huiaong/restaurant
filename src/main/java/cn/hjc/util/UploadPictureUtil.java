package cn.hjc.util;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Random;

public class UploadPictureUtil {

    public static String addMutiparFile(MultipartFile file, HttpServletRequest request) throws IOException {
        if (file.isEmpty()) {
            return null;
        } else {
            String name = file.getOriginalFilename();
            String suffixName = name.substring(name.lastIndexOf("."));
            String hash = Integer.toHexString(new Random().nextInt());
            String fileName = hash + suffixName;
            String path = request.getSession().getServletContext().getRealPath("static/images");
            File temFile = new File(path, fileName);
            if (!temFile.getParentFile().mkdir()) {
                temFile.getParentFile().mkdir();
            }
            if (temFile.exists()) {
                temFile.delete();
            }
            temFile.createNewFile();
            file.transferTo(temFile);
            return "http://localhost:8080/static/images/" + temFile.getName();
        }
    }


}
