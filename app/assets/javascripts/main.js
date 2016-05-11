$(document).ready(function () {
  Listeners.start();
});

function startGame(e) {
  var size = e.target.dataset.size;
  console.log(size);
}
