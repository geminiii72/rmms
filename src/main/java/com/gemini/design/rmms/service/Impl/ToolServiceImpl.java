package com.gemini.design.rmms.service.Impl;

import com.gemini.design.rmms.entity.Tool;
import com.gemini.design.rmms.entity.toolRecord;
import com.gemini.design.rmms.mapper.ToolMapper;
import com.gemini.design.rmms.service.ToolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ToolServiceImpl implements ToolService {
    @Autowired
    private ToolMapper toolMapper;

    /* 根据PlanId获取该项目内配置的设备信息 */
    @Override
    public List<Tool> getToolListForPlan(String p_id) {
        List<Tool> list = toolMapper.getToolForPlan(p_id);

        return list;
    }

    /* 获取所有剩余设备的信息 */
    @Override
    public List<Tool> getAllResidueTool() {
        return toolMapper.getALLResidueTool();
    }

    /* 删除列表内ID的信息 */
    @Override
    public Boolean deleteTool(List list) {
        if (toolMapper.deleteTool(list) > 0) {
            return true;
        }

        return false;
    }

    /* 获取所有设备流通记录 */
    @Override
    public List<toolRecord> getAllRecord() {
        return toolMapper.getAllRecord();
    }

    /* 获取一个设备的信息 */
    @Override
    public Tool getTool(String t_id) {
        return toolMapper.getTool(t_id);
    }

    /* 按列表添加设备流通记录 */
    @Override
    public int insertToolRecordList(List<toolRecord> toolRecords) {
        return toolMapper.insertToolRecordList(toolRecords);
    }
}
