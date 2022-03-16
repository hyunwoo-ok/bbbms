package com.bms.admin.goods.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bms.goods.dto.GoodsDto;
import com.bms.goods.dto.ImageFileDto;

@Repository
public class AdminGoodsDaoImpl  implements AdminGoodsDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertNewGoods(Map<String,Object> newGoodsMap) throws Exception {
		sqlSession.insert("mapper.admin.goods.insertNewGoods" , newGoodsMap);
		
	}
	
	@Override
	public int selectMaxGoodsId() throws Exception {
		return sqlSession.selectOne("mapper.admin.goods.selectMaxGoodsId");
	}
	
	@Override
	public void insertGoodsImageFile(List<ImageFileDto> fileList)  throws Exception {
		for (ImageFileDto imageFileDto : fileList) {
			sqlSession.insert("mapper.admin.goods.insertGoodsImageFile" , imageFileDto);
		}
	}
		
	@Override
	public List<GoodsDto> selectNewGoodsList(Map<String,Object> condMap) throws Exception {
		List<GoodsDto> temp =  sqlSession.selectList("mapper.admin.goods.selectNewGoodsList" , condMap);
		
		for (GoodsDto goodsDto : temp) {
			System.out.println(goodsDto);
		}
		
		return temp;
	}
	
	@Override
	public Map<String,Object> selectGoodsDetail(int goodsId) throws Exception{
		return sqlSession.selectOne("mapper.admin.goods.selectGoodsDetail" , goodsId);
	}
	
	@Override
	public List<ImageFileDto> selectGoodsImageFileList(int goodsId) throws Exception {
		return sqlSession.selectList("mapper.admin.goods.selectGoodsImageFileList" , goodsId);
	}
	
	@Override
	public void updateGoodsInfo(Map<String,String> goodsMap) throws Exception{
		sqlSession.update("mapper.admin.goods.updateGoodsInfo" , goodsMap);
	}
	
	@Override
	public void deleteGoodsImage(int imageId) throws Exception{
		sqlSession.delete("mapper.admin.goods.deleteGoodsImage" , imageId);
	}
	
	@Override
	public void updateGoodsImage(List<ImageFileDto> imageFileList) throws Exception {
		for (ImageFileDto imageFileDto : imageFileList) {
			sqlSession.update("mapper.admin.goods.updateGoodsImage" , imageFileDto);	
		}
		
	}

	

}
