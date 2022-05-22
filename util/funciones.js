module.exports={
    obtener_nombre:function(nombre){
        let object= [{"nombre": "Juan","cedula":"1234567"}]
    if(nombre==object[0].nombre){
        const res="Su nombre es: "+object[0].nombre
        return res
    }else{
        const res="Tu no eres: "+object[0].nombre
        return res 
    }
    }
}