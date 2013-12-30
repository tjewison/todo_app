describe 'task homepage', ->
  it 'should add new task', ->
    browser.get('http://0.0.0.0:3000')
    element(select.input('newTask.description')).sendKeys('Test')
    task = element(select.binding('newTask'))
    expect(task.getText()).toEqual('Test')
