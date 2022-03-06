package model;

import java.io.Serializable;

public class ServiceByStaff implements Serializable {
    private static final long serialVersionUID = 1L;
    private Staff staff;
    private int month;
    private String serviceName;
    private long price;
    private int commission;
    private int quantily;
    private int rankStaff;
    private long inMoney;

    public ServiceByStaff() {
    }

    public Staff getThanhVien() {
        return staff;
    }

    public void setThanhVien(Staff staff) {
        this.staff = staff;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public int getCommission() {
        return commission;
    }

    public void setCommission(int commission) {
        this.commission = commission;
    }

    public int getQuantily() {
        return quantily;
    }

    public void setQuantily(int quantily) {
        this.quantily = quantily;
    }

    public int getRankStaff() {
        return rankStaff;
    }

    public void setRankStaff(int rankStaff) {
        this.rankStaff = rankStaff;
    }

    public long getInMoney() {
        return inMoney;
    }

    public void setInMoney(long inMoney) {
        this.inMoney = inMoney;
    }
}
