import wollok.game.*
import juego.*
import player.*

class Teleporter {

	var position
	var property image
	var property x
	var property y

	method esSuelo() = false

	method chocar() {
		// player.position(player.position.right(x).up(x)) CHECKEA ESTO
		player.transportar(game.at(x-2, y))
	}

	method position() = return position

	method serAtacado(danho) {
	}

}

class Receiver {

	var property position
	var property image

	method esSuelo() = false

	method chocar() {
	}

	method serAtacado(x) {
	}

}

const tp1 = new Teleporter(position = game.at(juego.tamanho() * (2 / 15) + 2, 1), image = "tp1.png", x = juego.tamanho() - 4, y = (3 / 5) * juego.tamanho() + 1)

const tp2 = new Teleporter(position = game.at(juego.tamanho() - 6, (2 / 5) * juego.tamanho() + 1), image = "tp2.png", x = juego.tamanho() * (2 / 10), y = (1 / 5) * juego.tamanho() + 1)

const tp3 = new Teleporter(position = game.at(juego.tamanho() * (1 / 10) + 2, (2 / 5) * juego.tamanho() + 1), image = "tp3.png", x = 1, y = (7 / 10) * juego.tamanho() + 1)

const tp4 = new Teleporter(position = game.at(juego.tamanho() - 5, 1), image = "tp4.png", x = juego.tamanho() - 4, y = (4 / 5) * juego.tamanho() + 1)

const r1 = new Receiver(position = game.at(tp1.x(), tp1.y()), image = "tp1r.png")

const r2 = new Receiver(position = game.at(tp2.x(), tp2.y()), image = "tp2r.png")

const r3 = new Receiver(position = game.at(tp3.x(), tp3.y()), image = "tp3r.png")

const r4 = new Receiver(position = game.at(tp4.x(), tp4.y()), image = "tp4r.png")

