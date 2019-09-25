package cn.ganin.services.impl;


import cn.ganin.common.ServiceResponses;
import cn.ganin.pojo.position;
import cn.ganin.pojo.positionWithBLOBs;
import cn.ganin.pojo.positionandenterprise;
import cn.ganin.services.SerarchPosition;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.ganin.dao.positionMapper;

import java.util.List;

/**
 * @Author agamgn
 * @Date 2019-05-11
 **/
@Service("searchPosition")
public class SerarchPositionImpl implements SerarchPosition {



    @Autowired
    private positionMapper positionMapper;

    /**
     * 搜索相关的
     * @param position_name
     * @return
     */
    @Override
    public ServiceResponses<PageInfo> serarchposition(String position_name) {
        System.out.println("*//////////////////////////*");
        String sql="select * from position join enterprise on position.position_enterprise_id=enterprise.enterprise_id where position.position_name LIKE '%"+position_name+"%'";

        List<position> pos=positionMapper.searchByName(sql);
        System.out.println(pos.toString());
        PageInfo pageInfo=new PageInfo(pos);
        return ServiceResponses.createBySuccess("success",pageInfo);
    }

    /**
     * 搜索所有的
     * @return
     */
    @Override
    public ServiceResponses<PageInfo> serarchpositions() {
//        String sql="from position join enterprise on position.position_enterprise_id=enterprise.enterprise_id";
//        String sql="select position.position_name,position.position_enterprise_id from position join enterprise on position.position_enterprise_id=enterprise.enterprise_id";
        String sql="select * from position join enterprise on position.position_enterprise_id=enterprise.enterprise_id";
        List<positionandenterprise> pos=positionMapper.searchAll(sql);
        PageInfo pageInfo=new PageInfo(pos);
        System.out.println("*************/////////////**********");
        return ServiceResponses.createBySuccess("success",pageInfo);
    }

    /**
     * 详情
     * @param id
     * @return
     */
    public ServiceResponses details(Integer id){
        String sql="select * from position join enterprise on position.position_enterprise_id=enterprise.enterprise_id where position.position_id="+id;
        List<positionandenterprise> pos=positionMapper.details(sql);
        System.out.println(pos);
        return ServiceResponses.createBySuccess("success",pos);

    }

    /**
     * 投递
     * @param positionId
     * @param stuId
     * @return
     */
    public ServiceResponses apply(Integer positionId,Integer stuId,Integer enId){
        String sql="insert into recruit(recruit_position_id,recruit_stu_id,recruit_enterprise_id) VALUES ("+positionId+","+stuId+","+enId+")";
        List<positionandenterprise> pos=positionMapper.apples(sql);
        return ServiceResponses.createBySuccess("投递成功",pos);
    }
}
