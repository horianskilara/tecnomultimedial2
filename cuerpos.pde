 FBox creacionPeluche1(){
  peluche = new FBox(90, 40);
  peluche.setPosition(random(200,600),543); 
  peluche.setFriction(1);
  peluche.setDensity(1000);
  peluche.setAngularDamping(10);
  peluche.setRotatable(false);
  peluche.setGrabbable( false );
  peluche.setName("peluche1");
  peluche.setVelocity(50,0);
    // Seleccionar una imagen aleatoria de los bloques
 // PImage imagenAleatoria = imagenesBloque[int(random(imagenesBloque.length))];
  //peluche.attachImage(imagenAleatoria);
  float imgRandom1 = random(1);
  if(imgRandom1 < 0.5){
  peluche.attachImage(bloque1);
  } else{
  peluche.attachImage(bloque2);
  }  
  mundo.add(peluche);
  misPeluches.add(peluche);
  return peluche;
}

 FBox creacionPeluche2(){
  peluche = new FBox(90, 40);
  peluche.setPosition(random(200,600),543); 
  peluche.setFriction(1);
  peluche.setDensity(1000);
  peluche.setAngularDamping(10);
  peluche.setGrabbable( false );
  peluche.setName("peluche2");
  peluche.setVelocity(50,0);
    // Seleccionar una imagen aleatoria de los bloques
 // PImage imagenAleatoria = imagenesBloque[int(random(imagenesBloque.length))];
  //peluche.attachImage(imagenAleatoria);
   float imgRandom2 = random(1);
  if(imgRandom2 < 0.5){
  peluche.attachImage(bloque3);
  } else{
  peluche.attachImage(bloque4);
  } 
  mundo.add(peluche);
  misPeluches.add(peluche);
  return peluche;
}

 FBox creacionPeluche3(){
  peluche = new FBox(90, 40);
  peluche.setPosition(random(200,600),543); 
  peluche.setFriction(1);
  peluche.setDensity(1000);
  peluche.setAngularDamping(10);
  peluche.setGrabbable( false );
  peluche.setName("peluche3");
  peluche.setVelocity(50,0);
    // Seleccionar una imagen aleatoria de los bloques
 // PImage imagenAleatoria = imagenesBloque[int(random(imagenesBloque.length))];
  //peluche.attachImage(imagenAleatoria);
   float imgRandom3 = random(1);
  if(imgRandom3 < 0.5){
  peluche.attachImage(bloque5);
  } else{
  peluche.attachImage(bloque6);
  } 
  //peluche.attachImage(bloque3);
  mundo.add(peluche);
  misPeluches.add(peluche);
  return peluche;
}

 FBox creacionPeluche4(){
  peluche = new FBox(90, 40);
  peluche.setPosition(random(200,600),543); 
  peluche.setFriction(1);
  peluche.setDensity(1000);
  peluche.setAngularDamping(10);
  peluche.setGrabbable( false );
  peluche.setName("peluche4");
  peluche.setVelocity(50,0);
    // Seleccionar una imagen aleatoria de los bloques
 // PImage imagenAleatoria = imagenesBloque[int(random(imagenesBloque.length))];
  //peluche.attachImage(imagenAleatoria);
   float imgRandom4 = random(1);
  if(imgRandom4 < 0.5){
  peluche.attachImage(bloque7);
  } else{
  peluche.attachImage(bloque8);
  } 
  mundo.add(peluche);
  misPeluches.add(peluche);
  return peluche;
}

 FBox creacionPeluche5(){
  peluche = new FBox(90, 40);
  peluche.setPosition(random(200,600),543); 
  peluche.setFriction(1);
  peluche.setDensity(1000);
  peluche.setAngularDamping(10);
  peluche.setGrabbable( false );
  peluche.setName("peluche5");
  peluche.setVelocity(50,0);
    // Seleccionar una imagen aleatoria de los bloques
 // PImage imagenAleatoria = imagenesBloque[int(random(imagenesBloque.length))];
  //peluche.attachImage(imagenAleatoria);
   float imgRandom5 = random(1);
  if(imgRandom5 < 0.5){
  peluche.attachImage(bloque9);
  } else{
  peluche.attachImage(bloque10);
  } 
  mundo.add(peluche);
  misPeluches.add(peluche);
  return peluche;
}

FBox crearExtras() {
  FBox extras = new FBox(90, 50);
  extras.setPosition(random(200,600), 543);  // Posición inicial
  extras.setNoStroke();
  extras.setFriction(1);
  extras.setDensity(1000);
  peluche.setAngularDamping(10);
  extras.setName("extras");
  PImage imagenAleatoria = imagenesBloque[int(random(imagenesBloque.length))];
  extras.attachImage(imagenAleatoria);
  return extras;
}
