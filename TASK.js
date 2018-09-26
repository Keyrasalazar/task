"use strict";

(function ($) {
  var add = document.getElementById("task-box");
  add.addEventListener('change', function () {
    var name = add.value;
    var date = new Date();
    var duedate = date.getFullYear() + '-' + date.getMonth() + '-' + date.getDay();
    var priority = 1;

    if (name !== '') {
      $.ajax({
        url: "../../app/insert.php",
        type: "POST",
        data: Object.assign({
          name: name,
          duedate: duedate,
          priority: priority
        }),
        dataType: 'json',
        success: function success(response) {
          var json = JSON.stringify(response);

          if (json.ok === 200) {
            this.showTask();
          } else if (json.faild === 500) {
            console.log(json.faild);
          }
        },
        error: function error(_error) {
          alert("Ups, Ha ocurrido un error al guardar la nota." + _error);
        }
      });
    } else {
      alert("La caja de texto esta vacia");
    }
  });

  var showTask = function showTask() {
    $.ajax({
      url: "../../app/show.php",
      type: "GET",
      cache: false,
      success: function success(response) {
        var json = JSON.parse(response);
        console.log(json);
      },
      error: function error() {
        alert("Ups, Ha ocurrido un error al guardar la nota.");
      }
    });
  };
})(jQuery);