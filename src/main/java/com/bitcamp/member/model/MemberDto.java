package com.bitcamp.member.model;

public class MemberDto {
	private String mid;
	private String mpwd;
	private String mname;
	private String maddr;
	private String maddrdeta;
	private String maddrcode;

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpwd() {
		return mpwd;
	}

	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMaddr() {
		return maddr;
	}

	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}

	public String getMaddrdeta() {
		return maddrdeta;
	}

	public void setMaddrdeta(String maddrdeta) {
		this.maddrdeta = maddrdeta;
	}

	public String getMaddrcode() {
		return maddrcode;
	}

	public void setMaddrcode(String maddrcode) {
		this.maddrcode = maddrcode;
	}
}