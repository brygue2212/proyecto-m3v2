require("dotenv").config()
module.exports=function(){
    this.connection=function(){
       const mysql=require("mysql")
       var conn=mysql.createConnection({
           host:"localhost",
           user:"root",
           password:"",
           database:"bd_registro_login"
       })
       return conn     
    }
}