package com.ctsig.mobilescm.service.impl.supplier;

import com.ctsig.mobilescm.dao.basic.DepartmentDao;
import com.ctsig.mobilescm.dao.supplier.MobileReturnDao;
import com.ctsig.mobilescm.dao.supplier.MobileStockDao;
import com.ctsig.mobilescm.dao.supplier.TradeDetailDao;
import com.ctsig.mobilescm.domain.basic.Department;
import com.ctsig.mobilescm.domain.supplier.MobileReturn;
import com.ctsig.mobilescm.domain.supplier.StaticVariable;
import com.ctsig.mobilescm.domain.supplier.TradeDetail;
import com.ctsig.mobilescm.domain.system.Page;
import com.ctsig.mobilescm.domain.system.User;
import com.ctsig.mobilescm.service.inter.supplier.MobileReturnService;
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
public class MobileReturnServiceImpl implements MobileReturnService {

    @Resource
    private MobileReturnDao dao;

    @Resource
    private TradeDetailDao tradeDetailDao;

    @Resource
    private DepartmentDao departmentDao;

    @Resource
    private MobileStockDao mobileStockDao;

    @Override
    public int getTotalSize(MobileReturn mobileReturn, User loginUser, String startDate, String endDate) {
        Map<String, Object> params = new LinkedHashMap<>();
        if (mobileReturn != null) {
            if (mobileReturn.getSupplier() != null) {
                if (StringTool.isNotEmpty(mobileReturn.getSupplier().getId())) {
                    params.put("supplierId", mobileReturn.getSupplier().getId());
                } else if (mobileReturn.getSupplier().getSupplierType() != null && StringTool.isNotEmpty(mobileReturn.getSupplier().getSupplierType().getId())) {
                    params.put("supplierTypeId", mobileReturn.getSupplier().getSupplierType().getId());
                }
            }
            if (mobileReturn.getMobileType() != null) {
                if (StringTool.isNotEmpty(mobileReturn.getMobileType().getId())) {
                    params.put("mobileTypeId", mobileReturn.getMobileType().getId());
                } else if (StringTool.isNotEmpty(mobileReturn.getMobileType().getBrand())) {
                    params.put("brand", mobileReturn.getMobileType().getBrand());
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
    public List<MobileReturn> getMobileReturnList(MobileReturn mobileReturn, User loginUser, String startDate, String endDate,
                                                  Page page) {
        Map<String, Object> params = new LinkedHashMap<>();
        if (mobileReturn != null) {
            if (StringTool.isNotEmpty(mobileReturn.getId())) {
                params.put("id", mobileReturn.getId());
            }
            if (mobileReturn.getSupplier() != null) {
                if (StringTool.isNotEmpty(mobileReturn.getSupplier().getId())) {
                    params.put("supplierId", mobileReturn.getSupplier().getId());
                } else if (mobileReturn.getSupplier().getSupplierType() != null && StringTool.isNotEmpty(mobileReturn.getSupplier().getSupplierType().getId())) {
                    params.put("supplierTypeId", mobileReturn.getSupplier().getSupplierType().getId());
                }
            }
            if (mobileReturn.getMobileType() != null) {
                if (StringTool.isNotEmpty(mobileReturn.getMobileType().getId())) {
                    params.put("mobileTypeId", mobileReturn.getMobileType().getId());
                } else if (StringTool.isNotEmpty(mobileReturn.getMobileType().getBrand())) {
                    params.put("brand", mobileReturn.getMobileType().getBrand());
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

    @Override
    public void setCheck(MobileReturn mobileReturn, User loginUser) {
        Map<String, Object> params = new LinkedHashMap<>();
        params.put("checkUserId", loginUser.getId());
        params.put("checkDate", new Date());
        params.put("status", StaticVariable.STATUS_CHECKED);
        params.put("id", mobileReturn.getId());
        params.put("mobileReturnId", mobileReturn.getId());
        //更新退机单
        dao.edit(params);
        //更新交易明细
        tradeDetailDao.edit(params);
        //删除库存
        mobileStockDao.delete(params);
    }

    @Override
    public MobileReturn getMobileReturn(Map<String, Object> params) {
        List<MobileReturn> list = dao.queryList(params);
        if (BaseTool.isCollectionNotNull(list)) {
            return list.get(0);
        }
        return null;
    }

    @Override
    public void addMobileReturn(MobileReturn mobileReturn, List<String> snList, User loginUser) throws Exception {
        //查询部门
        Department department = departmentDao.getDepartmentByUserId(loginUser.getId());
        //设置退货信息
        String id = mobileReturn.getMobileType().getId() + TimeTool.formatDate(new Date(), "yyyyMMddHHmm");
        mobileReturn.setId(id);
        mobileReturn.setInputDate(new Date());
        mobileReturn.setInputUserId(loginUser.getId());
        mobileReturn.setStatus(StaticVariable.STATUS_NOTCHECK);
        mobileReturn.setDepartment(department);
        mobileReturn.setCheckDate(new Date());
        //添加退货单
        dao.add(mobileReturn);

        //串号列表
        List<Map<String, String>> serialNumberList = new ArrayList<>();
        List<String> snListTmp = new LinkedList<>();
        if (BaseTool.isCollectionNotNull(snList)) {
            for (String sn : snList) {
                String[] t = sn.split("=");

                Map<String, String> map = new HashMap<>();
                map.put("numberOne", t[0]);

                snListTmp.add(t[0]);

                if (t.length == 2) {
                    map.put("numberTwo", t[1]);
                } else {
                    map.put("numberTwo", "");
                }

                map.put("id", StringTool.uniqueKey());
                map.put("mobileReturnId", mobileReturn.getId());

                serialNumberList.add(map);
            }
        }
        //添加
        dao.addMobileReturnNumber(serialNumberList);

        //修改库存状态
        Map<String, Object> params = new LinkedHashMap<>();
        params.put("status", StaticVariable.STATUS_STOCKOUT_NOTCHECKED);
        params.put("snList", snListTmp);
        mobileStockDao.edit(params);

        //交易明细
        TradeDetail tradeDetail = new TradeDetail();
        BeanUtils.copyProperties(tradeDetail, mobileReturn);
        tradeDetail.setTradeType(StaticVariable.TRADE_TYPE_MOBILE_RETURN);
        tradeDetail.setTypeId(mobileReturn.getMobileType().getId());
        tradeDetail.setUnitPrice(mobileReturn.getReturnPrice());

        tradeDetailDao.add(tradeDetail);
    }

}
