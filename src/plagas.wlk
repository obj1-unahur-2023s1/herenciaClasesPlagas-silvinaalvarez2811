import barrios.*


class Plaga{
	var property poblacion 
	
	method transmitirEnfermedad(){
		return poblacion>=10 
		
	}
	method atacar(unElemento){
		unElemento.sufrirAtaque(self)
		poblacion = poblacion* self.coeficiente()
	}
	method coeficiente() = 1.10
}


class Cucaracha inherits Plaga{
	var property pesoPromedio
	
	method nivelDeDanio(){
		return poblacion/2
	}
	override method transmitirEnfermedad(){
		return super() && pesoPromedio >=10 
	}
	override method atacar(unElemento){
		super(unElemento)
		pesoPromedio += 2
		
	}
}


class Pulga inherits Plaga{
	
	method nivelDeDanio(){
		return poblacion*2
	}
}


class Garrapata inherits Pulga{
	
	override method coeficiente() = 1.20
	
}


class Mosquito inherits Plaga{
	
	method nivelDeDanio(){
		return poblacion
	}
	
	override method transmitirEnfermedad(){
		return  super() && poblacion % 3 == 0 
	}
}