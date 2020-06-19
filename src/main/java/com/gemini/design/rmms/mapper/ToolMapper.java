package com.gemini.design.rmms.mapper;

import com.gemini.design.rmms.entity.Tool;
import com.gemini.design.rmms.entity.toolRecord;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ToolMapper {

    /* 根据项目ID获取该项目下的设备信息 */
    public List<Tool> getToolForPlan (String p_id);

    /* 获取仓库所有剩余设备信息 */
    public List<Tool> getALLResidueTool ();

    /* 删除列表内iD的信息 */
    public int deleteTool (List list);

    /* 获取所有设备的流通记录 */
    public List<toolRecord> getAllRecord();

    /* 根据设备ID获取该设备信息 */
    public Tool getTool(String t_id);

    /* 按列表添加设备流通记录 */
    public int insertToolRecordList(@Param("list") List<toolRecord> toolRecords);
}
