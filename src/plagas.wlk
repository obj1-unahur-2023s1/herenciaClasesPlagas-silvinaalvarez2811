import barrios.*


class Plaga{
	var property poblacion 
	
	method transmitirEnfermedad(){
		return poblacion>=10 && self.condicionAdicional()
		
	}
	method condicionAdicional()=true
	
	method efectoDeAtaque(){
		poblacion += poblacion*0.10
	}
}


class Cucaracha inherits Plaga{
	var property pesoPromedio
	
	method nivelDeDanio(){
		return poblacion/2
	}
	
	override method condicionAdicional(){
		return pesoPromedio >=10 
	}
	override method efectoDeAtaque(){
		super()
		pesoPromedio += 2
	}
}


class Pulga inherits Plaga{
	
	method nivelDeDanio(){
		return poblacion*2
	}

}


class Garrapata inherits Pulga{
	
	override method efectoDeAtaque(){
		poblacion += poblacion*0.20
		
	}
}


class Mosquito inherits Plaga{
	method nivelDeDanio(){
		return poblacion
	}
	
	override method condicionAdicional(){
		return poblacion % 3 == 0 
	}
}