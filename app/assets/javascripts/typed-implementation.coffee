ready = ->
  new Typed '.element',
    strings: [
      'This is the home page of my portfolio built in Ruby and Ruby on Rails(RoR) 5.',
      'Other web technologies such as: HTML, CSS, Bootstrap 4, and JavaScript were also used.'
    ]
    typeSpeed: 20
  return

$(document).ready ready
$(document).on 'turbolinks:load', ready