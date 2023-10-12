PImage temporizador;

void pantallaJuego() {
  background(fondo);  
  temporizador= loadImage("temporizador.png");
  image(temporizador, 55, 20, 150, 100);  
  image(loopingGif, 600,450,150,150);
  mundo.step();
  mundo.draw();
   pinza.revisarPeluches( misPeluches, mundo );
//actualizo la pinza
  pinza.actualizar( x, y, cierrePinza );
  pinza.dibujar();
 if (!juegoComenzado) {
      jugar = true;
      tiempoAnterior = millis();
      juegoComenzado = true;
      pinza.revisarPeluches( misPeluches, mundo );
    }
 if (millis() - tiempoAnterior >= 1000) {
      tiempoAnterior = millis();
      if (tiempoRestante > 0) {
        tiempoRestante--;
        
        if (tiempoRestante <= 10) {
          relojSound.play();
          
          if (tiempoRestante <= 3 && !relojSound2.isPlaying()) {
            relojSound2.play();
          }
        }
 } else {
        jugar = false;
        pantallaPerder();
        perderSound.play();
        fondoMusica.pause();
      }
    }
 fill(255);
 String tiempoFormateado = nf(tiempoRestante / 60, 2) + ":" + nf(tiempoRestante % 60, 2);
 textSize(22);
 text(tiempoFormateado, 115, 86);
 
 /*float yPeluche1 = peluche_1.getY(); 
 float yPeluche2 = peluche_2.getY();
 float yPeluche3 = peluche_3.getY();
 float yPeluche4 = peluche_4.getY();
 float yPeluche5 = peluche_5.getY();
 
 float max1 = min(yPeluche1, yPeluche2, yPeluche3);
 float max2 = min(yPeluche4, yPeluche5);
 float max = min(max1, max2);
 
 FBox pelucheMax;
 if (peluche_1.getY() == max) {
   pelucheMax=peluche_1;
 } else if (peluche_2.getY() == max) {
   pelucheMax=peluche_2;
 } else if (peluche_3.getY() == max) {
   pelucheMax=peluche_3;
 } else if (peluche_4.getY() == max) {
   pelucheMax=peluche_4;
 } else  {
   pelucheMax=peluche_5;
 }

 println(pelucheMax);
 float distancia1 = dist(pelucheMax.getX(),pelucheMax.getY(),peluche_1.getX(),peluche_1.getY()); 
 float distancia2 = dist(pelucheMax.getX(),pelucheMax.getY(),peluche_2.getX(),peluche_2.getY()); 
 float distancia3 = dist(pelucheMax.getX(),pelucheMax.getY(),peluche_3.getX(),peluche_3.getY()); 
 float distancia4 = dist(pelucheMax.getX(),pelucheMax.getY(),peluche_4.getX(),peluche_4.getY()); 
 float distancia5 = dist(pelucheMax.getX(),pelucheMax.getY(),peluche_5.getX(),peluche_5.getY()); 
 float distanciaMenor = 1000000;
 FBox pelucheCercano;
 
 if (distancia1 != 0 && distancia1 < distanciaMenor){
   distanciaMenor=distancia1;
   pelucheCercano=peluche_1;
 }
 if (distancia2 != 0 && distancia2 < distanciaMenor){
   distanciaMenor=distancia2;
   pelucheCercano=peluche_2;
 }
 if (distancia3 != 0 && distancia3 < distanciaMenor){
   distanciaMenor=distancia3;
   pelucheCercano=peluche_3;
 }
 if (distancia4 != 0 && distancia4 < distanciaMenor){
   distanciaMenor=distancia4;
   pelucheCercano=peluche_4;
 }
 if (distancia5 != 0 && distancia5 < distanciaMenor){
   distanciaMenor=distancia5;
   pelucheCercano=peluche_5;
 }
 
 println(max);
 println(max<=350);
 //println(clicPresionado==false);
 println(distanciaMenor<=70);
 println();
// if (max<=380 && clicPresionado==false && distanciaMenor<=70){
  if (max<=380 && distanciaMenor<=70){
    pantalla="ganar"; 
 }*/
 //agregar que este quieto el objeto
 //o usar colisiones de fisica para detectar 
 
float xPeluche1 = peluche_1.getX(); 
float xPeluche2 = peluche_2.getX();
float xPeluche3 = peluche_3.getX();
float xPeluche4 = peluche_4.getX();
float xPeluche5 = peluche_5.getX();

float yPeluche1 = peluche_1.getY(); 
float yPeluche2 = peluche_2.getY();
float yPeluche3 = peluche_3.getY();
float yPeluche4 = peluche_4.getY();
float yPeluche5 = peluche_5.getY();

 float distancia1 = dist(xPeluche1 , yPeluche1 , xPeluche2 , yPeluche2); 
 float distancia2 = dist(xPeluche2 , yPeluche2 , xPeluche3 , yPeluche3); 
 float distancia3 = dist(xPeluche3 , yPeluche3 , xPeluche4 , yPeluche4); 
 float distancia4 = dist(xPeluche4 , yPeluche4 , xPeluche5 , yPeluche5); 
 
 
println(yPeluche5);

if (distancia1 < 55 && distancia2 < 55 && distancia3 < 55 && distancia4 < 55 && yPeluche5<=420 && cerrada==false){
pantalla="ganar";
}

}  
    
