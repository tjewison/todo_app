describe('angularjs homepage', function() {
  it('should add new task', function() {
    browser.get('http://0.0.0.0:3000');

    element(by.model('newTask')).sendKeys({'description':'Test' });

    var task = element(by.binding('newTask'));

    expect(task.getText()).toEqual('Test');
  });
});