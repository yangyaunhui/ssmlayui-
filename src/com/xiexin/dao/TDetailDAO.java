package com.xiexin.dao;

import com.xiexin.bean.TDetail;
import com.xiexin.bean.TDetailExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TDetailDAO {
    long countByExample(TDetailExample example);

    int deleteByExample(TDetailExample example);

    int deleteByPrimaryKey(Integer bdid);

    int insert(TDetail record);

    int insertSelective(TDetail record);

    List<TDetail> selectByExample(TDetailExample example);

    TDetail selectByPrimaryKey(Integer bdid);

    int updateByExampleSelective(@Param("record") TDetail record, @Param("example") TDetailExample example);

    int updateByExample(@Param("record") TDetail record, @Param("example") TDetailExample example);

    int updateByPrimaryKeySelective(TDetail record);

    int updateByPrimaryKey(TDetail record);
}