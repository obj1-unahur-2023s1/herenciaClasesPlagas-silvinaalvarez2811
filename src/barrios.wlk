import plagas.*


class Barrio{
	const elementos=[]
	
	method agregarElemento(elemento){
		elementos.add(elemento)
	}
	method quitarElemento(elemento){
		elementos.remove(elemento)
	}
	method elementos(){ return elementos}
	
	method esCopado(){
		const elemBuenos=elementos.count({elemento=>elemento.esBueno()})
		const elemMalos=elementos.count({elemento=>!elemento.esBueno()})
		
		return elemBuenos>elemMalos
	}

	method recibirAtaque(plaga){
		elementos.forEach({elem=>elem.sufrirAtaque(plaga)})
		plaga.efectoDeAtaque()
	}
}

class Hogar{
	var property nivelDeMugre
	var property confort
	
	method esBueno(){
		return confort>=nivelDeMugre/2
		
	}
	
	method sufrirAtaque(plaga){
		nivelDeMugre = plaga.nivelDeDanio()
	}
}

class Huerta{
	var property capacidadDeProduccion
	var property referenciaProduccion
	
	method esBueno(){
		return capacidadDeProduccion>referenciaProduccion
	}
	
	method sufrirAtaque(plaga){
		capacidadDeProduccion-= plaga.nivelDeDanio()*0.1
		if (plaga.transmitirEnfermedad()){
			capacidadDeProduccion-=10
		}
	}
}


class Mascota{
	var property nivelDeSalud
	
	method esBueno(){
		return nivelDeSalud>250
	}
	method sufrirAtaque(plaga){
		if (plaga.transmitirEnfermedad()){
		nivelDeSalud-= plaga.nivelDeDanio()
		}
	
	}
}