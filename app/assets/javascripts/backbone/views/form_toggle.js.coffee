class App.Views.FormToggle extends Backbone.View

  el: 'body'

  events:
    'click .form-toggle': 'toggleForm'

  toggleForm: (e) =>
    e.preventDefault()
    form = $(e.target).data('form')
    if $(e.target).hasClass('active')
      $(e.target).html "#{form.replace(/\-/g, ' ')}"
    else
      $(e.target).html "hide form"
    $(e.target).toggleClass('active')
    $(".form[data-form='#{form}']").toggle()
