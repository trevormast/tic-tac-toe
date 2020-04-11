//= require cable
//= require_self
//= require_tree .

this.App = {};

App.cable = ActionCable.createConsumer();

App.messages = App.cable.subscriptions.create('GamesChannel', {
  received: function(data) {
    return setupTurn(data);
  }
});