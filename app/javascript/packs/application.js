// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import $ from "jquery"
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import "channels"

Rails.start()
Turbolinks.start()

require("jquery")

import 'select2'
import 'select2/dist/css/select2.css'

document.addEventListener('turbolinks:load', () => {
  $('.js-select').select2({
    placeholder: 'Select an option',
    allowClear: true,
    width: 'auto'
  })
})