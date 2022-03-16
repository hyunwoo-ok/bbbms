package com.bms.goods.service;

import java.util.List;
import java.util.Map;

import com.bms.goods.dto.GoodsDto;

public interface GoodsService {
	
	public List<Map<String,Object>> listGoods(String goodsStatus) throws Exception;
	public Map<String,Object> goodsDetail(String goodsId) throws Exception;
	public List<Map<String, Object>> searchGoods(String searchWord) throws Exception;
	
}
