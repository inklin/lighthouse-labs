$(function() {

  var clientid = "dcda051130e84d529283c5b1f6d66b73";
  var access_token = "4436356.1fb234f.f2c29a59d1a74989bc8fce8d6eac8e4b";
  var num_photos = 5;
  var instagram_tag = "vancouvermountains";

  var photos = $.ajax({
    url: "https://api.instagram.com/v1/tags/" + instagram_tag + "/media/recent?access_token=" + access_token,
    dataType: 'jsonp',
    type: 'GET',
    data: {client_id: clientid, count: num_photos},
    success: function(data){
      $.each(data.data, function(index, photo){
        $("#photos-container").append("<img src='" + photo.images.thumbnail.url + "' />");
      })
    }
  });

  var contactTemplate = $("#contact-template").html();

  var handler = {
    contacts: $(".contacts-container"),
    renderContact: function(index, contact){
      var contactHTML = Mustache.to_html(contactTemplate, contact);
      handler.contacts.append(contactHTML);
    },
    receiveContacts: function(contacts) {
      handler.contacts.empty();
      $.each(contacts, handler.renderContact)
    },
    addNewContactToTable: function(contact_json){
      var contact = $.parseJSON(contact_json);
      handler.renderContact(0, contact);
      $("#contact-form").trigger("reset");
    }
  }

  // Load contacts on the page
  $.getJSON("/contacts", handler.receiveContacts);

  // Use live search field
  $("#search-field").on("keyup", function(){
    var term = $(this).val().trim();
    var allContacts = $("tr.contact");

    if (term.length == 0){
      allContacts.fadeIn();
      return;
    }

    allContacts.each(function(index, contact){
      var contactRow = $(contact);

      if (contactRow.is(":contains('" + term + "')")){
        contactRow.fadeIn();
      } else {
        contactRow.fadeOut();
      }
    })
  });

  // Add Contact
  $("#contact-form").on("submit", function(evt){
    evt.preventDefault();
    var new_contact = $(this).serialize();
    console.log("adding contactTemplate");
    $.post("/contacts", new_contact, handler.addNewContactToTable);
  });
  
  // Delete Contact
  $(".contacts-container").on("click", ".delete-btn", function(){
    var btn = $(this);
    var contact = btn.closest(".contact")
    var id = contact.attr("id");

    $.ajax({
      url: "/contacts/" + id,
      type: "DELETE",
      success: function(){
        contact.remove();
      }
    })
  });

});
