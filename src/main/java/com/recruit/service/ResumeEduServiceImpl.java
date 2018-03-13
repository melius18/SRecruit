package com.recruit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recruit.domain.ResumeEduVO;
import com.recruit.persistence.ResumeEduDAO;

@Service
public class ResumeEduServiceImpl implements ResumeEduService {

	@Inject
	private ResumeEduDAO dao;

	@Override
	public void regist(ResumeEduVO vo) throws Exception {
		dao.createResumeEdu(vo);
	}

	@Override
	public ResumeEduVO read(Integer bno) throws Exception {
		return dao.readResumeEdu(bno);
	}

	@Override
	public void modify(ResumeEduVO vo) throws Exception {
		dao.updateResumeEdu(vo);
	}

	@Override
	public void remove(Integer bno) throws Exception {
		dao.deleteResumeEdu(bno);
	}

	@Override
	public void createResumeEdu(ResumeEduVO vo) throws Exception {
		dao.createResumeEdu(vo);
	}
	
	// r.code 03/13 추가
	@Override
	public List<ResumeEduVO> readResumeEduList(Integer bno) throws Exception {
		return dao.readResumeEduList(bno);
	}
}