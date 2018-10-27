package zw.tags;

import org.apache.commons.lang3.StringUtils;

import javax.servlet.ServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;
import java.io.IOException;

public class ToolBar extends BodyTagSupport {
    private String dataid;
    private String url;
    @Override
    public int doStartTag() throws JspException {
        return super.doStartTag();
    }

    @Override
    public int doEndTag() throws JspException {
        //标签内容
        ServletRequest request = pageContext.getRequest();

        BodyContent bodyContent=getBodyContent();
        String bodyContentStr = bodyContent==null?"":bodyContent.toString();
        String _html  = "";
        _html += "<div id='" +dataid+ "' class='toolbar' data-module='"+(request.getServletContext().getContextPath()+"/"+url)+"' data-root='"+request.getServletContext().getContextPath()+"'>";
        _html += "<div class='btn-group'>";
            _html += "<button type='button' data-name='add' class='btn btn-primary' data-event-type='view' data-event-value=''  data-target='modal'><i class='fa fa-plus' aria-hidden='true' style='margin-right: 2px'> </i>添加</button>";
            _html += "<button type='button' data-name='delete' class='btn btn-default' data-event-type='default' data-event-value='' data-target='modal'><i class='fa fa-trash' aria-hidden='true' style='margin-right: 2px'> </i>删除</button>";
        _html += "</div>";
        _html += bodyContentStr;
        _html += "</div>";
        try {
            pageContext.getOut().write(_html);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        // TODO Auto-generated method stub
        return super.doEndTag();
    }

    public String getDataid() {
        return dataid;
    }

    public void setDataid(String dataid) {
        this.dataid = dataid;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
