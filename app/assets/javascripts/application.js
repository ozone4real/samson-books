// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory can be referenced here using a relative path.
//= require_tree .

document.addEventListener("DOMContentLoaded", () => {

  confirmOnClick = () => {
    const buttons = document.querySelectorAll("[data-confirm]")
    buttons.forEach((button) => {
      button.onclick = () => confirm(button.dataset.confirm);
    })
  }

  confirmOnClick()
})