# Fake API
A simple Python web server used to display all HTTP calls made to it.

## Running
```bash
git clone git://github.com/c653labs/fake-api.git
cd ./fake-api
pipenv install

FLASK_APP="fake_api.app" pipenv run flask run
```

## API interface
You can now make HTTP requests to `http://127.0.0.1:5000/<path>`.

Fake API will respond to every endpoint with a `200` response and the following JSON response format

```json
{
  "body": "",
  "form": {},
  "headers": {
    "Accept": "*/*",
    "Host": "127.0.0.1:5000",
    "User-Agent": "curl/7.54.0"
  },
  "json": null,
  "method": "GET",
  "path": "test",
  "timestamp": "Thu, 03 May 2018 13:42:42 GMT"
}
```

## Web interface
Fake API has a very basic web interface which can be used to view the most recent requests made to it.

http://127.0.0.1:5000/

This interface does not auto-update, in order to see the latest requests you must refresh the page.

Fake API will only display the most recent 20 requests
