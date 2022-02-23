package model;

import java.util.Date;

public class Board {
	private int num;
	private String writer;
	private String pass;
	private String subject;
	private String content;
	private String file1;
	private String boardid;
	private Date regdate;
	private String ip;
	private int readcnt;
	private int ref;
	private int reflevel;
	private int refstep;
	
	public Board() {//default 생성자 //writePro.jsp에서 사용
		
	}
	public Board(int num, String writer, String pass, String subject, String content, String file1, String boardid,
			Date regdate, String ip, int readcnt, int ref, int reflevel, int refstep) {
		super();
		this.num = num;
		this.writer = writer;
		this.pass = pass;
		this.subject = subject;
		this.content = content;
		this.file1 = file1;
		this.boardid = boardid;
		this.regdate = regdate;
		this.ip = ip;
		this.readcnt = readcnt;
		this.ref = ref;
		this.reflevel = reflevel;
		this.refstep = refstep;
	}


	public int getNum() {
		return num;
	}


	public void setNum(int num) {
		this.num = num;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	public String getPass() {
		return pass;
	}


	public void setPass(String pass) {
		this.pass = pass;
	}


	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getFile1() {
		return file1;
	}


	public void setFile1(String file1) {
		this.file1 = file1;
	}


	public String getBoardid() {
		return boardid;
	}


	public void setBoardid(String boardid) {
		this.boardid = boardid;
	}


	public Date getRegdate() {
		return regdate;
	}


	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}


	public String getIp() {
		return ip;
	}


	public void setIp(String ip) {
		this.ip = ip;
	}


	public int getReadcnt() {
		return readcnt;
	}


	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}


	public int getRef() {
		return ref;
	}


	public void setRef(int ref) {
		this.ref = ref;
	}


	public int getReflevel() {
		return reflevel;
	}


	public void setReflevel(int reflevel) {
		this.reflevel = reflevel;
	}


	public int getRefstep() {
		return refstep;
	}


	public void setRefstep(int refstep) {
		this.refstep = refstep;
	}


	@Override
	public String toString() {
		return "Board [num=" + num + ", writer=" + writer + ", pass=" + pass + ", subject=" + subject + ", content="
				+ content + ", file1=" + file1 + ", boardid=" + boardid + ", regdate=" + regdate + ", ip=" + ip
				+ ", readcnt=" + readcnt + ", ref=" + ref + ", reflevel=" + reflevel + ", refstep=" + refstep + "]";
	}
	
	
	
	
	
}



