package com.ctsig.mobilescm.domain.system;

import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * 菜单
 */
public class Menu implements Serializable {

    private static final long serialVersionUID = 8868948756076283396L;

    /**
     * 菜单类别：含子菜单
     */
    public static final int MENU_TYPE_PARENT = 1;
    /**
     * 菜单类别：最终菜单
     */
    public static final int MENU_TYPE_NODE = 2;
    /**
     * 菜单类别：分隔线
     */
    public static final int MENU_TYPE_LINE = 3;

    public static final String MENU_TYPE_PARENT_NAME = "有子菜单";

    public static final String MENU_TYPE_NODE_NAME = "无子菜单";

    public static final String MENU_TYPE_LINE_NAME = "分隔线";

    /**
     * 菜单类别
     */
    public static final Map<Integer, String> MENU_TYPE_MAP = new LinkedHashMap<>();

    static {
        MENU_TYPE_MAP.put(MENU_TYPE_PARENT, MENU_TYPE_PARENT_NAME);
        MENU_TYPE_MAP.put(MENU_TYPE_NODE, MENU_TYPE_NODE_NAME);
        MENU_TYPE_MAP.put(MENU_TYPE_LINE, MENU_TYPE_LINE_NAME);
    }

    private String id;

    private String name;

    private Integer type;

    private String typeName;

    private String parentId;

    private Integer sortOrder;

    private String remark;

    private Action action;

    private List<Menu> subMenuList = new LinkedList<>();


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getType() {
        return type;
    }
    public Menu(){}

    public void setType(Integer type) {
        if (type != null) {
            switch (type) {
                case MENU_TYPE_PARENT:
                    this.typeName = MENU_TYPE_PARENT_NAME;
                    break;
                case MENU_TYPE_NODE:
                    this.typeName = MENU_TYPE_NODE_NAME;
                    break;
                case MENU_TYPE_LINE:
                    this.typeName = MENU_TYPE_LINE_NAME;
            }
        }

        this.type = type;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public Integer getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(Integer sortOrder) {
        this.sortOrder = sortOrder;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Action getAction() {
        return action;
    }

    public void setAction(Action action) {
        this.action = action;
    }

    public List<Menu> getSubMenuList() {
        return subMenuList;
    }

    public void setSubMenuList(List<Menu> subMenuList) {
        this.subMenuList = subMenuList;
    }

}
