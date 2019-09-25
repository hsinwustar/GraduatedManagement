package cn.ganin.services;

import cn.ganin.common.ServiceResponses;
import cn.ganin.pojo.position;
import com.github.pagehelper.PageInfo;

import javax.xml.ws.Service;
import java.util.List;

/**
 * @Author agamgn
 * @Date 2019-05-11
 **/
public interface SerarchPosition {
    ServiceResponses<PageInfo> serarchposition(String position_name);
    ServiceResponses<PageInfo> serarchpositions();
    ServiceResponses details(Integer id);
    ServiceResponses apply(Integer positionId,Integer stuId,Integer enId);

}
