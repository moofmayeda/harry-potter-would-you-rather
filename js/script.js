var data = [{choice: "Thing 1", count: 0},
            {choice: "Thing 2", count: 0},
            {choice: "Thing 3", count: 0}]

$(document).ready(function() {
  $("#left-choice").text(data[0].choice);
  $("#right-choice").text(data[2].choice);
  $("#left-button-text").text(data[0].count);
  $("#right-button-text").text(data[2].count);
});