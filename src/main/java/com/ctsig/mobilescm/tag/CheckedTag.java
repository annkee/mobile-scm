package com.ctsig.mobilescm.tag;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;

/**
 * 自定义标签：根据数据将checkbox标记
 * <my:check items="" value="" />
 */
/**
 * <my:checked items="" value="" />
 * 输出checked
 */
public class CheckedTag extends SimpleTagSupport {
	
	/**
	 * 要遍历的数据：Map,List,Object[],Object
	 */
	private Object items;
	
	/**
	 * 当前值
	 */
	private Object value;
	
	public void setItems(Object items) {
		this.items = items;
	}
	
	public void setValue(Object value) {
		this.value = value;
	}
	
	public void doTag() throws IOException {
		//获取输出流
		JspWriter out = this.getJspContext().getOut();
		try {
			if(items instanceof Collection){
				//items为Map、List类型
				Collection collection = (Collection) items;
				Iterator it = collection.iterator();
				while(it.hasNext()){
					Object next = it.next();
					if(next.equals(value)){
						out.write("checked");
						break;
					}
				}
			} else if(items instanceof Object[]){
				//items为Object[]数组类型
				Object[] array = (Object[]) items;
				for(Object o : array){
					if(o.equals(value)){
						out.write("checked");
						break;
					}
				}
			} else{
				//items为一个简单数据类型
				if(value.equals(items)){
					out.write("checked");
				}
			}
		} catch (Exception e) {
			//如果有异常输出空
			out.write("");
		}
		
	}
	
}
