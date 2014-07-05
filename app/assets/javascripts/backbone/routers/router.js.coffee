class App.Routers.Router extends Backbone.Router

  initialize: =>
    if $('p.notice, p.alert').length > 0
      setTimeout ->
        $('p.notice, p.alert').fadeOut()
      , 2500
    @autoLoad()

  autoLoad: =>
    new App.Views.FormToggle if $('.form-toggle').length > 0

  routes:
    '': 'initHome'

  initHome: =>
    console.log 'Welcome to Venti!'
