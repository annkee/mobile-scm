package com.ctsig.mobilescm.service.inter.supplier;

import com.ctsig.mobilescm.domain.supplier.MobileNumber;
import com.ctsig.mobilescm.domain.supplier.MobileStorage;
import com.ctsig.mobilescm.domain.system.Page;
import com.ctsig.mobilescm.domain.system.User;

import java.util.List;
import java.util.Map;

/**
 */
public interface MobileStorageService {

    int getTotalSize(MobileStorage mobileStorage, User loginUser, String startDate, String endDate);

    List<MobileStorage> getMobileStorageList(MobileStorage mobileStorage, User loginUser, String startDate, String endDate, Page page);

    List<Map<String, String>> getSerialNumberList(String mobileStorageId);

    void addMobileStorage(MobileStorage mobileStorage, List<String> snList, User loginUser) throws Exception;

    boolean getSerialNumber(String serialNumber);

    void setCheck(MobileStorage mobileStorage, User loginUser);

    MobileStorage getMobileStorage(Map<String, Object> params);

    MobileNumber getMobileNumber(Map<String, String> params);

    void delete(String mobileStorageId);
}
