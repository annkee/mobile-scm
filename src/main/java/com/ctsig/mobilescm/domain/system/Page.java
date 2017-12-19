package com.ctsig.mobilescm.domain.system;

import java.io.Serializable;
import java.util.List;

/**
 * 分页
 */
public class Page<T> implements Serializable {

    private static final long serialVersionUID = -3150572851507305406L;

    /**
     * 查询开始
     */
    private int start;

    /**
     * 当前页码：默认第一页
     */
    private int pageIndex = 1;

    /**
     * 页面显示记录数:默认15条
     */
    private int pageSize = 15;

    /**
     * 主记录数
     */
    private int totalSize;

    /**
     * 总页数
     */
    private int totalPage;

    /**
     * 数据
     */
    private List dataList;

    /**
     * 分页代码
     */
    private String pageCode;

    /**
     * 当前地址
     */
    private String url;


    public int getStart() {
        //设置查询开始点
        this.start = (pageIndex - 1) * pageSize;
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalSize() {
        return totalSize;
    }

    public void setTotalSize(int totalSize) {
        this.totalSize = totalSize;
        //设置总页数
        this.totalPage = (int) Math.ceil((double) totalSize / pageSize);
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public List getDataList() {
        return dataList;
    }

    public void setDataList(List dataList) {
        this.dataList = dataList;
    }

    public String getPageCode() {
        StringBuilder sb = new StringBuilder();
        sb
                .append("<table width='100%' align='center' border=0><tr><td align='center'>");
        // 页数显示
        sb.append("第  ").append(pageIndex).append(" 页 / 共 ").append(
                getTotalPage()).append(" 页 &nbsp;&nbsp;");

        if (pageIndex == 1) {
            sb.append(genBtn("首页", null));
            sb.append(genBtn("上一页", null));
        } else {
            sb.append(genBtn("首页", 1));
            sb.append(genBtn("上一页", pageIndex - 1));
        }

        if (pageIndex >= getTotalPage()) {
            sb.append(genBtn("下一页", null));
            sb.append(genBtn("尾页", null));
        } else {
            sb.append(genBtn("下一页", pageIndex + 1));
            sb.append(genBtn("尾页", getTotalPage()));
        }

        sb
                .append(" <input type='text' class='text' style='width:30px' id='newPageIndex'/> ");
        sb
                .append(" <input type='button' class='btn default' style='width:24px;' value='GO' onclick='");
        sb
                .append("var oPN = document.getElementById(\"newPageIndex\");var pnVal=parseInt(oPN.value);");
        sb.append("if (isNaN(pnVal) || pnVal < 1 || pnVal > ").append(
                getTotalPage()).append("){alert(\"请输入正确的页数!\");oPN.value=\"\";}");
        sb.append("else {location=\"").append(url).append("page.pageIndex=").append("\" + pnVal}");
        sb.append("'/>");

        sb.append(" 总记录数：").append(totalSize);
        sb.append("</td></tr></table>");
        return sb.toString();
    }

    private String genBtn(String btnVal, Integer pageIndex) {
        StringBuilder sb = new StringBuilder();
        sb
                .append(
                        " <input type=button class='btn default' style='width:60px' value=")
                .append(btnVal).append(" ");

        if (pageIndex == null) {
            sb.append(" disabled ");
        } else {
            sb.append(" onclick='location=\"").append(url).append("page.pageIndex=")
                    .append(pageIndex).append("\"'");

        }
        sb.append("/> ");
        return sb.toString();
    }

    public void setPageCode(String pageCode) {
        this.pageCode = pageCode;
    }

    public void setUrl(String url) {
        this.url = url;
    }


}
