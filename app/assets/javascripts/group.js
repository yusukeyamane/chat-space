$(document).on('turbolinks:load', function(){
  var pre_data;
   $.ajaxSetup({
    beforeSend: function(xhr) {
      xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
    }
  });

  function buildchatMemberHtml(id, name) {
    var html =
        '<div class="chat-group-user"  id="chat-group-user-' + id + '">' +
          '<input name="group[user_ids][]", type="hidden" value="' + id + '"' + '>' +
          '<p class="chat-group-user__name">' +
            name +
          '</p>' +
          '<a class="user-search-remove chat-group-user__btn chat-group-user__btn--remove"' + "data-user-id=" + id + '>' +
            '削除' +
          '</a>' +
      '</div>';
    return html
  }

  function buildHtml(user) {
    var html =
      '<div class="chat-group-user" id="search_user-' + user.id + '"' + '>' +
          '<p class="chat-group-user__name">' +
            user.name +
          '</p>' +
          '<a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="' + user.id + '" data-user-name="' + user.name + '">追加' +
          '</a>' +
      '</div>';
    return html
  }

  function searchUser() {
    $.ajax("/users.json", {
      type: "GET",
      data: {
        name: input_data
      },
      success: function(data) {
        var insertHtml = '';
        $.each(data, function(i, user){
          insertHtml += buildHtml(user);
        });
        $("#user-search-result").html(insertHtml);
      },
      error: function(errormessage) {
      }
    });
    pre_data = input_data;
  }

  $("input#name").on("change keyup", function() {
    input_data = $(this).val();
    if (pre_data != input_data && input_data.length != 0) {
      searchUser();
    }
  });

  $("#group_member").on("click", ".chat-group-user__btn--remove", function(e) {
    e.preventDefault();
    user_id = $(this).data("user-id");
    $("#chat-group-user-" + user_id).remove();
  });

  $("#user-search-result").on("click", '.user-search-add', function(e) {
    e.preventDefault();
    user_id = $(this).data("user-id");
    user_name = ($(this).data("user-name"));
    var insertHtml = buildchatMemberHtml(user_id, user_name);
    $("#group_member").append(insertHtml);
    $("#search_user-" + user_id).remove();
  });
});
