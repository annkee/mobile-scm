package com.ctsig.mobilescm.annotation;

import java.lang.annotation.*;

/**
 * 自定义注解：是否记录日志
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface DoLog {
    boolean value() default true;
}
