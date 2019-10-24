(function ($) {
  "use strict";
  var fn = {

    // Launch Functions
    Launch: function () {
      fn.Apps();
      fn.SearchWheel();
      fn.Quill();
      //fn.Header();
      fn.Headmap();
      fn.OrdersSelect();
    },

    Header: function (){
      $("header").Headroom({
        tolerance : 0
      });
    },

    Quill: function (){

      var e = document.querySelectorAll('[class="quill_container"]');
      console.log(e);
      //
      // var options = {
      //   placeholder: 'Compose an epic...',
      //   readOnly: true,
      //   theme: 'snow'
      // };
      // var editor = new Quill('[class="quill_container"]', options);


      "undefined" != typeof Quill && e && [].forEach.call(e, function(e) {
          ! function(e) {
              var t = e.dataset.options;
              t = t ? JSON.parse(t) : {};
              var a = Object.assign(t, {
                  modules: {
                      toolbar: [
                          ["bold", "italic"],
                          ["link", "blockquote", "code", "image"],
                          [{
                              list: "ordered"
                          }, {
                              list: "bullet"
                          }]
                      ]
                  },
                  theme: "snow"
              });
              new Quill(e, a)
          }(e)
      })
    },

    Headmap: function() {

      if ($('#cal-heatmap').length > 0) {
        var cal = new CalHeatMap();
        var dt = new Date();
        cal.init({
        	domain: "month",
        	data: "assets/datas-years.json",
        	start: new Date(2019, 0),
        	cellSize: 12,
        	range: 12,
          highlight: ["now", dt]
        });
      }
    },

    SearchWheel: function() {
      var currentRow = 0;
      $("#searchInput").on('mousewheel', function(event) {
          currentRow += event.deltaY;
          $("#resultRow").html(currentRow);
      });
    },

    // Apps
    Apps: function () {

      // Navbar Nested Dropdowns
      $('.dropdown-menu a.dropdown-toggle').on('click', function(e) {
        var a = $(this);

        if (!a.next().hasClass('show')) {
          a.parents('.dropdown-menu').first().find('.show').removeClass("show");
        }

        var $subMenu = a.next(".dropdown-menu");
        $subMenu.toggleClass('show');

        a.parents('li.nav-item.dropdown.show').on('hidden.bs.dropdown', function(e) {
          $('.dropdown-submenu .show').removeClass("show");
        });

        return false;
      });

      // Tooltips
      $('[data-toggle="tooltip"]').tooltip();

      // $('body').tooltip({
      //   selector: '[data-toggle="tooltip"]',
      //   container: 'body'
      // }); // Activate popovers

      $('body').popover({
        selector: '[data-toggle="popover"]',
        container: 'body'
      }); // Activate toasts

      $('.toast').toast();

    },

    OrdersSelect: function() {
      var e = document.querySelectorAll('[name="ordersSelect"]'),
          t = document.getElementById("ordersSelectAll");

      e && t && t.addEventListener("change", function() {

          ! function(t) {
              [].forEach.call(e, function(e) {
                  e.checked = t.checked
              })
          }(this)
      });
    }
  };

  $(document).ready(function () {
    fn.Launch();
  });

})(jQuery);
