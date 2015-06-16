var data = ["thing 1", "thing 2", "thing 3"];

var Choice = {
  initialize: function(name) {
    this.name = name;
    this.count = 0;
  },
  create: function(name) {
    var choice = Object.create(Choice);
    choice.initialize(name);
    return choice;
  },
  increaseCount: function() {
    this.count ++;
  }
};

var Round = {
  initialize: function(choices) {
    var num1 = Math.floor(Math.random() * choices.length);
    var choice1 = choices[num1];
    var ejected = choices.splice(num1, 1);
    var choice2 = choices[Math.floor(Math.random() * choices.length)];
    this.choice1 = choice1;
    this.choice2 = choice2;
    choices.push(ejected[0]);
  },
  create: function(choices) {
    var round = Object.create(Round);
    round.initialize(choices);
    return round;
  }
};

var Game = {
  initialize: function() {
    var choices = [];
    data.forEach(function(choice) {
      choices.push(Choice.create(choice));
    });
    this.choices = choices;
    this.round = Round.create(choices);
  },
  create: function() {
    var game = Object.create(Game);
    game.initialize();
    return game;
  }
};


$(document).ready(function() {
  newGame = Game.create();
  $("#left-choice").text(newGame.round.choice1.name);
  $("#right-choice").text(newGame.round.choice2.name);
  $("#left-button-text").text(newGame.round.choice1.count);
  $("#right-button-text").text(newGame.round.choice2.count);
  $(".left-button").click(function() {
    newGame.round.choice1.increaseCount();
  });
  $(".right-button").click(function() {
    newGame.round.choice2.increaseCount();
  });
});