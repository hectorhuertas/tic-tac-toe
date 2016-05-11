var Listeners = (function () {
  var start = function () {
    $('.start-game').on('click', startGame);
  };

  return {
    start: start
  };
})();
