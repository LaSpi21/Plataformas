import wollok.game.*
import espada.*
import juego.*
import player.*
import moneda.*
import healPack.*

class Slime {

	const slime_mov = [ "slime (1).png", "slime (2).png", "slime (3).png", "slime (4).png", "slime (5).png", "slime (6).png", "slime (7).png", "slime (8).png", "slime (9).png", "slime (10).png" ]
	const slime_danho = [ "slime_red1.png", "slime_red2.png", "slime_red3.png", "slime_red4.png", "slime_red5.png", "slime_red6.png", "slime_red7.png", "slime_red8.png", "slime_red9.png", "slime_red10.png", "slime_red11.png" ]
	var property sprites = slime_mov
	var image = (1..10).anyOne()
	var property position
	var direccion = true
	const izquierda
	const derecha
	var vida = 5
	var transpasable = false
	const moveTickName
	const animName
	var vivo = true

	method image() {
		return sprites.get(image)
	}

	method esSuelo() = false

	method chocar() {
		if (!transpasable and player.estaVivo()) { player.bajarSalud(2)
			if (player.salud() > 0){
				player.transportar(player.posicionInicial())
				game.say(player, [ "Más cuidado che", "Otra vez al comienzo..", "ouch...", "aaAaH!!!" ].anyOne())
			}
		}
	}

	method Animate() {
		if (image < sprites.size() - 1) {
			image += 1
		} else {
			image = 0
		}
	}


	method iniciar() {
		vivo = true
		console.println("iniciar slime")
		sprites = slime_mov
		transpasable = false
		console.println("inicio slime")
	}

	method mover() {
		self.Animate()
		if (direccion) {
			position = position.left(1)
			if (position.x() <= izquierda) {
				direccion = !direccion
			}
		} else {
			position = position.right(1)
			if (position.x() >= derecha) {
				direccion = !direccion
			}
		}
	}

	method serAtacado(x) {
		vida -= x
		ataque.position(game.at(juego.tamanho(), juego.tamanho()))
		sprites = slime_danho
		transpasable = true
		if (vida <= 0) {
			self.morir()
		}
		else if (juego.tickEvents().contains(moveTickName)) {
			game.removeTickEvent(moveTickName)
			juego.tickEvents().remove(moveTickName)
			direccion = !direccion
			game.schedule(350, { game.removeTickEvent(animName)})
			game.schedule(350, { juego.tickEvents().remove(animName)})
			game.schedule(450, { self.iniciar()})
		}

	}

	method morir() {
		self.detener()
		self.dropear()

	}

	method

	method reiniciar() {
		console.println("reiniciar slime")
		if (!juego.visuals().contains(self)) {
			game.addVisual(self)
			juego.visuals().add(self)
			console.println("reinicio slime")
		}
	}

	method detener() {
		if (vivo) {
			vivo = !vivo
			game.removeVisual(self)
			juego.enemigos().remove(self)
		}
	}

}
