import wollok.game.*
import juego.*
import espada.*
import player.*


class Player_hitbox {

	var property position

	method image() = "pixel.png" 

	method chocar() {
	}

	method serAtacado(x) {
	}

}

object player_hit {

	method cargar() {
//	HITBOX
		const ancho = 2
			// const alto = 3
		const posHitbox = []
		(0 .. ancho).forEach{ n => posHitbox.add(new Position(x = player.position().x() + 2 + n, y = player.position().y()))} // bordeAbajo
		posHitbox.forEach({ p => self.dibujar(new Player_hitbox(position = p))})
	}

	method dibujar(dibujo) {
		game.addVisual(dibujo)
		player.hitbox().add(dibujo)
		return dibujo
	}

}