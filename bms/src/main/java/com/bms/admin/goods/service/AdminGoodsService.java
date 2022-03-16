package com.bms.admin.goods.service;

import java.util.List;
import java.util.Map;

import com.bms.goods.dto.GoodsDto;
import com.bms.goods.dto.ImageFileDto;
import com.bms.order.dto.OrderDto;

public interface AdminGoodsService {
	
	public int addNewGoods(Map<String,Object> newGoodsMap) throws Exception;
	public List<GoodsDto> listNewGoods(Map<String,Object> condMap) throws Exception;
	public Map<String,Object> goodsDetail(int goodsId) throws Exception;
	public List<ImageFileDto> goodsImageFile(int goodsId) throws Exception;
	public void modifyGoodsInfo(Map<String,String> goodsMap) throws Exception;
	public void modifyGoodsImage(List<ImageFileDto> imageFileList) throws Exception;
	public void removeGoodsImage(int imageId) throws Exception;
	public void addNewGoodsImage(List<ImageFileDto>  imageFileList) throws Exception;
	
}
