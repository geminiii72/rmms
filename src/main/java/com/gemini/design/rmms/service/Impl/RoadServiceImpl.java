package com.gemini.design.rmms.service.Impl;

import com.gemini.design.rmms.entity.Road;
import com.gemini.design.rmms.mapper.RoadMapper;
import com.gemini.design.rmms.service.RoadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoadServiceImpl implements RoadService {
    @Autowired
    private RoadMapper roadMapper;

    /*
     * 获取指定ID的道路信息
     * @Param 指定的道路ID
     * @Return 返回道路信息 查询不到返回null
     */
    @Override
    public Road getRoad(String r_id) {
        Road road = null;
        try {
            road = roadMapper.getRoad(r_id);
        }catch (Exception e) {
            System.out.println("发生错误：" + e);
        }

        return road;
    }


    /* 获取所有道路数据 */
    @Override
    public List<Road> getAllRoad() {
        return roadMapper.getAllRoad();
    }

    /* 删除列表内ID的信息 */
    @Override
    public Boolean deleteRoad(List list) {
        if (roadMapper.deleteRoad(list) > 0) {
            return true;
        }

        return false;
    }

    /* 修改道路的数据 */
    @Override
    public Boolean alterRoad(Road road) {
        if (roadMapper.alterRoad(road) > 0) {
            return true;
        }

        return false;
    }

    /* 获取所有未分配道路的信息 */
    @Override
    public List<Road> getRoadList() {
        return roadMapper.getRoadList();
    }

    /* 添加道路信息 */
    @Override
    public Boolean insertRoad(Road road) {
        if ( roadMapper.insertRoad(road) > 0) {
            return true;
        }
        return false;
    }
}
