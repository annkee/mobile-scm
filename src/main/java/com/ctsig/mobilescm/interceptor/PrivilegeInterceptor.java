package com.ctsig.mobilescm.interceptor;

import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 *
 */
public class PrivilegeInterceptor extends AbstractInterceptor {
	
	
	private static final long serialVersionUID = 2600167818263547053L;

	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext actionContext = invocation.getInvocationContext();
		
		@SuppressWarnings("unchecked")
		Set<String> actionSet = (Set<String>) actionContext.getSession().get("actionSet");
		
		HttpServletRequest request = (HttpServletRequest) actionContext.get(StrutsStatics.HTTP_REQUEST);
		String uri = request.getRequestURI();
		uri = uri.substring(uri.lastIndexOf("/")+1);
//		for(String action : actionSet){
//			if(action.equalsIgnoreCase(uri)){
//				invocation.invoke();
//				break;
//			}
//		}
		
		invocation.invoke();
		
		return "message"; //返回到全局result
	}

	

}
