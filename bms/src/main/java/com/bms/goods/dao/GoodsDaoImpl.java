package com.bms.goods.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bms.goods.dto.ImageFileDto;

@Repository
public class GoodsDaoImpl implements GoodsDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Map<String,Object>> selectGoodsList(String goodsStatus) throws Exception {
	   return sqlSession.selectList("mapper.goods.selectGoodsList" , goodsStatus);	
	}
	
	@Override
	public List<Map<String,Object>> selectGoodsBySearchWord(String searchWord) throws Exception{
		 return sqlSession.selectList("mapper.goods.selectGoodsBySearchWord" , searchWord);
	}
	
	@Override
	public Map<String,Object> selectGoodsDetail(String goodsId) throws Exception{
		return sqlSession.selectOne("mapper.goods.selectGoodsDetail" , goodsId);
	}
	
	@Override
	public List<ImageFileDto> selectGoodsDetailImage(String goodsId) throws Exception{
		return sqlSession.selectList("mapper.goods.selectGoodsDetailImage" , goodsId);
	}
	
}
