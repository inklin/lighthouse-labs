$(function() {

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
