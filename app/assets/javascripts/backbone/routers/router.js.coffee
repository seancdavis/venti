class App.Routers.Router extends Backbone.Router

  initialize: =>
    @autoLoad()

  autoLoad: =>
    new App.Views.FormToggle if $('.form-toggle').length > 0

  routes:
    '': 'initHome'

  initHome: =>
    console.log 'Welcome to Venti!'
