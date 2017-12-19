package com.ctsig.mobilescm.service.impl.supplier;

import com.ctsig.mobilescm.dao.basic.DepartmentDao;
import com.ctsig.mobilescm.dao.supplier.MobileStockDao;
import com.ctsig.mobilescm.dao.supplier.MobileStorageDao;
import com.ctsig.mobilescm.dao.supplier.TradeDetailDao;
import com.ctsig.mobilescm.domain.basic.Department;
import com.ctsig.mobilescm.domain.supplier.*;
import com.ctsig.mobilescm.domain.system.Page;
import com.ctsig.mobilescm.domain.system.User;
import com.ctsig.mobilescm.service.inter.supplier.MobileStorageService;
import com.ctsig.mobilescm.tool.BaseTool;
import com.ctsig.mobilescm.tool.StringTool;
import com.ctsig.mobilescm.tool.TimeTool;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;


/**
 *
 */
@Service
public class MobileStorageServiceImpl implements MobileStorageService {

    @Resource
    private MobileStorageDao dao;

    @Resource
    private MobileStockDao mobileStockDao;

    @Resource
    private TradeDetailDao tradeDetailDao;

    @Resource
    private DepartmentDao departmentDao;

    @Override
    public int getTotalSize(MobileStorage mobileStorage, User loginUser, String startDate, String endDate) {
        Map<String, Object> params = new LinkedHashMap<>();
        if (mobileStorage != null) {
            if (mobileStorage.getSupplier() != null) {
                if (StringTool.isNotEmpty(mobileStorage.getSupplier().getId())) {
                    params.put("supplierId", mobileStorage.getSupplier().getId());
                } else if (mobileStorage.getSupplier().getSupplierType() != null && StringTool.isNotEmpty(mobileStorage.getSupplier().getSupplierType().getId())) {
                    params.put("supplierTypeId", mobileStorage.getSupplier().getSupplierType().getId());
                }
            }
            if (mobileStorage.getMobileType() != null) {
                if (StringTool.isNotEmpty(mobileStorage.getMobileType().getId())) {
                    params.put("mobileTypeId", mobileStorage.getMobileType().getId());
                } else if (StringTool.isNotEmpty(mobileStorage.getMobileType().getBrand())) {
                    params.put("brand", mobileStorage.getMobileType().getBrand());
                }
            }
        }
        if (startDate != null) {
            params.put("startDate", startDate);
        }
        if (endDate != null) {
            params.put("endDate", endDate);
        }
        if (loginUser != null) {
            params.put("queryScopeList", loginUser.getQueryScopeList());
        }
        return dao.queryCount(params);
    }

    @Override
    public List<MobileStorage> getMobileStorageList(MobileStorage mobileStorage, User loginUser, String startDate, String endDate, Page page) {
        Map<String, Object> params = new LinkedHashMap<>();
        if (mobileStorage != null) {
            if (StringTool.isNotEmpty(mobileStorage.getId())) {
                params.put("id", mobileStorage.getId());
            }
            if (mobileStorage.getSupplier() != null) {
                if (StringTool.isNotEmpty(mobileStorage.getSupplier().getId())) {
                    params.put("supplierId", mobileStorage.getSupplier().getId());
                } else if (mobileStorage.getSupplier().getSupplierType() != null && StringTool.isNotEmpty(mobileStorage.getSupplier().getSupplierType().getId())) {
                    params.put("supplierTypeId", mobileStorage.getSupplier().getSupplierType().getId());
                }
            }
            if (mobileStorage.getMobileType() != null) {
                if (StringTool.isNotEmpty(mobileStorage.getMobileType().getId())) {
                    params.put("mobileTypeId", mobileStorage.getMobileType().getId());
                } else if (StringTool.isNotEmpty(mobileStorage.getMobileType().getBrand())) {
                    params.put("brand", mobileStorage.getMobileType().getBrand());
                }
            }
        }
        if (startDate != null) {
            params.put("startDate", startDate);
        }
        if (endDate != null) {
            params.put("endDate", endDate);
        }
        if (page != null) {
            params.put("start", page.getStart());
            params.put("size", page.getPageSize());
        }
        if (loginUser != null) {
            params.put("queryScopeList", loginUser.getQueryScopeList());
        }
        return dao.queryList(params);
    }

    public MobileStorage getMobileStorage(Map<String, Object> params) {
        List<MobileStorage> list = dao.queryList(params);
        if (BaseTool.isCollectionNotNull(list)) {
            return list.get(0);
        }
        return null;
    }

    @Override
    public List<Map<String, String>> getSerialNumberList(String mobileStorageId) {
        Map<String, Object> params = new LinkedHashMap<>();
        if (StringTool.isNotEmpty(mobileStorageId)) {
            params.put("mobileStorageId", mobileStorageId);
        }
        return dao.querySerialNumberList(params);
    }

    @Override
    public boolean getSerialNumber(String serialNumber) {
        String[] sn = serialNumber.split("=");
        Map<String, String> params = new LinkedHashMap<>();
        params.put("numberOne", sn[0]);

        int sn1, sn2;

        sn1 = dao.querySerialNumber(params);

        if (sn1 == 1) {
            return true;
        }

        if (sn.length == 2) {
            params.clear();
            params.put("numberTwo", sn[1]);
            sn2 = dao.querySerialNumber(params);
            return sn2 == 1;
        }
        return false;
    }

    @Override
    public void addMobileStorage(MobileStorage mobileStorage, List<String> snList, User loginUser) throws Exception {
        //查询部门
        Department department = departmentDao.getDepartmentByUserId(loginUser.getId());
        //设置库存信息
        String id = mobileStorage.getMobileType().getId() + TimeTool.formatDate(new Date(), "yyyyMMddHHmm");
        mobileStorage.setId(id);
        mobileStorage.setInputDate(new Date());
        mobileStorage.setInputUserId(loginUser.getId());
        mobileStorage.setDepartment(department);
        //这里设置checkDate只是防止后面BeanUtils.copyProperties()报错
        mobileStorage.setCheckDate(new Date());
        //添加库存
        dao.add(mobileStorage);

        //手机库存列表
        List<MobileStock> mobileStockList = new ArrayList<>();
        //串号列表
        List<Map<String, String>> serialNumberList = new ArrayList<>();
        if (BaseTool.isCollectionNotNull(snList)) {
            for (String sn : snList) {
                String[] t = sn.split("=");

                MobileStock mobileStock = new MobileStock();
                BeanUtils.copyProperties(mobileStock, mobileStorage);
                mobileStock.setMobileStorageId(mobileStorage.getId());
                mobileStock.setFirstSupplier(mobileStorage.getSupplier());
                mobileStock.setFirstStockDate(mobileStorage.getInputDate());
                mobileStock.setCost(mobileStorage.getBuyPrice());
                mobileStock.setLossAmount(0.0);
                mobileStock.setNumberOne(t[0]);

                Map<String, String> map = new HashMap<>();
                map.put("numberOne", t[0]);

                if (t.length == 2) {
                    mobileStock.setNumberTwo(t[1]);
                    map.put("numberTwo", t[1]);
                } else {
                    mobileStock.setNumberTwo("");
                    map.put("numberTwo", "");
                }

                map.put("id", StringTool.uniqueKey());
                map.put("mobileStorageId", mobileStorage.getId());

                mobileStockList.add(mobileStock);
                serialNumberList.add(map);
            }
        }
        //添加
        dao.addSerialNumber(serialNumberList);
        //添加库存
        mobileStockDao.add(mobileStockList);

        //交易明细
        TradeDetail tradeDetail = new TradeDetail();
        BeanUtils.copyProperties(tradeDetail, mobileStorage);
        tradeDetail.setTradeType(StaticVariable.TRADE_TYPE_MOBILE_STOCKIN);
        tradeDetail.setTypeId(mobileStorage.getMobileType().getId());
        tradeDetail.setUnitPrice(mobileStorage.getBuyPrice());

        tradeDetailDao.add(tradeDetail);
    }

    @Override
    public void setCheck(MobileStorage mobileStorage, User loginUser) {
        Map<String, Object> params = new LinkedHashMap<>();
        params.put("checkUserId", loginUser.getId());
        params.put("checkDate", new Date());
        params.put("id", mobileStorage.getId());
        params.put("status", StaticVariable.STATUS_CHECKED);

        //更新入库单
        dao.edit(params);
        //更新库存
        mobileStockDao.edit(params);
        //更新交易明细
        tradeDetailDao.edit(params);

    }

    @Override
    public MobileNumber getMobileNumber(Map<String, String> params) {
        return dao.queryMobileNumber(params);
    }

    @Override
    public void delete(String mobileStorageId) {
        dao.delete(mobileStorageId);
    }


}
