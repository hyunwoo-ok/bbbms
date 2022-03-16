package com.bms.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bms.goods.dao.GoodsDao;
import com.bms.goods.dto.GoodsDto;
import com.bms.goods.dto.ImageFileDto;

@Service
@Transactional
public class GoodsServiceImpl implements GoodsService{
	
	@Autowired
	private GoodsDao goodsDao;
	
	public List<Map<String, Object>> listGoods(String goodsStatus) throws Exception {
		return goodsDao.selectGoodsList(goodsStatus);
	}
	
	
	public Map<String,Object> goodsDetail(String goodsId) throws Exception {
		
		Map<String,Object> goodsMap = new HashMap<String,Object>();
		
		goodsMap.put("GoodsDto"  , goodsDao.selectGoodsDetail(goodsId));
		goodsMap.put("imageList" , goodsDao.selectGoodsDetailImage(goodsId));
		
		return goodsMap;
		
	}
	
	
	public List<Map<String, Object>> searchGoods(String searchWord) throws Exception{
		return goodsDao.selectGoodsBySearchWord(searchWord);
	}
	
	
}
