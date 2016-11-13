$(document).on('turbolinks:load', function(){

  function autoload() {
    var group_id = $(this).find('#chat_group_id').prop('value');
      $.ajax(document.location.href + ".json", {
      type: "GET",
      data: { chat: {
                group_id: group_id
              }
            },
        success: function() {
          goBottom();
        },
        error: function(errormessage) {
          alert();
        }
      });
    };

  function buildHtml(message) {
    var html =
      '<li class="chat-view__messages__contents__list">' +
      '<div class="chat-view__messages__contents__list__header">' +
      '<p class="chat-view__messages__contents__list__header-user-name">' +
      message.user.name +
      '</p>' +
      '<p class="chat-view__messages__contents__list__header-post-time">' +
      message.created_at +
      '</p>' +
      '</div>' +
      '<p class="chat-view__messages__contents__list__body">' +
      message.body +
      '</p>' +
      '</li>';
    return html
  }

  function goBottom() {
    $('.chat-view__messages').scrollTop( $('.chat-view__messages__contents').height());
  }

  goBottom();
  setInterval(function(){
    autoload();
  }, 1000);

  $("#new_chat").on('submit', function(e) {
    e.preventDefault();
    var message = $(this).find('#chat_body').prop('value');
    var group_id = $(this).find('#chat_group_id').prop('value');

  $.ajax(document.location.href + ".json", {
      type: "POST",
      data: { chat: {
                body: message,
                group_id: group_id
              }
            },
      success: function(data) {
        var inserthtml = buildHtml(data);
        $("ul.chat-view__messages__contents").append(inserthtml);
        $('input#chat_body').val("")
        goBottom();
      },
      error: function(errormessage) {
      }
    });
  });
});
