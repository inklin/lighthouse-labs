$(function() {

  var clientid = "dcda051130e84d529283c5b1f6d66b73";
  var access_token = "1768635.dcda051.d95b1f96666a4974a657374a1230386b";
  var num_photos = 4;

  var photos = $.ajax({
    url: "https://api.instagram.com/v1/users/self/media/recent/?access_token=" + access_token,
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
    addNewContact: function(contact){
      handler.renderContact(0, contact);
      $("#contact-form").trigger("reset");
    },
    getContact: function(button){
      return $(button).closest(".contact");
    }
  }

  // Search contacts
  $("#search-btn").on("click", function(){
    var search = { search: $("#search").val() };

    $.get("/contacts", search, function(contacts){
      handler.receiveContacts(contacts);
    });
  });

  // Show Contacts
  $("#load-btn").on("click", function(){
    $.getJSON("/contacts", handler.receiveContacts);
  });

  // Add Contact
  $("#contact-form").on("submit", function(evt){
    evt.preventDefault();
    var new_contact = $(this).serialize();

    $.post("/contacts", new_contact, handler.addNewContact);
  });

  // Delete Contact
  $(".contacts-container").on("click", ".delete-btn", function(){
    var btn = $(this);
    var contact = handler.getContact(btn);
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
