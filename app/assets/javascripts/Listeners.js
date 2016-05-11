var Listeners = (function () {
  var start = function () {
    $('.start-game').on('click', startGame);
    $('#board').on('click', 'td', playTurn);
  };

  return {
    start: start
  };
})();
