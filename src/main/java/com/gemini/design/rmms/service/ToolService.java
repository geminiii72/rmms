package com.gemini.design.rmms.service;

import com.gemini.design.rmms.entity.Tool;
import com.gemini.design.rmms.entity.toolRecord;

import java.util.List;

public interface ToolService {

    public List<Tool> getToolListForPlan(String p_id);

    public List<Tool> getAllResidueTool();

    public Boolean deleteTool(List list);

    public List<toolRecord> getAllRecord();

    public Tool getTool(String t_id);

    public int insertToolRecordList(List<toolRecord> toolRecords);
}
