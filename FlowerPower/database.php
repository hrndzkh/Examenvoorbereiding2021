<?php  

class FlowerPower{
   
    private $host;
    private $dbh;
    private $user;
    private $pass;
 
    function _construct(){
         $this->host = 'localhost';
         $this->user = 'root';
         $this->pass = '';
         $this->db ='flowerpower';
 
         try {
             $dsn = "mysql:host=$this->;dbname=$this->db";
             $this->dbh = new PDO($dsn, $this->user, $this->pass);
 
         } catch (PDOexeception $e){
             die("unable to connect: " . $e->getMessage());
         }
    }
}
?>