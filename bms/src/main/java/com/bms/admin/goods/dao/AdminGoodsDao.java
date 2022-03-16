
package com.bms.admin.goods.dao;

import java.util.List;
import java.util.Map;

import com.bms.goods.dto.GoodsDto;
import com.bms.goods.dto.ImageFileDto;

public interface AdminGoodsDao {
	
	public void insertNewGoods(Map<String,Object> newGoodsMap) throws Exception;
	public int selectMaxGoodsId() throws Exception;
	public List<GoodsDto>selectNewGoodsList(Map<String,Object> condMap) throws Exception;
	public Map<String,Object> selectGoodsDetail(int goodsId) throws Exception;
	public List<ImageFileDto> selectGoodsImageFileList(int goodsId) throws Exception;
	public void insertGoodsImageFile(List<ImageFileDto> fileList)  throws Exception;
	public void updateGoodsInfo(Map<String,String> goodsMap) throws Exception;
	public void updateGoodsImage(List<ImageFileDto> imageFileList) throws Exception;
	public void deleteGoodsImage(int imageId) throws Exception;
	
}
