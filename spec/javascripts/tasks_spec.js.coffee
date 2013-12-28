#= require jquery
#= require jquery_ujs
#= require angular
#= require angular-resource
#= require angular-mocks
#= require tasks


describe "TasksCtrl", ->
  beforeEach angular.mock.module('TodoApp')
  beforeEach inject(($rootScope, $controller) ->
    @scope = $rootScope.$new()
    @ctrl = $controller 'TasksCtrl', $scope: @scope
  )

  it "should be defined", ->
    expect(@ctrl).to.not.be.undefined


  
