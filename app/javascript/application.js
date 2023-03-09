// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

var alertMessage = document.getElementById("alert_message");
var noticeMessage = document.getElementById("notice_message");

setTimeout(function () {
  noticeMessage.style.display = "none";
}, 2000);

setTime(function () {
  alertMessage.style.display = "none";
}, 2000);
