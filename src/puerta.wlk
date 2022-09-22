import wollok.game.*
import player.*
import juego.* 

object puerta{
	
	var estaAbierta = false
	var property position = game.at(juego.tamanho() - 8, 1)
	var property image = "puertaCerradaChica.png"
	
	method abrirPuerta(){
		estaAbierta = true
		image = "puertaAbiertaChica.png"
	}
	
	method cerrarPuerta(){
		estaAbierta = false
		image = "puertaCerradaChica.png"
	}
	
	method chocar() {
		if (estaAbierta) {
			juego.ganar()
		}
		else{
			game.say(player, "Me faltan " + (6-juego.monedas()).toString() + " monedas")
		}
	}

	method serAtacado(x) {
	}

	method esSuelo() = false


	
}