package com.spring.qboard.vo;

public class BookMarkVO extends QuizVO {

	private String id;
	private int curNumber;

	public BookMarkVO() {
		
	}
	
	public BookMarkVO(QuizVO QuizVO) {
		this.setQnum(QuizVO.getQnum());
		this.setField(QuizVO.getField());
		this.setPart(QuizVO.getPart());
		this.setLevels(QuizVO.getLevels());
		this.setDocument(QuizVO.getDocument());
		this.setChoice1(QuizVO.getChoice1());
		this.setChoice2(QuizVO.getChoice2());
		this.setChoice3(QuizVO.getChoice3());
		this.setChoice4(QuizVO.getChoice4());
		this.setResult(QuizVO.getResult());
		this.setCommentary(QuizVO.getCommentary());
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getCurNumber() {
		return curNumber;
	}

	public void setCurNumber(int curNumber) {
		this.curNumber = curNumber;
	}

	
}