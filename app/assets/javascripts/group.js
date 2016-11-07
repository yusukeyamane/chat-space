$(document).on('turbolinks:load', function(){
  var pre_data;
   $.ajaxSetup({
    beforeSend: function(xhr) {
      xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
    }
  });

  function searchUser(data) {
    $.ajax("/users.json", {
      type: "GET",
      data: {
        name: input_data
      },
      success: function(data) {
        for (var i = 0; i < data.length; i++) {
          var insertHtml = buildHtml(data[i]);
          $("#user-search-result").append(insertHtml);
        }
      },
      error: function(errormessage) {
      }
    });
    pre_data = input_data;
  }

  function buildHtml(user) {
    var html =
      '<div class="chat-group-users">' +
        '<div class="chat-group-user">' +
          '<p class="chat-group-user__name">' +
            user.name +
          '</p>' +
          '<a class="user-search-remove chat-group-user__btn chat-group-user__btn--add"' + "data-user-id=" + user.id + '>' +
            '追加' +
          '</a>' +
        '</div>' +
      '</div>';
    return html
    }

  $("input#name").on("change keyup", function() {
    input_data = $(this).val();
    if (pre_data != input_data && input_data.length != '') {
      $("#user-search-result .chat-group-user").remove();
      searchUser(input_data);
    }
  });

  $ (".chat-group-user__btn--remove").on("click", function() {
  });
});
