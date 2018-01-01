
package functionality;

import java.util.ArrayList;

/**
 *
 * @author Mahfuj
 */
public class CartManipulation {
    public static void main(String args[]){
        //System.out.println(CartManipulation.deleteItem("12"));
    }
    public static String deleteItem(String id,String str){
        
        String s = str;
        String[] s2 = s.split(",");
        String s3 = new String("");
        for(int i = 0; i<s2.length;i++){
            System.out.println("Processing :"+s2[i]);
            if(!s2[i].equals(id)){
                s3 += ","+s2[i].toString();
            }
        }
        
        return s3;
    }
    
}
