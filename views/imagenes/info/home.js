let nivel_acceso = window.localStorage.getItem("nivel_acceso")
if( nivel_acceso!=null){
    alert("bienvenido, Usuario")
}else{
    alert("primero debe iniciar seccion")
    window.location.assign("registro.html")
}