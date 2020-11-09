/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.util.List;

/**
 *
 * @author Emanuel Barrantes Guzmán
 */
public class AuxiliarEmisor {

    /**
     * @return the type_id
     */
    public int getType_id() {
        return type_id;
    }

    /**
     * @param type_id the type_id to set
     */
    public void setType_id(int type_id) {
        this.type_id = type_id;
    }

    /**
     * @return the num_id
     */
    public String getNum_id() {
        return num_id;
    }

    /**
     * @param num_id the num_id to set
     */
    public void setNum_id(String num_id) {
        this.num_id = num_id;
    }

    /**
     * @return the name_full
     */
    public String getName_full() {
        return name_full;
    }

    /**
     * @param name_full the name_full to set
     */
    public void setName_full(String name_full) {
        this.name_full = name_full;
    }

    /**
     * @return the num_tel
     */
    public String getNum_tel() {
        return num_tel;
    }

    /**
     * @param num_tel the num_tel to set
     */
    public void setNum_tel(String num_tel) {
        this.num_tel = num_tel;
    }

    /**
     * @return the mail
     */
    public String getMail() {
        return mail;
    }

    /**
     * @param mail the mail to set
     */
    public void setMail(String mail) {
        this.mail = mail;
    }

    /**
     * @return the tradename
     */
    public String getTradename() {
        return tradename;
    }

    /**
     * @param tradename the tradename to set
     */
    public void setTradename(String tradename) {
        this.tradename = tradename;
    }

    /**
     * @return the user
     */
    public String getUser() {
        return user;
    }

    /**
     * @param user the user to set
     */
    public void setUser(String user) {
        this.user = user;
    }

    /**
     * @return the pass
     */
    public String getPass() {
        return pass;
    }

    /**
     * @param pass the pass to set
     */
    public void setPass(String pass) {
        this.pass = pass;
    }

    /**
     * @return the province
     */
    public String getProvince() {
        return province;
    }

    /**
     * @param province the province to set
     */
    public void setProvince(String province) {
        this.province = province;
    }

    /**
     * @return the canton
     */
    public String getCanton() {
        return canton;
    }

    /**
     * @param canton the canton to set
     */
    public void setCanton(String canton) {
        this.canton = canton;
    }

    /**
     * @return the district
     */
    public String getDistrict() {
        return district;
    }

    /**
     * @param district the district to set
     */
    public void setDistrict(String district) {
        this.district = district;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    public AuxiliarEmisor(int type_id, String num_id, String name_full, String num_tel, String mail, String tradename, String user, String pass, String province, String canton, String district, String address) {
        this.type_id = type_id;
        this.num_id = num_id;
        this.name_full = name_full;
        this.num_tel = num_tel;
        this.mail = mail;
        this.tradename = tradename;
        this.user = user;
        this.pass = pass;
        this.province = province;
        this.canton = canton;
        this.district = district;
        this.address = address;
    }

    public AuxiliarEmisor(int type_id, String num_id, String name_full, String num_tel, String mail, String tradename, String user, String pass, String province, String canton, String district, String address,
            int id, String detail
    ) {
        this.type_id = type_id;
        this.num_id = num_id;
        this.name_full = name_full;
        this.num_tel = num_tel;
        this.mail = mail;
        this.tradename = tradename;
        this.user = user;
        this.pass = pass;
        this.province = province;
        this.canton = canton;
        this.district = district;
        this.address = address;

    }

    public AuxiliarEmisor() {
        type_id = 0;
        num_id = "";
        name_full = "";
        num_tel = "";
        mail = "";
        tradename = "";
        user = "";
        pass = "";
        province = "";
        canton = "";
        district = "";
        address = "";

    }

    private int type_id;
    private String num_id;
    private String name_full;
    private String num_tel;
    private String mail;
    private String tradename;
    private String user;
    private String pass;
    private String province;
    private String canton;
    private String district;
    private String address;

}
