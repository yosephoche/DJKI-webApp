$(document).on("change", ".checkbox", function () {
  var listArr = [];
  var inner = "";
  var html = $(".boxImg");
  $(".checkbox:checked").each(function () {
    listArr.push($(this).data());
    var data = $(this).data();
    inner +=
      '<div class="avatar thumb-xs m-r-xs" style="background: url(' +
      data.preview +
      ') center no-repeat; background-size: cover; width: 34px; height: 34px; vertical-align: middle"></div>';
  });
  html.html(inner);
});

$("#pilihan").on('change', function () {
  var select = document.querySelector('#pilihan')
  if (select.value != '2') {
    document.querySelector('#title').style.display = 'block';
    document.querySelector('#image').style.display = 'block';
    document.querySelector('#category').style.display = 'block';
    document.querySelector('#link').style.display = 'block';
    document.querySelector('#linkvid').style.display = 'none';
    document.querySelector('#video').style.display = 'none';
  } else {
    document.querySelector('#title').style.display = 'none';
    document.querySelector('#image').style.display = 'none';
    document.querySelector('#category').style.display = 'block';
    document.querySelector('#link').style.display = 'none';
    document.querySelector('#linkvid').style.display = 'block';
    document.querySelector('#video').style.display = 'block';
  }
});

$(document).ready(function () {

  $(".checkbox").change(function () {
    var listArr = [];
    var inner = "";
    var html = $(".boxImg");
    $(".checkbox:checked").each(function () {
      var data = $(this).data();
      inner +=
        '<div class="avatar thumb-xs m-r-xs" style="background: url(' +
        data.preview +
        ') center no-repeat; background-size: cover; width: 34px; height: 34px; vertical-align: middle"></div>';
    });
    html.html(inner);
  });

  /*Modal delete*/
  $("#modal-delete").on("show.bs.modal", function (e) {
    var id = $(e.relatedTarget).data("id");
    $(this)
      .find('input[name="id"]')
      .val(id);
  });

  /*Nestable*/
  $("#nestable")
    .nestable({
      group: 1,
      maxDepth: 3
    })
    .on("change", function (e) {
      $(".change").show();
      $('button[data-action="collapse"]')
        .parent()
        .find(".dd-list")
        .attr("data-parent", "submenu");
      $('.dd-list[data-parent="submenu"]')
        .find(".dd-list")
        .attr("data-parent", "subsubmenu");
      var IDs = [];
      var parents = [];
      $("#nestable")
        .find("li")
        .each(function () {
          IDs.push(this.id);
          parents.push(
            $(this)
            .parent()
            .data("parent")
          );
        });
      $('input[name="id_menus"]').val(IDs);
      $('input[name="type"]').val(parents);
    });

  /*Modal edit menus*/
  $('#modal-edit-menus').on('show.bs.modal', function (e) {
    var data = $(e.relatedTarget).parents('li').data();
    if (data.submenu) {
      var parent = data.submenu;
    } else if (data.subsubmenu) {
      var parent = data.subsubmenu;
    }
    var status = data.status;
    var flag = data.flaging;
    $(this).find('select[name="parent"]').prop('selectedIndex', 0);
    $(this).find('input[name="id"]').val(data.id);
    $(this).find('input[name="menu_title"]').val(data.title);
    $(this).find('input[name="menu_titleEN"]').val(data.title_eng);
    $(this).find('input[name="url"]').val(data.link);
    $(this).find('select[name="parent"] option[value="' + parent + '"]').prop("selected", true);
    $(this).find('.previewImage_').attr('src', data.preview);

    if (status == true) {
      $('#textarea').html('<div class="form-group"><label>Description</label><div class="form-group"><textarea class="form-control" name="description">' + data.description + '</textarea></div></div>');
      $('#textareaEN').html('<div class="form-group"><label>Description EN</label><div class="form-group"><textarea class="form-control" name="descriptionEN">' + data.description_en + '</textarea></div></div>');
    } else {
      $('#textarea').html('');
      $('#textareaEN').html('');
    }
    /* penentuan checked about, visitor, dan contact */
    if (flag == 0) {
      $('#editnone').prop('checked', true);
      $('#editabout').prop('disabled', true);
    } else if (flag == 1) {
      $('#editabout').prop('checked', true);
      $('#editabout').prop('disabled', false);
    } else if (flag == 2) {
      $('#editvisitor').prop('checked', true);
      $('#editabout').prop('disabled', true);
    } else {
      $('#editcontact').prop('checked', true);
      $('#editabout').prop('disabled', true);

    }
  });

  $('#about').on('click', function () {
    $('#link').val('#');
    $('#link').prop('readonly', true)
  })

  $('#none').on('click', function () {
    $('#link').prop('readonly', false)
  })

  $('#visitor').on('click', function () {
    $('#link').val('#');
    $('#link').prop('readonly', true)
  })

  $('#contact').on('click', function () {
    $('#link').val('#');
    $('#link').prop('readonly', true)
  })

  $("#pinned").change(function () {
    var getData = $(this).val();
    var splitGetData = getData.split("/");
    $.ajax({
      url: 'setting/runningtext/' + splitGetData[1] + '/' + splitGetData[0],
      type: 'get',
      data: {},
      success: function (data) {
        $("#running").val(data.data.title);
        $("#action_type").val(data.action);
        if (data.data.file) {
          $("#linkk").val(data.data.file);
        } else {
          $("#linkk").val(data.data.slug);
        }
      }
    })
  });

  /*Preview post*/
  $("#preview").click(function (e) {
    var data = $("#formPost").serializeArray();
    var iframe = $("#iframePreview").contents();
    var img = $("#previewImage_-").attr("src");
    iframe.find("#titlePreview").html(data[2].value);
    iframe.find("#contentPreview").html(data[3].value);
    iframe.find("#datePreview").html(data[8].value);
    iframe
      .find("#image")
      .attr(
        "style",
        "background:url(" + img + ") no-repeat;background-size:100% 100%;"
      );
  });

  /*Filter media*/
  var $btns = $(".btnFilter").click(function () {
    if (this.id == "all") {
      $(".item").fadeIn(450);
    } else {
      $("." + this.id).fadeIn(450);
      $(".item")
        .not("." + this.id)
        .hide();
    }
    $btns.removeClass("active");
    $(this).addClass("active");
  });

  /* Repeater */
  $(".textarea_customizer").froalaEditor({
    toolbarSticky: false,
    minHeight: 300,
    maxHeight: 400
  });

  /* Add new field */
  $(".addField").click(function (e) {
    e.preventDefault();
    var obj = $(this)
      .parent()
      .find("." + $(this).data("class"));
    var wrapBox = $('<div class="' + $(this).data("class") + '">').insertAfter(
      obj.last()
    );
    var listField = obj.last().children("._desc, ._link ,._images");
    var listShort = obj.length;
    listShort++;

    for (var i = 0; i < listField.length; i++) {
      findClass = $(listField[i])
        .attr("class")
        .split(" ");

      /* Description */
      if (findClass[0] == "_desc") {
        _oldName = $(listField[i]).attr("name");
        _newName = _oldName.replace(/\[([0-9]\d{0})\]/g, "[" + listShort + "]");
        _newEditor = _newName;
        thisAppend =
          "<textarea name='" +
          _newName +
          "' rows='8' cols='80' class='_desc form-control' placeholder='Your Text'></textarea>";
      }

      /* Link */
      if (findClass[0] == "_link") {
        _oldName = $(listField[i]).attr("name");
        _newName = _oldName.replace(/\[([0-9]\d{0})\]/g, "[" + listShort + "]");
        thisAppend =
          "<input type='text' name='" +
          _newName +
          "' class='_link form-control' placeholder='Link Redirect' style='margin-top:10px!important;'>";
      }

      /* Images */
      if (findClass[0] == "_images") {
        _oldID = $(listField[i]).attr("id");
        _oldName = $(listField[i]).attr("name");
        _oldClass = $(listField[i]).attr("class");
        _newName = _oldName.replace(/\[([0-9]\d{0})\]/g, "[" + listShort + "]");
        _newID = _oldID.replace(/\_([0-9]\d{0})\_/g, "_" + listShort + "_");
        _newClass = _oldClass.replace(
          /\_([0-9]\d{0})\_/g,
          "_" + listShort + "_"
        );
        thisAppend =
          "<input type='text' class='_images " +
          _newClass +
          "' placeholder='Click for open media' id='" +
          _newID +
          "' name='" +
          _newName +
          "' data-toggle='modal' data-target='#modal-galleries' style='margin-top:10px!important;'>";
      }

      /* Append in HTML */
      $(thisAppend).appendTo(wrapBox);

      /* Add froala editor in new textarea */
      if (!$('[name="' + _newEditor + '"]').data("froala.editor")) {
        $('[name="' + _newEditor + '"]').froalaEditor({
          toolbarSticky: false,
          minHeight: 300,
          maxHeight: 400
        });
      }
    }
    $(
      '<a href="#" class="badge badge-primary remove_field" style="margin:10px 0px;"></i> Hapus</a></div></div>'
    ).appendTo(wrapBox);
  });

  /* Remove Repeater List */
  $(document).on("click", ".remove_field", function (e) {
    e.preventDefault();
    $(this)
      .parent("div")
      .remove();
  });

  /* Open Media */
  $(document).on("click", ".open_media", function () {
    idTarget = $(this).attr("id");
    $(".selectCustomizer").click(function (event) {
      var valueImg = $(this).data("value");
      $("#" + idTarget).val(valueImg);
      $("#myModal").modal("toggle");
      idTarget = "";
    });
  });

  /* ColorPicker */
  $(".ColorPicker").colorpicker();

  /* Accordion */
  $("#accordion").on("show.bs.collapse", function () {
    $("#accordion .in").collapse("hide");
  });

  /* menuhorizontal----------------------------------------------- */
  $("#nestable2")
    .nestable({
      group: 1,
      maxDepth: 1
    })
    .on("change", function (e) {
      $(".change").show();
      $('button[data-action="collapse"]')
        .parent()
        .find(".dd-list2")
        .attr("data-parent", "submenu");
      $('.dd-list2[data-parent="submenu"]')
        .find(".dd-list2")
        .attr("data-parent", "subsubmenu");
      var IDs = [];
      var parents = [];
      $("#nestable2")
        .find("li")
        .each(function () {
          IDs.push(this.id);
          parents.push(
            $(this)
            .parent()
            .data("parent")
          );
        });
      $('input[name="id_menus"]').val(IDs);
      $('input[name="type"]').val(parents);
    });

  /*Modal edit menus*/
  $('#modal-edit-menus').on('show.bs.modal', function (e) {
    var data = $(e.relatedTarget).parents('li').data();

    if (data.submenu) {
      var parent = data.submenu;
    } else if (data.subsubmenu) {
      var parent = data.subsubmenu;
    }
    var status = data.status;
    $(this).find('select[name="parent"]').prop('selectedIndex', 0);
    $(this).find('input[name="id"]').val(data.id);
    $(this).find('input[name="menu_title"]').val(data.title);
    $(this).find('input[name="menu_titleEN"]').val(data.title_eng);
    $(this).find('input[name="url"]').val(data.link);
    $(this).find('select[name="parent"] option[value="' + parent + '"]').prop("selected", true);
    $(this).find('.previewImage_').attr('src', data.preview);
    if (status == true) {
      $('#textarea').html('<div class="form-group"><label>Description</label><div class="form-group"><textarea class="form-control" name="description">' + data.description + '</textarea></div></div>');
      $('#textareaEN').html('<div class="form-group"><label>Description EN</label><div class="form-group"><textarea class="form-control" name="descriptionEN">' + data.description_en + '</textarea></div></div>');
    } else {
      $('#textarea').html('');
      $('#textareaEN').html('');
    }
  });

  $('#modal-edit-menus2').on('show.bs.modal', function (e) {
    var data = $(e.relatedTarget).parents('li').data();

    $(this).find('input[name="menu_title"]').val(data.title);
    $(this).find('input[name="menu_titleEN"]').val(data.title_eng);
    $(this).find('input[name="idm"]').val(data.id_menu);
    $(this).find('input[name="id"]').val(data.id);
    $(this).find('input[name="id_menus"]').val(data.link);
  });
  /* end menuhorizontal----------------------------------------------------------- */
});