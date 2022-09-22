import wollok.game.*
import player.*
import HUD.*
import espada.*
import slime.*
import plataformas.* 
import moneda.*
import teletransportadores.*
import puerta.*
import niveles.*

object juego {

	const property tamanho = 40
	const property objetos = []
	const property animables = []
	const property reInstanciables = []
	const property tickEvents = []
	const property visuals = []
	var property monedas = 0
	var property objetivoMonedas = 6
	var property dropCoin = []
	var property nivel = 0
	
	
	
	
	method configurar() {
		game.width(tamanho)
		game.height(tamanho)
		game.cellSize(12)
		game.title("platformero")

		keyboard.space().onPressDo{ self.saltar()}
		keyboard.right().onPressDo{ self.caminar(true)}
		keyboard.left().onPressDo{ self.caminar(false)}
		keyboard.r().onPressDo{ self.reiniciar()}
		keyboard.q().onPressDo{ player.atacar1()}
		keyboard.w().onPressDo{ player.atacar2()}
		keyboard.e().onPressDo{ player.atacar3()}
		//keyboard.p().onPressDo{ player.mostrarPosicion()} // MOTIVOS DE PRUEBAS
		//keyboard.k().onPressDo{ player.bajarSalud(1)} // MOTIVOS DE PRUEBAS
		//keyboard.l().onPressDo{ player.subirSalud(1)} // MOTIVOS DE PRUEBAS
		//keyboard.x().onPressDo{ console.println(tickEvents)} // MOTIVOS DE PRUEBAS
		keyboard.c().onPressDo{ console.println(visuals)} // MOTIVOS DE PRUEBAS
		keyboard.g().onPressDo{ self.ganar()} // MOTIVOS DE PRUEBAS
	}

	method obtenerMoneda(){
		monedas += 1
		if (monedas == objetivoMonedas){
			puerta.abrirPuerta()
		}
	}
	
	method ganar(){
		player.quitarVida()
		puerta.cerrarPuerta()

		game.say(player, "Yo ya gané")
		nivel = 1
		self.cambiarNivel()
		
	}
	
	method cambiarNivel() {
		animables.forEach({ unObjeto => self.detener(unObjeto)})
		visuals.forEach({ unObjeto => game.removeVisual(unObjeto)})
		objetos.clear()
		visuals.clear()
		animables.clear()
		reInstanciables.clear()
		monedas = 0
		
		selectorNiveles.listaNiveles().get(nivel).cargar()
		self.iniciar()
		player_hit.cargar()
		
	}
	
	method iniciar() {
		animables.forEach({ unObjeto => unObjeto.iniciar()})
	}

	method colisiones() {
		player.hitbox().forEach({ x => game.onCollideDo(x, { obstaculo => obstaculo.chocar()})})
		game.onCollideDo(ataque, { obstaculo => obstaculo.serAtacado(ataque.danho())})
	}

	method saltar() {
		if (player.estaVivo()) player.saltar() else {
		}
	}


	
	
	method reiniciar() {
		if (tickEvents.size() > 0) {
			self.terminar()
		}
		monedas = 0
		dropCoin = selectorNiveles.listaNiveles().get(nivel).rng()
		puerta.cerrarPuerta()
		self.iniciar()
	}

	method caminar(direccion) {
		if (player.estaVivo()) player.caminar(direccion) else {
		}
	}

	method terminar() {
		//game.addVisual(gameOver)
		animables.forEach({ unObjeto => self.detener(unObjeto)})
		reInstanciables.forEach({ unObjeto => unObjeto.reiniciar()})
		
	}
	
	method detener(objeto){
		if (visuals.contains(objeto)){
			objeto.detener()
		}
	}


}