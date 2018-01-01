/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package functionality;

/**
 *
 * @author Mahfuj
 */
public class Authentication {
     public static boolean auth(String email, String type){
        
        if( email != null )return true;
        
        return false;
    }
     
    public static boolean authAdmin(String email, String type){
        System.out.println(email+"  "+type);
        if(email != null && type.equals("admin")){
            return true;
        }
        return false;
        
        
    }
}
