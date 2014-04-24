# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

  $.ajax
    url: "/todos"
    dataType: "json"
    method: "get"
    error: ->
      alert("Sorry tasks couldn't be loaded try again")
    success: (data)->
      for task in data
        $task = $("<li>", {text: task.title})
        $("ul.tasks").append($task)

  $("#new-task").submit ->
    task_title = $(@).children("#title").val()
    $.ajax
      url: $(@).attr("action")
      dataType: "json"
      method: "post"
      data:
        todo:
          title: task_title

      complete: ->
      error: ->
        alert("error")
      success: (data)->
        if data.success
          $li = $("<li>", {text: data.title})
          $("ul.tasks").append($li)
          $("#title").val("")
        else
          alert(data.errors)

    false
