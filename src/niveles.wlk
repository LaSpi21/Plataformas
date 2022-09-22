import wollok.game.*
import juego.*
import player.*
import HUD.*
import espada.*
import slime.*
import plataformas.*
import moneda.*
import teletransportadores.*
import puerta.*

object selectorNiveles{
	
	const property listaNiveles = [nivel1, nivel2]
}

class Nivel {

	const posPlataformas = []

	method dibujar(dibujo) {
		game.addVisual(dibujo)
		juego.visuals().add(dibujo)
		return dibujo
	}

	method cargar()
	


}

object nivel1 inherits Nivel {
	
	const property rng = [ true ]


	override method cargar() {
			
	(1 .. game.width() - 2).forEach{ n => posPlataformas.add(new Position(x = n, y = 0))}
	posPlataformas.forEach{ p => self.dibujar(new Plataforma (position = p))}
	
	const espada1 = new Espada(position = game.at(15,  1))
	const slime1 = new Slime(position = game.at(15, 1), izquierda = 9, derecha = 22, animName = "animSlime1", moveTickName = "moveSlime1")

	const nombreNivel1 = new NombreNivel(image = "nivel_1.png")
	
	juego.objetivoMonedas(1)
	juego.dropCoin().addAll(rng.copy())
	juego.objetos().addAll([ vida, reloj, espada1, slime1, ataque, contadorMonedas, puerta, player, monedaHUD ])
	juego.animables().addAll([ player, reloj, vida, slime1, iconoEspada ])
	juego.reInstanciables().addAll([espada1, slime1 ])
		
	juego.objetos().forEach({ unObjeto => game.addVisual(unObjeto)})
	juego.objetos().forEach({ unObjeto => juego.visuals().add(unObjeto)})
	game.addVisual(nombreNivel1)
	game.schedule(1500, {game.removeVisual(nombreNivel1)})
	}
	

}


object nivel2 inherits Nivel {
	
	const property rng = [ true, false, false ]

	override method cargar() {


		(1 .. game.width() * (3 / 15)).forEach{ n => posPlataformas.add(new Position(x = n, y = 0))}
		(game.width() * (41 / 50) .. game.width() - 2).forEach{ n => posPlataformas.add(new Position(x = n, y = 0))}
		(game.width() * (1 / 10) .. game.width() + 5 ).forEach{ n => posPlataformas.add(new Position(x = n, y = (2 / 5) * game.height()))}
		(game.width() * (5 / 10) .. game.width() + 5 ).forEach{ n => posPlataformas.add(new Position(x = n, y = (3 / 5) * game.height()))}
		(0 .. game.width() * (2 / 10)).forEach{ n => posPlataformas.add(new Position(x = n, y = (7 / 10) * game.height()))}
		(game.width() * (2 / 10) .. game.width() * (17 / 50)).forEach{ n => posPlataformas.add(new Position(x = n, y = (1 / 5) * game.height()))}
		(game.width() * (22 / 50) .. game.width() * (5 / 10)).forEach{ n => posPlataformas.add(new Position(x = n, y = (1 / 5) * game.height()))}
		(game.width() * (33 / 50) .. game.width() * (37 / 50)).forEach{ n => posPlataformas.add(new Position(x = n, y = (1 / 5) * game.height()))}
		(game.width() * (40 / 50) .. game.width() + 5).forEach{ n => posPlataformas.add(new Position(x = n, y = (4 / 5) * game.height()))}
		posPlataformas.forEach{ p => self.dibujar(new Plataforma(position = p))}
		
		const espada2 = new Espada(position = game.at(juego.tamanho() * (41 / 50), (4 / 5) * juego.tamanho() + 1))
		const slime4 = new Slime(position = game.at(15, (2 / 5) * juego.tamanho() + 1), izquierda = 9, derecha = 22, animName = "animSlime1", moveTickName = "moveSlime1")
		const slime2 = new Slime(position = game.at(30, (2 / 5) * juego.tamanho() + 1), izquierda = 26, derecha = 33, animName = "animSlime2", moveTickName = "moveSlime2")
		const slime3 = new Slime(position = game.at(30, (3 / 5) * juego.tamanho() + 1), izquierda = 25, derecha = 35, animName = "animSlime3", moveTickName = "moveSlime3")
		const moneda1 = new Moneda(position = game.at(juego.tamanho() * (7 / 10), (3 / 5) * juego.tamanho() + 1))
		const moneda2 = new Moneda(position = game.at(juego.tamanho() * (1 / 10), (7 / 10) * juego.tamanho() + 1))
		const moneda3 = new Moneda(position = game.at(juego.tamanho() * (3 / 10), (2 / 5) * juego.tamanho() + 1))
		const moneda4 = new Moneda(position = game.at(juego.tamanho() * (6 / 10), (2 / 5) * juego.tamanho() + 1))
		const moneda5 = new Moneda(position = game.at(juego.tamanho() * (36 / 50), (1 / 5) * juego.tamanho() + 1))
		const nombreNivel2 = new NombreNivel(image = "nivel_2.png")
		

		juego.objetivoMonedas(6)
		juego.dropCoin().addAll(rng.copy())
		juego.objetos().addAll([ vida, reloj, monedaHUD, contadorMonedas, ataque, espada2, slime4, slime2, slime3, moneda1, moneda2, moneda3, moneda4, moneda5, tp1, r1, tp2, r2, tp3, r3, tp4, r4, puerta, player ])
		juego.animables().addAll([ player, reloj, vida, slime4, slime2, slime3, iconoEspada ])
		juego.reInstanciables().addAll([ slime4, slime2, slime3, moneda1, moneda2, moneda3, moneda4, moneda5, espada2 ])
		juego.objetos().forEach({ unObjeto => game.addVisual(unObjeto)})
		juego.objetos().forEach({ unObjeto => juego.visuals().add(unObjeto)})
		game.addVisual(nombreNivel2)
		game.schedule(1500, { game.removeVisual(nombreNivel2)})
	}


}
