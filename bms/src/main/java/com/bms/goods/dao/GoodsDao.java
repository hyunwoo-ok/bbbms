package com.bms.goods.dao;

import java.util.List;
import java.util.Map;

import com.bms.goods.dto.ImageFileDto;

public interface GoodsDao {
	
	public List<Map<String,Object>> selectGoodsList(String sideMenu ) throws Exception;
	public List<Map<String,Object>> selectGoodsBySearchWord(String searchWord) throws Exception;
	public Map<String,Object> selectGoodsDetail(String goodsId) throws Exception;
	public List<ImageFileDto> selectGoodsDetailImage(String goodsId) throws Exception;

}
