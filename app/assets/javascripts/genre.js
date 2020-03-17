$(function(){
  var genre = $(".genre1");
  function appendSelect(Num) {
    if(Num == 1) {
      var select_id = `genre_children`
    } else if(Num == 2) {
      var select_id = `genre_grandchildren`
    }
    var html =
    `<select name="food[genre_id]" id="${select_id}">
        <option value>選択してください</option>
    </select>`
    genre.append(html)
  }
  function appendCat(Option, Num) {
    if (Num == 1) {
      var appendId = $("#genre_children")
    } else if (Num == 2) {
      var appendId = $("#genre_grandchildren")
    }
    appendId.append(
      $("<option>")
        .val($(Option).attr('id'))
        .text($(Option).attr('name'))
    )
  }
  $("#parent-genre").on('change', function() {
    parent = $(this).val()
    $("#genre_children, #genre_grandchildren").remove()
      $.ajax({
        type: "GET",
        url: "/foods/genre",
        data: {parent: parent},
        dataType: 'json',
          error : function(XMLHttpRequest, textStatus, errorThrown) {
          console.log("ajax通信に失敗しました");
          console.log("XMLHttpRequest : " + XMLHttpRequest.status);
          console.log("textStatus     : " + textStatus);
          console.log("errorThrown    : " + errorThrown.message);
      },
      //ajax通信成功
      success : function(response) {
          console.log("ajax通信に成功しました");
          console.log(response);
      }
      })
      .done(function(child) {
        var Num = 1
        appendSelect(Num)
        child.forEach(function(child) {
          appendCat(child, Num)
        })
      })
  })
  $(document).on('change', "#genre_children", function() {
    child = $(this).val()
    $("#genre_grandchildren").remove()
    $.ajax({
      type: "GET",
      url: "/foods/genre",
      data: {child: child},
      dataType: 'json'
    })
    .done(function(grandchild) {
      var Num = 2
      appendSelect(Num)
      grandchild.forEach(function(grandchild) {
        appendCat(grandchild, Num)
      })
    })
  })
})

