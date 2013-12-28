# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app = angular.module("TodoApp", ["ngResource"])
app.factory "Task", ["$resource", ($resource) -> 
  $resource("/task_entries/:id.json", 
    {id: "@id"}, 
    {update: {method: "PUT", transformRequest: (data,headersGetter) -> 
      delete data.id
      delete data.created_at
      delete data.updated_at
      JSON.stringify(data)
    }})]

app.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

app.controller('TasksCtrl', ["$scope", "Task", ($scope, Task) ->
  $scope.tasks = Task.query()
  $scope.addTask = ->
    task = Task.save $scope.newTask, -> 
      $scope.tasks.push(task)
      $scope.newTask = {}

  $scope.toggleCompleteTask = (task) ->
    task.completed = !task.completed
    task.$update()
    task.$get()

  $scope.updateAt = (task) ->
    new Date(task.updated_at)

  $scope.deleteTask = (task, confirm = false) ->
    if confirm || window.confirm("Are you sure you want to delete the task:\n#{task.description}?")
      $scope.tasks = _.without($scope.tasks, task)
      task.$remove() 

  $scope.deleteAll = ->
    if window.confirm("Are you sure you want to delete ALL tasks?")
      $scope.tasks.forEach (value, key) -> $scope.deleteTask(value, true)

  $scope.deleteCompleted = ->
    if window.confirm("Are you sure you want to delete all completed tasks?")
      $scope.tasks.forEach (value, key) -> $scope.deleteTask(value, true) if value.completed
])

