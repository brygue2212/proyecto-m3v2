require("./util/database")()
const conn = connection()

const express = require("express")
const bcrypt  = require("bcrypt")
const jwt     = require("jsonwebtoken")
const path    = require("path")
const parser  = require("body-parser")
const mysql = require("mysql")
const app     = express()
const port    = 3001
let nivel_acceso = ""

//motor de renderizado
app.set("views",path.join(__dirname,"/views"))  //establecer motor de vistas
app.engine("ejs", require("ejs").__express)  //establecer motor de renderizado
app.set("view engine", "ejs")  //establecer condiciones de los archivos
app.use(express.static(__dirname+"/views"))  //para usar css o bootstrap, static= carpeta publica
app.use(parser.urlencoded({extended:true}))

app.get("/", function(req,res){
  res.render("principal")
})

app.get("/iniciar", function(req,res){
  res.render("inicio de seccion")
})

app.get("/registro", function(req,res){
  res.render("Registro")
})

app.get("/meta", function(req,res){
  res.render("metaverse")
})

app.get("/admin", function(req,res){
  res.render("admin")
})

app.get("/RProductos", function(req,res){
  res.render("Registro_Productos")
})

app.get("/Productos", function(req,res){
  res.render("productos")
})


app.listen(port, () => {
  conn.connect(function(err){
    if(err)throw err 
    console.log("servidor corriendo en http://localhost:"+port)
  })
})

app.post("/bd_registro_login", function(req,res){
  const nombre_completo=req.body.nombre_completo
  const correo=req.body.correo
  const usuario=req.body.usuario
  const nivel_acceso = req.body.nivel_acceso
  const clave=req.body.clave

  bcrypt.hash(clave, 10, function(err,hash){
      if(err){
          throw err
      }else{
        var sql=`INSERT INTO registro(nombre_completo, correo, usuario, nivel_acceso, clave) VALUES ("${nombre_completo}", "${correo}" ,"${usuario}", "${nivel_acceso}", "${hash}");`
  conn.query(sql,function(err,data,fields){
      if(err) throw err
      res.redirect("/iniciar")
              })
          }
  })
})

app.post("/RProductos", function(req,res){
  const codigo_producto=req.body.codigo_producto
  const nombre_producto=req.body.nombre_producto
  const tipo_produto=req.body.tipo_produto
  const cantidad_produto=req.body.cantidad_produto
  const Tiempo=req.body.Tiempo
  const mone_pro=req.body.mone_pro
  

  var sql=`INSERT INTO productos(codigo_producto, nombre_producto, tipo_produto, cantidad_produto, mone_pro, Tiempo) VALUES ("${codigo_producto}","${nombre_producto}","${tipo_produto}","${cantidad_produto}","${mone_pro}","${Tiempo}");`
  conn.query(sql,function(err,data,fields){
      if(err) throw err
      res.redirect("/admin")
  })
})


app.post("/validar", async function(req, res){
  const { usuario,clave } = req.body
  const sql = `SELECT * FROM registro WHERE usuario = "${usuario}";`
  
  let isAuth = false

  await conn.query(sql, function(err, data){
    if(err) throw err
    console.log(data)
    new Promise(function(resolve, reject){
      bcrypt.compare(clave, data[0].clave, function(err, res){
        if(err) throw err
        if(res){
          isAuth = true
          resolve(isAuth)
        }
        reject(isAuth)
      })
    })
    .then(function(result){
      nivel_acceso = data[0].nivel_acceso
      isAuth == result ? res.redirect("/meta") : console.log("contraseña es incorrecta")
    })
    .catch(function(err){
      res.send("Contraseña incorrecta")
    })
  })
})




//ruta raiz del servidor y parametros
app.get("/agregarUser/:usuario/:psw",function(req,res){
  let {usuario,clave}=req.params
  res.send({usuario,clave})
})

app.get("/views", function(req,res){
  if (nivel_acceso=="admin") {
    res.render("admin")
  } else if (nivel_acceso=="usuario") {
    res.render("/meta")
  } else {
    res.send("primero inicia sesion")
  }
})

app.get("/views", function(req,res){
  res.render("admin")
})

//ruta para validar parametros
app.get("/ValidarUser/:correo_usu/:psw",function(req,res){
  let {correo_usuario,psw} = req.params
  let user=[
      "bryanguerrero16@gmail.com",
      "1234"
  ]
  if(user[0]==correo_usuario && user[1]==psw){
      res.send("Hola bienvenido")
  }else{
      res.send("Datos incorrectos")
  }
})
