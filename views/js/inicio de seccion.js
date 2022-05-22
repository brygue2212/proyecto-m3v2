let si_logueado= window.localStorage.getItem("si_logueado")
if(si_logueado==true){
    alert("redirigiendo")
    window.location.assign("file:///media/estudiante/BRYAN/modulo%202/info/Nueva%20carpeta%20(2)/metaverse.html")
}


var boton = document.getElementById("login")
function login() {
    let usuario=document.getElementById("usuario").value
    let clave = document.getElementById("clave").value
    let hash = CryptoJS.MD5(clave)
    
    if (usuario=="Bryan" && clave=="1234") {
        alert("Bienvenido")
        nivel_acceso="Admin"
        window.localStorage.setItem("nivel",nivel_acceso)
        window.location.assign("file:///media/estudiante/BRYAN/modulo%202/admin/admin.html")
    }else{
            if(usuario == window.localStorage.getItem("usuario")) {
                if (hash == window.localStorage.getItem("clave")) {
                    window.localStorage.setItem("si_logueado", true)
                    alert("Iniciando sesión")
                    window.location.href="file:///media/estudiante/BRYAN/modulo%202/info/metaverse.html"
                }else{
                    alert("La contraseña no es correcta")
                }
            }else{
                alert("Usuario no existe")
            }
        }

    
}
boton.addEventListener("click", login)

var boton = document.getElementById("registro")
function registro() {
    let usuario=document.getElementById("usuario").value
    let clave = document.getElementById("clave").value
    let hash = CryptoJS.MD5(clave)
    window.localStorage.setItem("usuario", usuario)
    window.localStorage.setItem("clave", hash)
    alert("usuario registrado")
}
boton.addEventListener("click", registro)


