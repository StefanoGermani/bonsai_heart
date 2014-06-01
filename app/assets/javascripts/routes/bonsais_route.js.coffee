BonsaiHeart.BonsaisRoute = Ember.Route.extend
  model: ()->
    @store.find 'bonsai'