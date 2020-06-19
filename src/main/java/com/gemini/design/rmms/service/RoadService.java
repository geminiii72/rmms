package com.gemini.design.rmms.service;

import com.gemini.design.rmms.entity.Road;
import com.gemini.design.rmms.entity.User;

import java.util.List;

public interface RoadService {

    public Road getRoad (String r_id);

    public List<Road> getAllRoad();

    public Boolean deleteRoad(List list);

    public Boolean alterRoad(Road road);

    public List<Road> getRoadList();

    public Boolean insertRoad(Road road);
}
