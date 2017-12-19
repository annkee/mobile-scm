package com.ctsig.mobilescm.service.impl.basic;

import com.ctsig.mobilescm.dao.basic.SupplierDao;
import com.ctsig.mobilescm.dao.basic.SupplierTypeDao;
import com.ctsig.mobilescm.domain.basic.SupplierType;
import com.ctsig.mobilescm.service.inter.basic.SupplierTypeService;
import com.ctsig.mobilescm.tool.BaseTool;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;


/**
 *
 */
@Service
public class SupplierTypeServiceImpl implements SupplierTypeService {

    @Resource
    private SupplierTypeDao dao;

    @Resource
    private SupplierDao supplierDao;

    public List<SupplierType> getSupplierTypeList(SupplierType supplierType) {
        Map<String, Object> params = new LinkedHashMap<>();
        if (supplierType != null && !"".equals(supplierType.getId())) {
            params.put("id", supplierType.getId());
        }
        return dao.queryList(params);
    }

    public SupplierType getSupplierType(SupplierType supplierType) {
        List<SupplierType> list = getSupplierTypeList(supplierType);
        if (BaseTool.isCollectionNotNull(list)) {
            return list.get(0);
        }
        return null;
    }

    public boolean addSupplierType(SupplierType supplierType) {
        List<SupplierType> list = getSupplierTypeList(null);
        if (BaseTool.isCollectionNotNull(list)) {
            for (SupplierType st : list) {
                if (st.getId().equalsIgnoreCase(supplierType.getId())) {
                    return false;
                }
            }
        }
        dao.add(supplierType);
        return true;
    }

    @Override
    public void editSupplierType(SupplierType supplierType) {
        dao.edit(supplierType);
    }

    @Override
    public void deleteSupplierType(SupplierType supplierType) {
        //设置供应商下的该供应商类别为NULL
        Map<String, Object> params = new LinkedHashMap<>();
        params.put("supplierTypeIdKey", supplierType.getId());
        supplierDao.edit(params);
        //删除供应商类别
        dao.delete(supplierType);
    }


}
