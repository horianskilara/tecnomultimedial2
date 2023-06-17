let mic; // Variable para almacenar el objeto de micrófono
let images = []; // Array para almacenar las imágenes
let imageX = []; // Array para almacenar las posiciones en el eje X de las imágenes
let imageY = []; // Array para almacenar las posiciones en el eje Y de las imágenes
const moveSpeed = 1; // Velocidad de movimiento inicial de las imágenes
const thresholdLow = 0.1; // Umbral de volumen bajo
const thresholdHigh = 0.5; // Umbral de volumen alto
const minMoveSpeed = 0.1; // Velocidad mínima de movimiento de las imágenes
const maxMoveSpeed = 3; // Velocidad máxima de movimiento de las imágenes
const moveAmountY = 0.5; // Cantidad de movimiento vertical

function preload() {
  for (let i = 0; i < 5; i++) {
    images[i] = loadImage("data/rayas amarillas/amarillas" + nf(i, 2) + ".png");
  }
}

function setup() {
  createCanvas(800, 800);

  // Inicializar el objeto de micrófono
  mic = new p5.AudioIn();
  mic.start();

  // Inicializar las posiciones de las imágenes
  for (let i = 0; i < images.length; i++) {
    imageX[i] = random(width - images[i].width);
    imageY[i] = random(height - images[i].height);
  }
}

function draw() {
  background(220);

  // Obtener el nivel de amplitud de la entrada de voz
  let level = mic.getLevel();

  // Determinar la dirección y velocidad del movimiento horizontal
  let moveDirectionX = 0;
  let moveSpeedX = minMoveSpeed;

  if (level > thresholdHigh) {
    moveDirectionX = 1; // Mover a la derecha
    moveSpeedX = map(level, thresholdHigh, 1, minMoveSpeed, maxMoveSpeed);
  } else if (level < thresholdLow) {
    moveDirectionX = -1; // Mover a la izquierda
    moveSpeedX = map(level, 0, thresholdLow, maxMoveSpeed, minMoveSpeed);
  }

  // Determinar la dirección y velocidad del movimiento vertical
  let moveDirectionY = -1; // Mover hacia arriba
  let moveSpeedY = minMoveSpeed + map(level, thresholdLow, thresholdHigh, 0, moveAmountY);

  // Mover las imágenes en la dirección y velocidad determinadas
  for (let i = 0; i < images.length; i++) {
    imageX[i] += moveSpeedX * moveDirectionX;
    imageY[i] -= moveSpeedY * moveDirectionY;

    // Limitar las posiciones en los ejes X e Y dentro del canvas
    imageX[i] = constrain(imageX[i], 0, width - images[i].width);
    imageY[i] = constrain(imageY[i], 0, height - images[i].height);

    // Mostrar la imagen en la posición actualizada
    image(images[i], imageX[i], imageY[i]);
  }
}

// Habilitar el micrófono en respuesta a una acción del usuario
function mouseClicked() {
  if (getAudioContext().state !== 'running') {
    getAudioContext().resume();
  }
}


