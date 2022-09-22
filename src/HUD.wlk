import juego.*
import player.*
import wollok.game.*

object gameOver {

	method position() = game.center()

	method text() = "GAME OVER"

}

class NombreNivel{
	
	const property image
	
	method position() = game.at(6,20)
	
}


object vida {

	const imagenes = [ "hearts0.png", "hearts1.png", "hearts2.png", "hearts3.png", "hearts4.png", "hearts5.png", "hearts6.png" ]

	method image() {
		return imagenes.get(player.salud())
	}

	method position() = game.at(1, juego.tamanho() * (9 / 10) + 1)

	method iniciar() {

		player.todaLaVida()

	}

	method detener() {
	}

}

object monedaHUD {

	method image() = "coinPequenha.png"
	
	method position() = game.at(1, juego.tamanho() * (9 / 10) - 1)
	
	

}

object contadorMonedas {

	method text() = juego.monedas().toString() + "/ " + juego.objetivoMonedas()

	method position() = game.at(2, juego.tamanho() * (9 / 10) - 3)

}

object reloj {

	
	var tiempo = 100

	method text() = tiempo.roundUp().toString()

	method position() = game.at(juego.tamanho() / 2, game.height() - juego.tamanho() / 10)

	method pasarTiempo() {
		tiempo = tiempo - 0.3
		if (tiempo < 0) {
			player.morir()
		}
		player.caer()
	// game.onTick(250 / 3, "gravity", { self.caer()})
	}

	method iniciar() {
		tiempo = 100
		game.onTick(300, "tiempo", { self.pasarTiempo()})
		juego.tickEvents().add("tiempo")
	}

	method detener() {
		if (juego.tickEvents().contains("tiempo")) {
			game.removeTickEvent("tiempo")
			juego.tickEvents().remove("tiempo")
		}
	}

	method reinciar() {
		game.onTick(1000, "tiempo", { self.pasarTiempo()})
		juego.tickEvents().add("tiempo")
	}

}

object iconoEspada {

	var property image = "sword11.png"
	var property position = game.at(6, juego.tamanho() * (9 / 10) - 1)

	method iniciar() {
	}

	method detener() {
		game.removeVisual(self)
		juego.visuals().remove(self)
	}

}

