package com.hm.vote.controllers;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hm.vote.services.CandidateService;
import com.hm.vote.services.PositionService;
import com.hm.vote.utils.ErrorHandler;
import com.hm.vote.vo.Admin;
import com.hm.vote.vo.Candidate;
import com.hm.vote.vo.Position;



@Controller
public class AdminController {
	
	@Autowired
	private PositionService positionService;
	@Autowired
	private CandidateService candidateService;
	
	// Position
	@RequestMapping(value = "/positions", method = RequestMethod.GET)
	public String login(Model model) {
		
		
		List<Position> positionList = positionService.getPositions();
		model.addAttribute("positionList", positionList);
		model.addAttribute("admin", new Admin());
		model.addAttribute("administrative", "active");
		model.addAttribute("positionMenu", "active");

		return "admin/manage-position";
	}
	
	
	@RequestMapping(value = "/position/new", method = RequestMethod.POST)
	public String addPosition(Model model, @RequestParam("positionName") String positionName) {

		ErrorHandler errorHandler=positionService.addNewPosition(positionName);
		
		model.addAttribute("errorHandler", errorHandler);
		model.addAttribute("positionName", positionName);
		model.addAttribute("administrative", "active");
		model.addAttribute("positionMenu", "active");
		List<Position> positionList = positionService.getPositions();
		model.addAttribute("positionList", positionList);

		return "admin/manage-position";
	}
	
	
	@RequestMapping(value = "/position/edit/{id}", method = RequestMethod.GET)
	public String editPosition(@PathVariable("id") int positionId, Model model) {

		Position position=positionService.getPositionsById(positionId);
		
		model.addAttribute("position", position);
		model.addAttribute("administrative", "active");
		model.addAttribute("positionMenu", "active");
		
		return "admin/update-position";
	}
	
	
	@RequestMapping(value = "/edit-position-done", method = RequestMethod.POST)
	public String editPositionDone(Model model, @ModelAttribute("position") Position position) {
		
		ErrorHandler errorHandler=positionService.updatePosition(position);
		
		model.addAttribute("errorHandler", errorHandler);
		model.addAttribute("position", position);
		model.addAttribute("administrative", "active");
		model.addAttribute("positionMenu", "active");
		List<Position> positionList = positionService.getPositions();
		model.addAttribute("positionList", positionList);

		return "admin/manage-position";
	}
	
	
	@RequestMapping(value = "/position/remove", method = RequestMethod.POST)
	public String editPosition(@RequestParam("positionId") Integer positionId, Model model) {

		positionService.deletePositionsById(positionId);
		
		List<Position> positionList = positionService.getPositions();
		model.addAttribute("positionList", positionList);
		model.addAttribute("administrative", "active");
		model.addAttribute("positionMenu", "active");
		
		return "admin/manage-position";
	}
	
	/*************************************************************************/
	
	// Candidate
	@RequestMapping(value = "/candidates", method = RequestMethod.GET)
	public String getCandidates(Model model) {
		
		
		List<Candidate> candidateList = candidateService.getCandidates();
		model.addAttribute("candidate", new Candidate());
		model.addAttribute("candidateList", candidateList);
		model.addAttribute("administrative", "active");
		model.addAttribute("candidateMenu", "active");

		return "admin/manage-candidate";
	}
	
	
	@RequestMapping(value = "/add-candidate", method = RequestMethod.POST)
	public String addCandidates(Model model, @ModelAttribute("candidate") Candidate candidate) {
		
		
		ErrorHandler errorHandler=candidateService.addNewCandidate(candidate);
		
		List<Candidate> candidateList = candidateService.getCandidates();
		model.addAttribute("errorHandler", errorHandler);
		model.addAttribute("candidate", candidate);
		model.addAttribute("candidateList", candidateList);
		model.addAttribute("administrative", "active");
		model.addAttribute("candidateMenu", "active");

		return "admin/manage-candidate";
	}
	
	@RequestMapping(value = "/edit-candidate/{id}", method = RequestMethod.GET)
	public String editCandiate(@PathVariable("id") int candidateId, Model model) {

		Candidate candidate=candidateService.getCandidateById(candidateId);
		
		model.addAttribute("candidate", candidate);
		model.addAttribute("administrative", "active");
		model.addAttribute("candidateMenu", "active");
		
		return "admin/update-candidate";
	}
	
	@RequestMapping(value = "/edit-candidate-done", method = RequestMethod.POST)
	public String editCandidateDone(Model model, @ModelAttribute("candidate") Candidate candidate) {
		
		
		ErrorHandler errorHandler=candidateService.updateCandidate(candidate);
		
		if ("0008".equalsIgnoreCase(errorHandler.getErrorCode()) || "0009".equalsIgnoreCase(errorHandler.getErrorCode())) {
			model.addAttribute("candidate", candidate);
			model.addAttribute("errorHandler", errorHandler);
			return "admin/update-candidate";
		}
		
		model.addAttribute("candidate", new Candidate());
		model.addAttribute("errorHandler", errorHandler);
		model.addAttribute("administrative", "active");
		model.addAttribute("candidateMenu", "active");
		List<Candidate> candidateList = candidateService.getCandidates();
		model.addAttribute("candidateList", candidateList);

		return "admin/manage-candidate";
	}
	
	@RequestMapping(value = "/delete-candidate", method = RequestMethod.POST)
	public String deleteCandidate(@RequestParam("candidateId") Integer candidateId, Model model) {

		candidateService.deleteCandidateById(candidateId);

		List<Candidate> candidateList = candidateService.getCandidates();
		model.addAttribute("candidateList", candidateList);
		model.addAttribute("administrative", "active");
		model.addAttribute("candidateMenu", "active");
		
		return "admin/manage-candidate";
	}

	/*************************************************************************/

}
