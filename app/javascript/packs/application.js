// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import $ from "jquery"
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import "channels"
import 'select2'
import 'select2/dist/css/select2.css'
import "cocoon"

Rails.start()
Turbolinks.start()

require("jquery")

document.addEventListener('turbolinks:load', () => {
  $('.js-select').select2({
    placeholder: '食材を選択',
    allowClear: true,
    width: '1000px'
  })
})

$(function() {
  function readURL(input) {
      if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
  $('#img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
      }
  }
  $("#recipe_img").change(function(){
      readURL(this);
  });
});