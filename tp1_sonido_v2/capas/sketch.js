let canvasWidth = 800;
let canvasHeight = 800;

// Amarillas
let customImage, customImage2;
let minDistance = 650;

let yellowPhaseTime = 15000; // Tiempo en milisegundos para la fase amarilla (15 segundos)
let yellowPhaseActive = true;
let yellowPhaseEndTime;

// Lilas
let lilas = [];

let lilacPhaseTime = 15000; // Tiempo en milisegundos para la fase lila (15 segundos)
let lilacPhaseActive = false;
let lilacPhaseEndTime;

// Celeste
let celestes;
let celestePhaseTime = 15000; // Tiempo en milisegundos para la fase celeste (15 segundos)
let celestePhaseActive = false;
let celestePhaseEndTime;

// Tiempo actual en milisegundos
let currentTime = 0;

function setup() {
  createCanvas(canvasWidth, canvasHeight);

  // Amarillas
  customImage = new CustomImage(random(width), random(0, 400));
  customImage2 = new CustomImage(random(width), random(400, 800));

  // Lilas
  let numLilas;
  if (random() < 0.15) { // 15% de las veces crear 3 elipses
    numLilas = 3;
  } else {
    numLilas = 2;
  }
  for (let i = 0; i < numLilas; i++) {
    let l = new Lila();
    while (l.checkOverlap()) {
      l = new Lila();
    }
    lilas.push(l);
  }

  // Celeste
  celestes = new Celestes();

  // Calcular los tiempos de finalización de cada fase
  yellowPhaseEndTime = millis() + yellowPhaseTime;
  lilacPhaseEndTime = yellowPhaseEndTime + lilacPhaseTime;
  celestePhaseEndTime = lilacPhaseEndTime + celestePhaseTime;
}

function draw() {
  background(255);
  // Actualizar el tiempo actual
  currentTime = millis();

  // Fase amarilla
  if (yellowPhaseActive) {
    customImage.showImage();
    customImage.updatePosition();
    customImage2.showImage();
    customImage2.updatePosition();
    customImage.checkDistance(customImage2);

    // Verificar si ha pasado el tiempo de la fase amarilla
    if (currentTime >= yellowPhaseEndTime) {
      yellowPhaseActive = false;
      lilacPhaseActive = true;
      lilacPhaseEndTime = currentTime + lilacPhaseTime; // Establecer el tiempo de finalización de la fase lila
    }
  }
  // Fase lila
  else if (lilacPhaseActive) {
    for (let l of lilas) {
      l.draw();
      l.actualizarPosicion();
    }

    // Verificar si ha pasado el tiempo de la fase lila
    if (currentTime >= lilacPhaseEndTime) {
      lilacPhaseActive = false;
      celestePhaseActive = true;
      celestePhaseEndTime = currentTime + celestePhaseTime; // Establecer el tiempo de finalización de la fase celeste
    }
  }
  // Fase celeste
  else if (celestePhaseActive) {
    celestes.moving = true; // Establecer la variable "moving" en true durante el turno de "celestes"
    celestes.dibujar();
    celestes.updatePosition();

    // Verificar si ha pasado el tiempo de la fase celeste
    if (currentTime >= celestePhaseEndTime) {
      celestePhaseActive = false;
      celestes.moving = false; // Establecer la variable "moving" en false después del turno de "celestes"
    }
  }
  // Mostrar todas las capas juntas en una posición fija
  else {
    customImage.showImage();
    customImage2.showImage();
    for (let l of lilas) {
      l.draw();
    }
    celestes.dibujar();
  }
}
