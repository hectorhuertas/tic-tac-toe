$(document).ready(function () {
  Listeners.start();
  renderBoard({game:{size:4}}); //for easier development
});

function playTurn(e) {
  $(e.target).closest('td').empty().append('<i class="fa fa-circle-o fa-5x">');
}

function startGame(e) {
  $.get('/api/v1/games/new')
   .then(renderBoard);
}

function renderBoard(e) {
  var size = e.game.size;
  var html = "";

  for (var i = 0; i < size; i++) {
    html = html + '<tr>';
    for (var j = 0; j < size; j++) {
      html = html + '<td><i style="visibility:hidden" class="fa fa-circle-o fa-5x"></td>';
    }

    html = html + '</tr>';
  }
  $('#board').empty().append(html);
}
