$(document).ready(function () {
  Listeners.start();
});

function startGame(e) {
  var size = e.target.dataset.size;
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
