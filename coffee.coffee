

checkmark = document.createElement "span"
checkmark.innerHTML = "✓";
checkmark.className = "check";

x = document.createElement "span"
x.innerHTML = "✗"
x.className = "uncheck"

input = document.querySelector "#text1"
form = document.querySelector ".form"
niz = []

class Add
  constructor : ->
    @input = document.querySelector "#text1"
    @ul = document.querySelector ".add"


  Add.prototype = {
    constructor : add,
    appendToDom : () ->
      i = 0
      while (i < localStorage.length)
        key = localStorage.key(i)
        values = localStorage.getItem(key)
        $('.add').append(
          $('<li>').text(values.substr 2).append(
            $("<span>").attr("class", "check").text("✓")).append($('<span>').attr('class', "uncheck").text("✗")));
        i++


      add.hmmmm()


    createLocalStorage : () ->


      $(".uncheck").on "click", (e) ->
        i = 0
        while (i < localStorage.length)
          key = localStorage.key(i)
          values = localStorage.getItem(key)
          if values is $(@).parents().text()
            localStorage.removeItem("note" + key.slice(4, 6))
          i++

    hmmmm : () ->

      $(".uncheck").click ->
        $(@).parent().remove();
        i = 0
        while (i < localStorage.length)
          key = localStorage.key(i)
          values = localStorage.getItem(key)
          console.log values.slice(2)
          console.log $(@).parents().text().replace("✓", "").replace("✗", "")
          if values.slice(2) is $(@).parents().text().replace("✓", "").replace("✗", "")
            localStorage.removeItem("note" + key.slice(4, 6))
          i++


      $("li").find(".check").on "click", (e) ->
        $(@).css "color", "green"
        e.target.parentNode.style.textDecoration = "line-through"
        $(@).next().css "color", "red"




    createView : () ->
      t = @;
      ul = t.ul;
      note = document.createElement "li";
      r = document.createTextNode(add.input.value);
      checkmark = document.createElement "span"
      checkmark.innerHTML = "✓";
      checkmark.className = "check";

      x = document.createElement "span"
      x.innerHTML = "✗"
      x.className = "uncheck"
      localStorage.setItem("note" + localStorage.length, $(checkmark).text() + $(x).text() + add.input.value);
      ul.appendChild(note)
      note.appendChild(checkmark);
      note.appendChild(x)
      note.appendChild(r);

      add.hmmmm()
      add.createLocalStorage()


    onEnter : (e) ->
      if e.keyCode is 13 and add.input.value isnt ""
        e.preventDefault()
        add.createView()
        if add.input.value isnt null
          add.input.value = null


      return




  }


  add = new Add()
  add.createLocalStorage()
  add.input.addEventListener("keypress", add.onEnter, false);
  window.onload = add.appendToDom()


