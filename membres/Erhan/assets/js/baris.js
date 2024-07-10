window.onload = function () {
    document.querySelector('.cont_modal').className = "cont_modal";
  }
  
  let c = 0;
  function open_close() {
    document.querySelector('.cont_modal').className =
      c % 2 == 0 ? "cont_modal cont_modal_active" : "cont_modal";
    c++;
  }
  