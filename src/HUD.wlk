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

	method image() = "assets/coinPequenha.png"
	
	method position() = game.at(1, juego.tamanho() * (9 / 10) - 1)
	
	

}

object contadorMonedas {

	method text() = juego.monedas().toString() + "/ " + juego.objetivoMonedas()

	method position() = game.at(2, juego.tamanho() * (9 / 10) - 3)

}

object reloj {

	
	var tiempo = 100
	
	method pasoElTiempo(segundos){
		tiempo -= segundos
		if (tiempo < 0) {
			player.morir()
		}
	}

	method text() = tiempo.roundUp().toString()

	method position() = game.at(juego.tamanho() / 2, game.height() - juego.tamanho() / 10)



	method iniciar() {
		tiempo = 100

	}

	method detener() {
		if (juego.tickEvents().contains("tiempo")) {
			game.removeTickEvent("tiempo")
			juego.tickEvents().remove("tiempo")
		}
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

