# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app = angular.module("TodoApp", ["ngResource"])

@TasksCtrl = ($scope, $resource) ->
  Task = $resource("/task_entries/:id.json", {id: "@id"}, {update: {method: "PUT"}})
  $scope.tasks = Task.query()
  $scope.addTask = ->
    task = Task.save($scope.newTask)
    $scope.tasks.push(task)
    $scope.newTask = {}