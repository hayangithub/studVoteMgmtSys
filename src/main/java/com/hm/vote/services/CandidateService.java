package com.hm.vote.services;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.hm.vote.mappers.CandidateMapper;
import com.hm.vote.utils.ErrorHandler;
import com.hm.vote.utils.ServiceValidationUtils;
import com.hm.vote.vo.Candidate;
import com.hm.vote.vo.CandidateExample;
import com.hm.vote.vo.Position;
import com.hm.vote.vo.PositionExample;

@Service
public class CandidateService {

	private CandidateMapper candidateMapper;

	public CandidateService(CandidateMapper candidateMapper) {
		this.candidateMapper = candidateMapper;

	}

	public List<Candidate> getCandidates() {

		CandidateExample candidateExample = new CandidateExample();
		CandidateExample.Criteria criteriaCandidate = candidateExample.createCriteria();
		List<Candidate> candidateList = candidateMapper.selectByExample(candidateExample);

		return candidateList;
	}

	public ErrorHandler addNewCandidate(Candidate candidate) {

		ErrorHandler error = new ErrorHandler();
		if (ServiceValidationUtils.isEmptyStringTrim(candidate.getCandidateName())) {
			error.setErrorCode("0009");
			error.setErrorMessage("Candidate Name Cannot Be Empty");
			return error;
		}

		CandidateExample candidateExample = new CandidateExample();
		CandidateExample.Criteria criteriaCandidate = candidateExample.createCriteria();
		criteriaCandidate.andCandidateNameEqualTo(candidate.getCandidateName());
		
		List<Candidate> candidateList = candidateMapper.selectByExample(candidateExample);

		if (candidateList.size() >= 1) {
			error.setErrorCode("0008");
			error.setErrorMessage("Candidate Already Exist");
			return error;
		}

		
		candidate.setCreateDate(new Date());
		
		int insertStatus = candidateMapper.insert(candidate);
		if (insertStatus == 1) {
			error.setErrorCode("0000");
			error.setErrorMessage("Candidate Inserted Successfully");
		} else {
			error.setErrorCode("0007");
			error.setErrorMessage("Error in Inserting Record");
		}

		return error;
	}
	
	public Candidate getCandidateById(Integer candidateId) {

		CandidateExample candidateExample = new CandidateExample();
		CandidateExample.Criteria criteriaCandidate = candidateExample.createCriteria();
		criteriaCandidate.andCandidateIdEqualTo(candidateId);
		Candidate candidate = candidateMapper.selectByPrimaryKey(candidateId);

		return candidate;
	}
	
	public ErrorHandler updateCandidate(Candidate candidate) {

		ErrorHandler error = new ErrorHandler();
		if (ServiceValidationUtils.isEmptyStringTrim(candidate.getCandidateName())) {
			error.setErrorCode("0009");
			error.setErrorMessage("Candidate Cannot Be Empty");
			return error;
		}

		CandidateExample candidateExample = new CandidateExample();
		CandidateExample.Criteria criteriaCandidate = candidateExample.createCriteria();
		criteriaCandidate.andCandidateNameEqualTo(candidate.getCandidateName());
		criteriaCandidate.andStatusEqualTo(candidate.getStatus());
		List<Candidate> candidateList = candidateMapper.selectByExample(candidateExample);

		if (candidateList.size() >= 1) {
			error.setErrorCode("0008");
			error.setErrorMessage("Candidate Already Exist");
			return error;
		}

		int updateStatus = candidateMapper.updateByPrimaryKeySelective(candidate);
		if (updateStatus == 1) {
			error.setErrorCode("0000");
			error.setErrorMessage("Candidate Inserted Successfully");
		} else {
			error.setErrorCode("0007");
			error.setErrorMessage("Error in Updating Record");
		}

		return error;
	}
	
	public void deleteCandidateById(Integer candidateId) {

		CandidateExample candidateExample = new CandidateExample();
		CandidateExample.Criteria criteriaCandidate = candidateExample.createCriteria();
		criteriaCandidate.andCandidateIdEqualTo(candidateId);
		candidateMapper.deleteByPrimaryKey(candidateId);

		
	}

}
