package com.gemini.design.rmms.mapper;

import com.gemini.design.rmms.entity.Road;
import com.gemini.design.rmms.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface RoadMapper {

    /* 根据道路ip获取道路信息 */
    public Road getRoad (String r_id);


    /* 获取所有道路信息 */
    public List<Road> getAllRoad();


    /* 删除列表内iD的信息 */
    public int deleteRoad (List list);

    /* 更新道路信息 */
    public int alterRoad(Road road);

    /* 获取未分配道理的信息 */
    public List<Road> getRoadList();

    /* 添加道路信息 */
    public int insertRoad(Road road);
}
