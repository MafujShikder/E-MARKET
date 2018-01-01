
package functionality;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class DatabaseManager {

    private String DATABASE = "jdbc:mysql://localhost:3306/ecommerce2";
    private String USER = "root";
    private String PASSWORD = "";
    private Connection connection4 = null;
    String tbl_category = "adminaddcategory";
    String tbl_manufacturer = "adminaddmanufacturer";
    String tbl_product = "companyaddproduct";
    private int published = 1;
    private int unPublished = 0;

    public boolean connect() throws ClassNotFoundException {
        try {
            //System.out.println(connection4.toString());
            Class.forName("com.mysql.jdbc.Driver");
            connection4 = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce2", "root", "");
            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public static void main(String[] args) throws ClassNotFoundException {
        DatabaseManager d = new DatabaseManager();
        //d.manageCategoryEdit("32", "China", "Thdfhdsfgsdis is a good product", "1");
        // d.publishUpdate("adminaddcategory", "34", "1");
        //d.manufactureUpdate("15", "HP Inc", "This is a good company", "0");
        //d.productUpdate("23", "TY", "Yads", "Yads", "yoyo honny singh", "lkjsdlkf", "lksajdfklj", "lksdjfd", "0");
        // d.toogleFeature("featured", "23");
        //d.insertIntoOrderDetails("12", "20");
        //d.getNewOrderId("12");
        //d.pushCartToOrderDetails("104", "12");
        // d.puchItemToCart("42", "1");
        // d.saveShippingInfo("Gunjan ", "yadav","12","nepal","65465456","ksjdklj","skd","5565");
        d.invoice("1");
        //d.orderTableEnter("105", "1", "12", "1");
        //System.out.println(d.getActiveOrderId("1"));
        // d.insertShippingAddress("Gunjan", last_name, city, address, country, phone, zip_code, customer_id)
        //d.deleteAllFromCart("1");
        //d.deleteOneFromCart("1", "25");
        //d.updateItemInCart("1", "41", "7");
        // d.insertPaymentDetail("1", "1");
        //d.checkDuplicate("41", "1");
        //d.removeFromCart("40", "1");
        // d.total("1");
        //d.wish("1", "40");
        //d.unwish("1", "40");
        //d.resultsetprinter("1");
        //d.wishlist("1");
            
            
       
    }

    public boolean manageCategoryEdit(String id, String name, String discription, String publishStatus) {
        String query = "update " + tbl_category + " set cn=?, cd=?, ps1=? where id=?";
        try {
            this.connect();
            System.out.println();
            PreparedStatement ps = (PreparedStatement) connection4.prepareStatement(query);
            // ps.setString(1, tbl_category);
            ps.setString(1, name);
            ps.setString(2, discription);
            ps.setString(3, publishStatus);
            ps.setString(4, id);
            System.out.println(ps.toString());

            ps.execute();
            // System.out.println("Category edited");

            return true;
        } catch (ClassNotFoundException ex) {

            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public boolean publishUpdate(String table, String id, String status) throws ClassNotFoundException {

        String query = "update " + table + " set ps1=? where id=?";

        try {
            this.connect();
            PreparedStatement ps = (PreparedStatement) connection4.prepareStatement(query);
            ps.setString(1, status);
            ps.setString(2, id);
            ps.execute();
            return true;
        } catch (SQLException e) {
            return false;
        }

    }

    public boolean manufactureUpdate(String id, String cn, String cd, String publishStatus) throws ClassNotFoundException {
        String query = "update " + tbl_manufacturer + " set cn=?, cd=?, ps1=? where id=?";
        try {
            this.connect();
            PreparedStatement ps = (PreparedStatement) connection4.prepareStatement(query);
            ps.setString(1, cn);
            ps.setString(2, cd);
            ps.setString(3, publishStatus);
            ps.setString(4, id);
            System.out.println(ps.toString());
            ps.execute();
            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean productUpdate(String id, String pn, String cn, String mn, String pd, String pp, String pq, String pi, String ps1) throws ClassNotFoundException {

        String query = "update " + tbl_product + " set pn=?, cn=?, mn=?, pd=?, pp=?, pq=?, pi=?, ps1=? where id=?";
        this.connect();
        try {
            PreparedStatement ps = (PreparedStatement) connection4.prepareStatement(query);
            ps.setString(1, pn);
            ps.setString(2, cn);
            ps.setString(3, mn);
            ps.setString(4, pd);
            ps.setString(5, pp);
            ps.setString(6, pq);
            ps.setString(7, pi);
            ps.setString(8, ps1);
            ps.setString(9, id);
            System.out.println(ps.toString());
            ps.execute();

            return true;
        } catch (SQLException ex) {

            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public boolean toogleFeature(String status, String id) throws ClassNotFoundException {
        String query = "update " + tbl_product + " set feature=? where id=?";

        this.connect();
        try {
            PreparedStatement ps = (PreparedStatement) connection4.prepareStatement(query);
            ps.setString(1, status);
            ps.setString(2, id);

            ps.execute();
            return true;
        } catch (SQLException e) {
            return false;
        }

    }
    //show cart

    public ResultSet showCart(String customer_id) throws ClassNotFoundException, SQLException {

        String queryForCart = "SELECT product_id, quantity, rate, price from cart where customer_id=" + customer_id;
        this.connect();
        try {
            PreparedStatement ps = (PreparedStatement) connection4.prepareStatement(queryForCart);
            ResultSet rs = ps.executeQuery();

            return rs;
        } catch (SQLException e) {
            return null;
        }

    }

    public ResultSet cart(String customer_id) throws ClassNotFoundException {

        String query = "select * from cart where customer_id=" + customer_id;
        System.out.println(customer_id);
        try {
            this.connect();
            PreparedStatement ps = (PreparedStatement)connection4.prepareStatement(query);
            System.out.println("reached ps");
            return ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;

    }

    public boolean insertIntoOrderDetails(String customer_id, String orderId) throws ClassNotFoundException {

        ResultSet rs = this.cart(customer_id);

        this.connect();
        try {

            String query = "INSERT into tbl_order_details( order_id, product_id, product_price, product_name, product_sales_quantity, admin_id, order_status, payment_status, customer_id) values(?, ?, ?,? ,?,?,?,?,?)";
            while (rs.next()) {
                PreparedStatement ps = (PreparedStatement) connection4.prepareStatement(query);
                System.out.println(rs.getString("product_id")+" id product_id "+rs.getString("product_id"));
                ps.setString(1, orderId);
                ps.setString(2, rs.getString("product_id"));
                ps.setString(3, rs.getString("price"));
                ps.setString(4, "1");
                ps.setString(5, rs.getString("quantity"));
                ps.setString(6, "1");
                ps.setString(7, "1");
                ps.setString(8, "1");
                ps.setString(9, customer_id);
                if (ps.execute()) {
                    System.out.println("Male entered !!");
                }

            }

        } catch (SQLException ex) {
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }
    
   public String getNewOrderId(String customer_id) throws ClassNotFoundException{
       this.connect();
       String query = "insert into tbl_order_id_track(customer_id) values(?)";
        try {
            PreparedStatement ps = (PreparedStatement)connection4.prepareStatement(query);
            ps.setString(1, customer_id);
            ps.execute();
            
            String idQuery = "select active_order from tbl_order_id_track where customer_id=? order by active_order desc limit 0,1 ";
            ps=(PreparedStatement)connection4.prepareStatement(idQuery);
            ps.setString(1, customer_id);
            ResultSet rs = ps.executeQuery();
            
            
            rs.next();
            String active_order = rs.getString("active_order");
            System.out.println("The order id displayed is: "+rs.getString("active_order"));
            return active_order;
            
            
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
   }
   
   
   public boolean pushCartToOrderDetails(String order_id, String customer_id) throws ClassNotFoundException{
       this.connect();
       String query = "INSERT INTO tbl_order_details(product_id,customer_id,order_id,quantity,price) select product_id,customer_id,?,quantity,price from cart where customer_id=?";
       
        try {
            PreparedStatement ps = (PreparedStatement)connection4.prepareStatement(query);
            ps.setString(1, order_id);
            ps.setString(2, customer_id);
            ps.execute();
            System.out.println("Data stored in order details ");
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        
        }
       
  
   
   }
   
   public boolean puchItemToCart(String product_id, String customer_id) throws ClassNotFoundException{
       
       if(checkDuplicate(product_id, customer_id)){
           return false;
       }
       
       
            this.connect();
        
            String query = "insert into cart(product_id,customer_id, quantity,price,rate) select id,?,1,pp,pp from companyaddproduct where id=?";
        try {
            PreparedStatement ps = (PreparedStatement)connection4.prepareStatement(query);
            ps.setString(1,customer_id);
            ps.setString(2,product_id);
            ps.execute();
            
            System.out.println("item added to cart "+product_id);
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
        
        
        
        
        
   }
   public boolean saveShippingInfo(String first_name, String last_name, String customer_id,String country, String phone, String address, String city, String zip_code) throws ClassNotFoundException{
       
      this.connect();
      
      String query = "insert into tbl_shipping(first_name,last_name,customer_id,country, phone, address, city, zip_code) values(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = (PreparedStatement)connection4.prepareStatement(query);
            ps.setString(1, first_name);
            ps.setString(2, last_name);
            ps.setString(3, customer_id);
            ps.setString(4, country);
            ps.setString(5, phone);
            ps.setString(6, address);
            ps.setString(7, city);
            ps.setString(8, zip_code);
            ps.execute();
            System.out.println("Shipping details taken..");
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
      
       
   
   }
   
   
   
   public void invoice(String customer_id) throws ClassNotFoundException{
       
       //enter into order details table
       String order_id = this.getNewOrderId(customer_id);
       this.pushC artToOrderDetails(order_id, customer_id);
       //take last shipping id corresponding to customer_id
       //String shipping_id = this.getLastShippingId(customer_id);
       //clear cart for customer_id
       
       //entry in order table and set tbl_order status pending
       this.orderTableEnter(order_id,customer_id,"1","1");
       //add new entry to tbl_order about new checkout
       
       //send invoice object to controller class-----
       
       //update tbl_order_id_track's active_order order
       
       
   }
   
   public String getLastShippingId(String customer_id) throws ClassNotFoundException{
       this.connect();
       String query = "select shipping_id from tbl_shipping where customer_id=? order by shipping_id desc limit 0,1 ";
        try {
            PreparedStatement ps = (PreparedStatement)connection4.prepareStatement(query);
            ResultSet rs = ps.executeQuery(query);
            rs.next();
            return rs.getString("shipping_id");
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
       
   }
   
   public boolean orderTableEnter(String order_id, String customer_id, String payment_id, String shipping_id) throws ClassNotFoundException{
       System.out.println("Order table executing with "+order_id+" "+customer_id+" "+payment_id+" "+shipping_id);
       this.connect();
       String query = "insert into tbl_order(order_id,customer_id,payment_id,shipping_id) values(?,?,?,?)";
        try {
            PreparedStatement ps = (PreparedStatement)connection4.prepareStatement(query);
            ps.setString(1, order_id);
            ps.setString(2, customer_id);
            ps.setString(3, payment_id);
            ps.setString(4, shipping_id);
            ps.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
   }
   
   
   public String getActiveOrderId( String customer_id) throws ClassNotFoundException{
       String query = "select active_order from tbl_order_id_track where customer_id=? order by active_order desc limit 0,1";
       this.connect();
        try {
            PreparedStatement ps = (PreparedStatement)connection4.prepareStatement(query);
            ps.setString(1, customer_id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getString("active_order");
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
       
       
       
       
       
       
       
       
   }
   
   
   
   public ResultSet fetchProductForInvoice(String customer_id,String order_id){
       
       
       
       
       return null;
   }
   
   public boolean insertShippingAddress(String first_name, String last_name,String city, String address, String country, String phone, String zip_code,String customer_id) throws ClassNotFoundException{
       String query = "insert into tbl_shipping(first_name,last_name, country,phone,address,city,zip_code,customer_id) values(?,?,?,?,?,?,?,?)";
       this.connect();
        try {
            PreparedStatement ps = (PreparedStatement)connection4.prepareStatement(query);
            ps.setString(1 , first_name);
            ps.setString(2 , last_name);
            ps.setString(3 , country);
            ps.setString(4 , phone);
            ps.setString(5 , address);
            ps.setString(6 , city);
            ps.setString(7 , zip_code);
            ps.setString(8 , customer_id);
            ps.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
       
   
   }
   
   public boolean deleteAllFromCart(String customer_id) throws ClassNotFoundException{
       String query ="delete from cart where customer_id=?";
       this.connect();
        try {
            PreparedStatement ps = (PreparedStatement)connection4.prepareStatement(query);
            ps.setString(published, customer_id);
            ps.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
       
   }
   
   public boolean deleteOneFromCart(String customer_id, String product_id) throws ClassNotFoundException{
       String query = "delete from cart where customer_id=? and product_id=?";
       this.connect();
        try {
            PreparedStatement ps = (PreparedStatement)connection4.prepareStatement(query);
            ps.setString(1, customer_id);
            ps.setString(2, product_id);
            ps.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
            return true;
        }
       
       
   }
   
   public boolean updateItemInCart(String customer_id, String product_id, String quantity) throws ClassNotFoundException{
       this.connect();
       PreparedStatement ps=null;
        try {
            String pp = "select pp from companyaddproduct where id=? ";
            ps= (PreparedStatement)connection4.prepareStatement(pp);
            ps.setString(1, product_id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            String product_price = rs.getString("pp");
            System.out.println("Product price is: "+product_price);
       String query = "update cart set quantity=?, price=?*? where customer_id=? and product_id=?";
            ps = (PreparedStatement)connection4.prepareStatement(query);
            ps.setString(1, quantity);
            ps.setString(2, quantity);
            ps.setString(3,product_price );
            ps.setString(4, customer_id);
            ps.setString(5, product_id);
            ps.execute();
            System.out.println("Updated");
            return true;
            
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
       
       
   }
   
   public boolean insertPaymentDetail(String customer_id, String payment_type) throws ClassNotFoundException{
       this.connect();
       String query = "insert into tbl_payment(payment_type,customer_id) values(?,?)";
        try {
            PreparedStatement ps = (PreparedStatement)connection4.prepareStatement(query);
            ps.setString(1, payment_type);
            ps.setString(2, customer_id);
            ps.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
   }
   
   public boolean updateOrderStatus(String customer_id, String order_id) throws ClassNotFoundException{
       this.connect();
       String query = "update tbl_order_id_track set order_status='pending' where active_order=? and customer_id=?";
        try {
            PreparedStatement ps = (PreparedStatement)connection4.prepareStatement(query);
            ps.setString(1, order_id);
            ps.setString(2, customer_id);
            ps.execute();
            System.out.println("Order status updated");
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
       
   }
   
   public boolean checkDuplicate(String product_id, String customer_id) throws ClassNotFoundException{
       
       this.connect();
       
       String query = "select product_id from cart where product_id=? and customer_id=?";
        try {
            
            PreparedStatement ps = (PreparedStatement)connection4.prepareStatement(query);
            ps.setString(1, product_id);
            ps.setString(2, customer_id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            String product  = rs.getString("product_id");
            if(product !=null && product.equals(product_id)){
                System.out.println("Available product. Not added.");
                return true;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
            
        }
        return false;
       
   }
   
   public boolean removeFromCart(String product_id, String customer_id) throws ClassNotFoundException{
       this.connect();
       
       String remove = "delete from cart where product_id=? and customer_id=?";
       
        try {
            PreparedStatement ps = (PreparedStatement)connection4.prepareStatement(remove);
            ps.setString(1, product_id);
            ps.setString(2, customer_id);
            ps.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
   }
   
   public float total(String customer_id) throws ClassNotFoundException{
       this.connect();
       float total = (float) 0.0;
       String query = "select price from cart where customer_id=?";
        try {
            PreparedStatement ps = (PreparedStatement)connection4.prepareStatement(query);
            ps.setString(1, customer_id);
            ResultSet rs = ps.executeQuery();
            total = (float) 0.0;
            while(rs.next()){
                total += Float.parseFloat(rs.getString("price"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
   }
   
   public int totalItems(String customer_id) throws ClassNotFoundException{
       this.connect();
       String query = "select count(*) from cart where customer_id=?";
       PreparedStatement ps;
        try {
            ps = (PreparedStatement)connection4.prepareStatement(query);
            ps.setString(1, customer_id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        return 0;
   }
   public boolean wish(String customer_id, String product_id) throws ClassNotFoundException{
    
       String query = "insert into tbl_wishlist(product_id,customer_id) values(?,?)";
       this.connect();
        try {
            PreparedStatement ps = (PreparedStatement)connection4.prepareStatement(query);
            ps.setString(1, product_id);
            ps.setString(2, customer_id);
            ps.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
   }
   
   public boolean unwish(String customer_id, String product_id) throws ClassNotFoundException{
    
       String query = "delete from tbl_wishlist where product_id=? and customer_id=?";
       this.connect();
        try {
            PreparedStatement ps = (PreparedStatement)connection4.prepareStatement(query);
            ps.setString(1, product_id);
            ps.setString(2, customer_id);
            ps.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
   }
   
   public ResultSet wishlist(String customer_id) throws ClassNotFoundException{
       this.connect();
       String query = "select product_id from tbl_wishlist where customer_id=?";
       PreparedStatement ps;
       
        try {
            ps = (PreparedStatement)connection4.prepareStatement(query);
            ps.setString(1, customer_id);
            ResultSet rs = ps.executeQuery();
            
            return rs;
           // while(rs.next())System.out.println(rs.getInt(1));
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
        }
       
       return null;
   }
   
   public ResultSet getProductDetails(String product_id) throws SQLException, ClassNotFoundException{
       if(connection4 == null)this.connect();
       return ((PreparedStatement)connection4.prepareCall("select id,pn,pi,pp from companyaddproduct where id="+product_id)).executeQuery();
       
       
       
   }
   
   private void resultsetprinter(String customer_id) throws SQLException, ClassNotFoundException{
      ResultSet product_ids = this.wishlist(customer_id);
            
        while(product_ids.next()){
            ResultSet product = getProductDetails(Integer.toString(product_ids.getInt(1)));
            product.next();
            System.out.println(product.getString("pn"));
        }
   }
   
   public boolean toogle_company_state(String company_id, String state) throws ClassNotFoundException, SQLException{
       this.connect();
       return ((PreparedStatement)connection4.prepareStatement("update companysignup set state="+state+" where id="+company_id)).execute();
   }

}








