require ("action_cable")
require ("self")
require ("tree/channels")
(function() {
    this.App || (this.App = {});
  
    App.cable = ActionCable.createConsumer();
  
  }).call(this);