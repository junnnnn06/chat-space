$(function() {
  function buildHTML(message) {
    var html = `<ul>
                  <li>
                    <p class = "middle_content__name", data_message_id="#{message.id}">${message.name}
                    </p>
                    <p class = "middle_content__date">${message.date}
                    </p>
                    <p class = "middle_content__messages">${message.body}
                    </p>
                  </li>
                </ul>`
    return html;
  }
  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      processData: false,
      contentType: false,
      dataType: 'json'
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.middle_content').append(html);
      $('.field-label__input').val('');
      $('.middle_content').animate({scrollTop: $('.middle_content')[0].scrollHeight}, 'slow');
    })
    .fail(function() {
      alert('エラーが発生しました');
    })
  })




  var interval = setInterval(function() {
  if (window.location.href.match(/\/groups\/\d+\/messages/)) {
    $.ajax({
      url: location.href,
      type: "GET",
      dataType: 'json'
    })
    .done(function(messages) {
      var id = $('.middle_content:last').attr('data_message_id');
      var insertHTML = '';
      messages.forEach(function(massage) {
        if(message.id > id) {
          insertHTML += buildHTML(message);
        }
      });
      $('.middle_content').append(insertHTML);
      $('.middle_content').animate({scrollTop: $('.middle_content')[0].scrollHeight}, 'slow');
    })
    .fail(function() {
      alert('エラーが発生しています');
    });
    } else {
      clearInterval(interval);
    }
   }, 5000);
  });








