## Blocmetrics API Project, via [Bloc.io](http://www.bloc.io)

There's an API for apps to register themselves with Blocmetrics, and send events.

There's even an analytics section

If you want to test the api messaging, add this bit of javascript to a web app:

```javascript
var btn1 = document.getElementById("api_btn")

btn1.addEventListener('click', launchAPI);

function launchAPI() {
    console.log("Button Clicked!");
    blocmetrics.report();
}
var blocmetrics = {};

blocmetrics.report = function(eventName) {
    var event = {
        event: {
            name: 'electron-foobar'
        }
    };
    var request = new XMLHttpRequest();
    request.open("POST", "http://localhost:3000/api/events", true);
    request.setRequestHeader('Content-Type', 'application/json');
    request.send(JSON.stringify(event));
    console.log("Message Sent!")
}
```
