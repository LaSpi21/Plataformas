import wollok.game.*
import player.*
import HUD.*
import juego.*
import obtenibles.*

class Espada inherits Obtenibles{
	
	override method image() = "sword11.png"
	
	override method chocar() {
		game.addVisual(iconoEspada)
		juego.visuals().add(iconoEspada)
		player.tieneEspada(true)
		player.animIdle()
		super()


	}
	
	method reiniciar() {
		console.println("reiniciar espada")
		if (!juego.visuals().contains(self)) {
			
			game.addVisual(self)
			juego.visuals().add(self)
			
		}
		console.println("reinicio espada")
	}
}





	
	




object ataque {

	var property position = game.at(0, 0)
	var property image = "pixel.png"
	var property danho = 0

	method mover(direccion) {
		if (direccion) {
			position = position.left(1)
		} else {
			position = position.right(1)
		}
	}

	method chocar() {
	}

}

