package com.hm.vote.services;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hm.vote.mappers.PositionMapper;
import com.hm.vote.utils.ErrorHandler;
import com.hm.vote.utils.ServiceValidationUtils;
import com.hm.vote.vo.Position;
import com.hm.vote.vo.PositionExample;

@Service
public class PositionService {

	private PositionMapper positionMapper;

	public PositionService(PositionMapper positionMapper) {
		this.positionMapper = positionMapper;

	}

	public List<Position> getPositions() {

		PositionExample positionExample = new PositionExample();
		PositionExample.Criteria criteriaPosition = positionExample.createCriteria();
		List<Position> positionList = positionMapper.selectByExample(positionExample);

		return positionList;
	}

	public Position getPositionsById(Integer positionId) {

		PositionExample positionExample = new PositionExample();
		PositionExample.Criteria criteriaPosition = positionExample.createCriteria();
		criteriaPosition.andPositionIdEqualTo(positionId);
		Position position = positionMapper.selectByPrimaryKey(positionId);

		return position;
	}

	public ErrorHandler addNewPosition(String positionName) {

		ErrorHandler error = new ErrorHandler();
		if (ServiceValidationUtils.isEmptyStringTrim(positionName)) {
			error.setErrorCode("0009");
			error.setErrorMessage("Position Cannot Be Empty");
			return error;
		}

		PositionExample positionExample = new PositionExample();
		PositionExample.Criteria criteriaPosition = positionExample.createCriteria();
		criteriaPosition.andPositionNameEqualTo(positionName);
		criteriaPosition.andStatusEqualTo("A");
		List<Position> positionList = positionMapper.selectByExample(positionExample);

		if (positionList.size() >= 1) {
			error.setErrorCode("0008");
			error.setErrorMessage("Position Already Exist");
			return error;
		}

		Position position = new Position();
		position.setPositionName(positionName);
		position.setCreateDate(new Date());
		position.setStatus("A");
		int insertStatus = positionMapper.insert(position);
		if (insertStatus == 1) {
			error.setErrorCode("0000");
			error.setErrorMessage("Position Inserted Successfully");
		} else {
			error.setErrorCode("0007");
			error.setErrorMessage("Error in Inserting Record");
		}

		return error;
	}

	public ErrorHandler updatePosition(Position position) {

		ErrorHandler error = new ErrorHandler();
		if (ServiceValidationUtils.isEmptyStringTrim(position.getPositionName())) {
			error.setErrorCode("0009");
			error.setErrorMessage("Position Cannot Be Empty");
			return error;
		}

		PositionExample positionExample = new PositionExample();
		PositionExample.Criteria criteriaPosition = positionExample.createCriteria();
		criteriaPosition.andPositionNameEqualTo(position.getPositionName());
		criteriaPosition.andStatusEqualTo(position.getStatus());
		List<Position> positionList = positionMapper.selectByExample(positionExample);

		if (positionList.size() >= 1) {
			error.setErrorCode("0008");
			error.setErrorMessage("Position Already Exist");
			return error;
		}

		int updateStatus = positionMapper.updateByPrimaryKeySelective(position);
		if (updateStatus == 1) {
			error.setErrorCode("0000");
			error.setErrorMessage("Position Inserted Successfully");
		} else {
			error.setErrorCode("0007");
			error.setErrorMessage("Error in Updating Record");
		}

		return error;
	}

	public void deletePositionsById(Integer positionId) {

		PositionExample positionExample = new PositionExample();
		PositionExample.Criteria criteriaPosition = positionExample.createCriteria();
		criteriaPosition.andPositionIdEqualTo(positionId);
		positionMapper.deleteByPrimaryKey(positionId);

		
	}

}
