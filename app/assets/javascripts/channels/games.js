//= require cable
//= require_self
//= require_tree .

this.App = {};

App.cable = ActionCable.createConsumer();

App.messages = App.cable.subscriptions.create('GamesChannel', {
  received: function(data) {
    setupTurn(data);

    if (data.winning_token === 'X' || data.winning_token === "O") { alert(data.winning_token + ' Wins!'); }
  }
});