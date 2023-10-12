//sonido
import ddf.minim.*;
Minim minim;
AudioPlayer fondoMusica;
AudioPlayer perderSound;
AudioPlayer relojSound;
AudioPlayer relojSound2;  
AudioPlayer pelucheSound;
AudioPlayer ganarSound;
AudioPlayer reiniciarSound;
int tiempoInicial = 60;
int tiempoRestante = tiempoInicial;
int tiempoAnterior;

//fisica
import fisica.*;
FWorld mundo;
Pinza pinza;
FBox[] peluches;
FBox extras;
FBox peluche, peluche_1, peluche_2, peluche_3, peluche_4, peluche_5;
ArrayList <FBox> misPeluches;

//juego
String pantalla;
boolean juegoComenzado = false;
boolean ganaste = false;
boolean jugar = false;
int numCajas = 5;
//imagenes
PImage inicio, fondo, pantallaperder,pantallaGanar,instrucciones1Img,instrucciones2Img;
PImage bloque1,bloque2,bloque3,bloque4,bloque5,bloque6,bloque7,bloque8,bloque9,bloque10;
PImage[] imagenesBloque = new PImage[10];
boolean seCerro, seAbrio;
boolean cerrada = false;

//captura
import oscP5.*;
OscP5 oscP5;
float x = 400; // posicion de la mano
float y = 0; // posicion de la mano
boolean manoCerrada = false; // Variable para rastrear si la mano está cerrada o abierta
boolean manoAbierta = true; // Supongamos que la garra está abierta al principio
boolean cierrePinza;

//video
import processing.video.*;
Movie movie;
import gifAnimation.*;
Gif loopingGif;

  
void setup() {
  size(800, 600);
  pantalla = "inicio";
  //imagenes
  inicio = loadImage("Inicio2.png");
  instrucciones1Img = loadImage("instrucciones1.png");
  instrucciones2Img = loadImage("instrucciones2.png");
  fondo = loadImage("background_roto.png");
  pantallaperder = loadImage("pantalla_perder.png");
  pantallaGanar = loadImage("pantalla_ganar.png");
  bloque1 = loadImage("bloque1.png");
  bloque2 = loadImage("bloque2.png");
  bloque3 = loadImage("bloque3.png");
  bloque4 = loadImage("bloque4.png");
  bloque5 = loadImage("bloque5.png");
  bloque6 = loadImage("bloque6.png");
  bloque7 = loadImage("bloque7.png");
  bloque8 = loadImage("bloque8.png");
  bloque9 = loadImage("bloque9.png");
  bloque10 = loadImage("bloque10.png");
  for (int i = 0; i < 10; i++) {
    imagenesBloque[i] = loadImage("extra" + (i+1) + ".png");
  }
  
  //fisica
  Fisica.init(this);
  mundo = new FWorld();
  mundo.setEdges(1);
  pinza = new Pinza();
  misPeluches = new ArrayList();
  peluche_1  = creacionPeluche1(); 
  peluche_2  = creacionPeluche2();
  peluche_3  = creacionPeluche3();
  peluche_4  = creacionPeluche4();
  peluche_5  = creacionPeluche5();
  
  for (int i = 0; i < 3; i++) {
    FBox nuevoExtras = crearExtras();
    mundo.add(nuevoExtras);
    misPeluches.add(nuevoExtras);
  }
 
  //sonidos
  minim = new Minim(this);
  
  perderSound = minim.loadFile("perder.mp3");
  ganarSound = minim.loadFile ("Ganar.mp3");
  reiniciarSound = minim.loadFile ("Apertura.mp3");

  fondoMusica = minim.loadFile("Juego.mp3");
  fondoMusica.loop();
  fondoMusica.setGain(0.5);
  
  relojSound = minim.loadFile("Reloj.mp3");
  relojSound2 = minim.loadFile("Reloj2.mp3");
  pelucheSound = minim.loadFile("peluche.mp3");

  //captura
   oscP5 = new OscP5(this, 8008); // Reemplaza 8008 con el puerto correcto de HandPose OSC
  
  //video
  movie = new Movie(this, "cinematica.mp4");
  loopingGif = new Gif(this,"gato_animado.gif");
  loopingGif.loop();
  
  
}

void draw() {

  //la logica es que si pantalla== el nombre de la pantalla 
  //se muestre la funcion de la pantalla que deseamos
 if (pantalla == "inicio") {
    pantallaInicio();
    cierrePinza();
  }else if (pantalla=="cinematica") {
    pantallamovie();
    int tiempoCinematica = 0;
    tiempoCinematica += frameCount;
    println(tiempoCinematica);
    if(tiempoCinematica > 300){
      movie.stop();
      pantalla ="instrucciones1";
      }
  }  else if (pantalla == "juego") {
    pantallaJuego();
    cierrePinza();
  } else if (pantalla == "perder") {
    pantallaPerder();
    cierrePinza();
  } else if (pantalla=="ganar") {
    pantallaGanar();
    cierrePinza();
  } else if (pantalla == "instrucciones1") {  // Agregamos la pantalla de instrucciones.
    pantallaInstrucciones1();
    cierrePinza();
  } else if (pantalla == "instrucciones2") {  // Agregamos la pantalla de instrucciones.
    pantallaInstrucciones2();
    cierrePinza();
  }

}



void cierrePinza(){
if(manoCerrada==true && manoAbierta==false){
  println("cierra");
cierrePinza=true;
}else
cierrePinza=false;
  
if(cierrePinza==true){
 if (pantalla == "inicio") {
    botonGeneral(550, 190, 155, 150, "cinematica");
  } else if (pantalla == "juego" ) {
    tiempoAnterior = millis();
    pelucheSound.rewind(); // Reiniciamos el sonido para que se pueda reproducir desde el principio
    pelucheSound.play();
  } else if (pantalla=="perder") {
    botonPerder(120, 400, 155, 150, "juego" );
    reiniciarJuego();
  } else if (pantalla == "instrucciones1") {  // Cambiamos cualquier clic en instrucciones a la pantalla de juego.
    pantalla ="instrucciones2";
  } else if (pantalla == "instrucciones2") {  // Cambiamos cualquier clic en instrucciones a la pantalla de juego.
    botonGeneral(550, 425, 100, 100, "juego");
  } 

}  
  
}


void stop() {
  perderSound.close();
  fondoMusica.close();
  relojSound.close();
  relojSound2.close();
  pelucheSound.close();
  ganarSound.close();
  minim.stop();
  super.stop();
}
