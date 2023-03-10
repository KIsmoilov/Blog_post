// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

var noticeMessage = document.querySelector("#notice_message");

setTimeout(function () {
  noticeMessage.style.display = "none";
}, 2000);
