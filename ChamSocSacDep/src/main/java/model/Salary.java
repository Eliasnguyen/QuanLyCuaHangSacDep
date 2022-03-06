package model;

import java.io.Serializable;

public class Salary implements Serializable, Comparable<Salary>{
    private static final long serialVersionUID = 1L;
    private Staff staff;
    private int monthSalary;
    private long gross_salary;
    private String status;

    public Salary() {
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Staff getThanhVien() {
        return staff;
    }

    public void setThanhVien(Staff staff) {
        this.staff = staff;
    }

    public int getMonthSalary() {
        return monthSalary;
    }

    public void setMonthSalary(int monthSalary) {
        this.monthSalary = monthSalary;
    }

    public long getGross_salary() {
        return gross_salary;
    }

    public void setGross_salary(long gross_salary) {
        this.gross_salary = gross_salary;
    }

    @Override
    public int compareTo(Salary salary) {
        return this.getThanhVien().getName().compareTo(salary.getThanhVien().getName());
    }
}
