$(document).ready(function () {
  Listeners.start();
});

function playTurn(e) {
  $cell = $(e.target).closest('td');
  $cell.empty().append('<i class="fa fa-circle-o fa-5x">');
  $.get('/api/v1/games/' + $('.board').attr('id') + '/play', {cell:$cell.attr('id')})
   .then(updateGame);
}

function updateGame(response) {
  if ('cell' in response) { updateBoard(response.cell); }
  if ('over' in response) { gameOver(response.over); }
}

function gameOver(result) {
  var msg;
  switch (result) {
    case  1: msg = "Circle wins!"; break;
    case  0: msg = "Draw"        ; break;
    case -1: msg = "Cross wins!" ; break;
  }
  $('.board').empty().append('<td class="display-1">' + msg + '</td>');
}

function updateBoard(cell) {
  $('#' + cell).empty().append('<i class="fa fa-times fa-5x">');
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
