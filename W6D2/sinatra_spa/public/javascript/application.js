$(function() {

  var clientid = "dcda051130e84d529283c5b1f6d66b73";
  var access_token = "1768635.dcda051.d95b1f96666a4974a657374a1230386b";
  var num_photos = 3;

  var photos = $.ajax({
    url: "https://api.instagram.com/v1/tags/lighthouse/media/recent?access_token=" + access_token,
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
      var contact = $.parseJSON(contact);
      handler.renderContact(0, contact);
      $("#contact-form").trigger("reset");
    }
  }

  $.getJSON("/contacts", handler.receiveContacts);

  // Search contacts
  // $("#search-btn").on("click", function(){
  //   var search = { search: $("#search").val() };
  //   $.getJSON("/contacts", search, handler.receiveContacts);
  // });

  // Use live search field
  $("#search-field").on("keyup", function(){
    var term = $(this).val().trim();

    if (term.length == 0){
      return;
    }

    var allContacts = $("tr.contact");
    allContacts.each(function(index, contact){
      var contactRow = $(contact);

      if (contactRow.is(":contains('" + term + "')")){
        contactRow.fadeIn();
      } else {
        contactRow.fadeOut();
      }
    })
  });

  // Show Contacts
  $("#load-btn").on("click", function(){
    $("#contact-table").removeClass('hidden');
  });

  // Add Contact
  $("#contact-form").on("submit", function(evt){
    evt.preventDefault();
    var new_contact = $(this).serialize();
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
