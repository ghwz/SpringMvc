package zw.utils;

import java.security.MessageDigest;

public class Util {
    /**
     * 与php md5加密一致
     * @param str
     * @return
     */
    public static String md5(String str) {
        try{
            /** 创建MD5加密对象 */
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            /** 进行加密 */
            md5.update(str.getBytes());
            /** 获取加密后的字节数组 */
            byte[] md5Bytes = md5.digest();
            String res = "";
            for (int i = 0; i < md5Bytes.length; i++){
                int temp = md5Bytes[i] & 0xFF;
                if (temp <= 0XF){ // 转化成十六进制不够两位，前面加零
                    res += "0";
                }
                res += Integer.toHexString(temp);
            }
            return res;
        }catch( Exception e ){
            e.printStackTrace();

            return null;
        }
    }
}
