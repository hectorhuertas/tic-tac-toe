$(document).ready(function () {
  Listeners.start();
  renderBoard({game:{size:4}}); //for easier development
});

function playTurn(e) {
  $cell = $(e.target).closest('td');
  $cell.empty().append('<i class="fa fa-circle-o fa-5x">');
  $.get('/api/v1/games/' + $('.board').attr('id') + '/play', {cell:'01'})
   .then(updateBoard);
}

function updateBoard(response) {
  $('#' + response.cell).empty().append('<i class="fa fa-times fa-5x">');
}

function startGame(e) {
  $.post('/api/v1/games', {game: {size:3}})
   .then(renderBoard);
}

function renderBoard(e) {
  var size = e.game.size;
  var id = e.game.id;
  var html = "";

  for (var i = 0; i < size; i++) {
    html = html + '<tr>';
    for (var j = 0; j < size; j++) {
      html = html + '<td id="' + i + j + '"><i style="visibility:hidden" class="fa fa-circle-o fa-5x"></td>';
    }

    html = html + '</tr>';
  }
  $('.board').attr('id', id).empty().append(html);
}
