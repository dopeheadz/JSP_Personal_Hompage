package com.board;

public class boardDTO {
	String userNickName;
	int boardID;
	String boardTitle;
	String boardContent;
	String boardDate;
	int boardHit;
	String boardFile;
	String boardReadFile;
	int boardGroup;
	int boardSequence;
	int boardLevel;

	public String getUserNickName() {
		return userNickName;
	}

	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}

	public int getBoardID() {
		return boardID;
	}

	public void setBoardID(int boardID) {
		this.boardID = boardID;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}

	public int getBoardHit() {
		return boardHit;
	}

	public void setBoardHit(int boardHit) {
		this.boardHit = boardHit;
	}

	public String getBoardFile() {
		return boardFile;
	}

	public void setBoardFile(String boardFile) {
		this.boardFile = boardFile;
	}

	public String getBoardReadFile() {
		return boardReadFile;
	}

	public void setBoardReadFile(String boardReadFile) {
		this.boardReadFile = boardReadFile;
	}

	public int getBoardGroup() {
		return boardGroup;
	}

	public void setBoardGroup(int boardGroup) {
		this.boardGroup = boardGroup;
	}

	public int getBoardSequence() {
		return boardSequence;
	}

	public void setBoardSequence(int boardSequence) {
		this.boardSequence = boardSequence;
	}

	public int getBoardLevel() {
		return boardLevel;
	}

	public void setBoardLevel(int boardLevel) {
		this.boardLevel = boardLevel;
	}

	@Override
	public String toString() {
		return "boardDTO{" +
				"userNickName='" + userNickName + '\'' +
				", boardID=" + boardID +
				", boardTitle='" + boardTitle + '\'' +
				", boardContent='" + boardContent + '\'' +
				", boardDate='" + boardDate + '\'' +
				", boardHit=" + boardHit +
				", boardFile='" + boardFile + '\'' +
				", boardReadFile='" + boardReadFile + '\'' +
				", boardGroup=" + boardGroup +
				", boardSequence=" + boardSequence +
				", boardLevel=" + boardLevel +
				'}';
	}
}

