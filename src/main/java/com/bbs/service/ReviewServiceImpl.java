package com.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.mapper.ReviewMapper;
import com.bbs.model.ReviewDTO;
import com.bbs.page.MypageCriteria;



@Service
public class ReviewServiceImpl implements ReviewService{
   
   @Autowired
   private ReviewMapper mapper;


   @Override
   public List<ReviewDTO> my_review_list(Long m_no) {
      
      return mapper.my_review_list(m_no);
   }

   @Override
   public void reviewDelete(Long r_no) {
      
      mapper.reviewDelete(r_no);
   }

   @Override
   public ReviewDTO my_review_update_form(Long r_no) {
      
      return mapper.my_review_update_form(r_no);
   }

   


   @Override
   public void reviewUpdate(ReviewDTO dto) {
      mapper.reviewUpdate(dto);
      
   }

//   대기중 @Override
//   public void insert(BeansFarmtestreviewDTO r_dto, AttachFileDTO a_dto) {
//      mapper.insert(r_dto, a_dto);
//      
//   }

   @Override
   public void insert(ReviewDTO r_dto) {
      mapper.insert(r_dto);
      
   }



   @Override
   public int getTotal(Long m_no) {
      
      return mapper.getTotal(m_no);
   }

   @Override
   public List<ReviewDTO> my_review_list_all(MypageCriteria cri) {
      
      
      
      return mapper.my_review_list_all(cri);
   }

@Override
public int cannotWriteFnc(ReviewDTO reDTO) {
	
	return mapper.cannotWriteFnc(reDTO);
}

@Override
public ReviewDTO my_review_one_show(long r_no) {
	
	return mapper.my_review_one_show(r_no);
}


   


}