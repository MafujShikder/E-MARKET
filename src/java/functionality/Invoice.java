/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package functionality;

import java.sql.ResultSet;

/**
 *
 * @author Mahfuj
 */
public class Invoice {
    
    String customer_id;
    String customer_address;
    String ship_id;
    String ship_address;
    ResultSet rs;
    
    public Invoice(String customer_id, String customer_address, String ship_id, String ship_address, ResultSet rs){
        this.customer_id = customer_id;
        this.customer_address = customer_address;
        this.ship_id=ship_id;
        this.ship_address=ship_address;
        this.rs = rs;
    }
    
}
