package com.xiexin.dao;

import com.xiexin.bean.TBusiness;
import com.xiexin.bean.TBusinessExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface TBusinessDAO {
    long countByExample(TBusinessExample example);

    int deleteByExample(TBusinessExample example);

    int deleteByPrimaryKey(Integer bid);

    int insert(TBusiness record);

    int insertSelective(TBusiness record);

    List<TBusiness> selectByExample(TBusinessExample example);

    TBusiness selectByPrimaryKey(Integer bid);

    int updateByExampleSelective(@Param("record") TBusiness record, @Param("example") TBusinessExample example);

    int updateByExample(@Param("record") TBusiness record, @Param("example") TBusinessExample example);

    int updateByPrimaryKeySelective(TBusiness record);

    int updateByPrimaryKey(TBusiness record);

    //两表联查 因为是将N张表显示到一张表格中,就要用到map,不是用的一对多
    List<Map> selectTwoTable();

}