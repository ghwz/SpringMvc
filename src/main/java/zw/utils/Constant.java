package zw.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class Constant {
    private static final Logger logger = LoggerFactory.getLogger(Constant.class);

    private static Properties props;
    static{
        loadProps();
    }
    synchronized static private void loadProps(){
        props = new Properties();
        InputStream inputStream=null;
        try {
            inputStream = Constant.class.getClassLoader().getResourceAsStream("constants.properties");
            props.load(inputStream);
        } catch (IOException e) {
            logger.error("data.properties no find");
            e.printStackTrace();
        } finally {

            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                    logger.error("data.properties is abnormal state on the closing");
                    e.printStackTrace();
                }
            }

        }
    }
    public static String getProperty(String key){
        if(null == props) {
            loadProps();
        }

        return props.getProperty(key);
    }
}
