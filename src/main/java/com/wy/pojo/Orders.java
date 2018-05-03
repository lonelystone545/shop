package com.wy.pojo;

import java.sql.Timestamp;

public class Orders {
	
	private int oid;
	private Timestamp ordertime;
	private double total;
	private int bid;
	
	public Orders(double total, int bid) {
		this.total = total;
		this.bid = bid;
	}
	
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public Timestamp getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(Timestamp ordertime) {
		this.ordertime = ordertime;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
}
