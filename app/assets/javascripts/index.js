$(function() {

  function appendUser(user) {
    var chat_list = $('#user-search-result');
    var html = `<div class="chat-group-user clearfix">
                  <p class="chat-group-user__name">${user.name}</p>
                  <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</a>
                </div>`
    chat_list.append(html);
  }

  function appendMember(user_id,user_name) {
    var member_list = $('#chat-group-users');
    var html = `<div class = "chat-group-user clearfix">
                  <input name = "group[user_ids][]" type = "hidden" value = "${ user_id }" ></input>
                  <p class = "chat-group-user__name">${ user_name }</p>
                  <a class = "user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn">削除</a>
               </div>`
    member_list.append(html);
  }

  $(".chat-group-form__input").on("keyup", function(e) {
    var input = $("#user-search-field").val();

    $.ajax({
      type: 'GET',
      url: '/users',
      data: { keyword: input },
      dataType: 'json'
    })

    .done(function(users) {
      $("#user-search-result").empty();
      if (users.length !==0) {
        users.forEach(function(user) {
          appendUser(user);
        });
      }
      else{
        appendNoUser("一致する名前はありません");
      }
    })
    .fail(function() {
      alert('メンバー検索に失敗しました');
    });

    $(document).on('click','user-search-add',function() {
      var user_id = $(this).attr("data-user-id");
      var user_name = $(this).attr("data-user-name");
      $(this).parent().remove();
      appendMember(user_id,user_name)
    });
      $(document).on('click','.user-search-remove',function(){
        $(this).parent().remove();
      })
  });
});
