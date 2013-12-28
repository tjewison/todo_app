#= require jquery
#= require jquery_ujs
#= require underscore
#= require angular
#= require angular-resource
#= require angular-mocks
#= require tasks


describe "TasksCtrl", ->
  beforeEach angular.mock.module('TodoApp')
  beforeEach inject ($injector) -> 
    @httpBackend = $injector.get('$httpBackend')
    @httpBackend.when('GET', '/task_entries.json').respond([
      {
        "id": 25,
        "description": "Task 1",
        "completed": false,
        "created_at": "2013-12-21T18:52:37.000Z",
        "updated_at": "2013-12-21T18:52:37.000Z",
        "url": "http://0.0.0.0:3000/task_entries/25.json"
      },
      {
        "id": 26,
        "description": "Task 2",
        "completed": true,
        "created_at": "2013-12-21T18:52:39.000Z",
        "updated_at": "2013-12-21T18:53:05.000Z",
        "url": "http://0.0.0.0:3000/task_entries/26.json"
      }])
    @httpBackend.when('POST', '/task_entries.json').respond({})

    @rootScope = $injector.get('$rootScope')
    $controller = $injector.get('$controller')

    @createController = =>
      $controller('TasksCtrl', {'$scope' : @rootScope });

  afterEach ->
    @httpBackend.verifyNoOutstandingExpectation()
    @httpBackend.verifyNoOutstandingRequest()


  it('should fetch tasks', ->
    @httpBackend.expectGET('/task_entries.json')
    controller = @createController()
    @httpBackend.flush()
  )

  it('should have tasks', ->
    @httpBackend.expectGET('/task_entries.json')
    controller = @createController()
    @httpBackend.flush()
    @rootScope.tasks.length.should.equal(2)
  )

  it('should add new tasks', -> 
    @httpBackend.expectPOST('/task_entries.json')
    controller = @createController()
    @rootScope.newTask = {"description": "test", "completed":false}
    @rootScope.addTask()
    @httpBackend.flush()

  )

