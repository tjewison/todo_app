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

@TasksCtrl = ["$scope", "Task", ($scope, Task) ->
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
  ]