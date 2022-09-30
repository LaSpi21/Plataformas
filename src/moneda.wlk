import wollok.game.*
import juego.*
import obtenibles.*

class Moneda inherits Obtenibles{

	override method image() = "assets/coin.png"

	override method chocar() {
		juego.obtenerMoneda()
		super()
	}

	method reiniciar() {
		if (!juego.visuals().contains(self)) {
			game.addVisual(self)
			juego.visuals().add(self)
		}
	}

}

