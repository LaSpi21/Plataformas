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
	var image = 0
	var anim_time = 200
	var property position
	var direccion = true
	var izquierda
	var derecha
	var vida = 5
	var transpasable = false
	var moveTickName
	var animName
	var vivo = true

	method image() {
		return sprites.get(image)
	}

	method esSuelo() = false

	method chocar() {
		if (!transpasable and player.estaVivo()) { player.bajarSalud(2)
			if (player.salud() > 0){
				player.transportar(player.posicionInicial())
				game.say(player, [ "¡Auch!", "Otra vez al comienzo..", "ouch...", "aaAaH!!!" ].anyOne())
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

	method aplicarAnimate() {
		game.onTick(anim_time, animName, { self.Animate()})
		juego.tickEvents().add(animName)
	}

	method iniciar() {
		vivo = true
		console.println("iniciar slime")
		sprites = slime_mov
		game.onTick(400, moveTickName, { self.mover()})
		juego.tickEvents().add(moveTickName)
			// game.onTick(125 / 4, "gravity", { self.caer()})
		self.aplicarAnimate()
		transpasable = false
		console.println("inicio slime")
	}

	method mover() {
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
		if (juego.tickEvents().contains(moveTickName)) {
			game.removeTickEvent(moveTickName)
			juego.tickEvents().remove(moveTickName)
			game.schedule(350, { game.removeTickEvent(animName)})
			game.schedule(350, { juego.tickEvents().remove(animName)})
			game.schedule(400, { self.iniciar()})
		}
		if (vida <= 0) {
			self.morir()
		}
	}

	method morir() {
		self.detener()
		const dropMoneda = juego.dropCoin().anyOne()
		if (dropMoneda) {
			const dropeable = new Moneda(position = self.position())
		} else {
			const dropeable = new HealPack(position = self.position())
		}
		game.addVisual(dropeable)
		juego.visuals().add(dropeable)
		juego.dropCoin().remove(dropMoneda)

	}



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
			game.removeVisual(self)
			juego.visuals().remove(self)
			game.schedule(500, { game.removeTickEvent(animName)})
			game.schedule(500, { juego.tickEvents().remove(animName)})
			game.schedule(500, { game.removeTickEvent(moveTickName)})
			game.schedule(500, { juego.tickEvents().remove(moveTickName)})
			vivo = !vivo
		}
	}

}
